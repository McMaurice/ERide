//
//  AppleAuthenticationViewModel.swift
//  ERide
//
//  Created by Macmaurice Osuji on 4/5/24.
//

import Foundation
import AuthenticationServices
import CryptoKit

@MainActor
final class AppleAuthenticationViewModel: NSObject, ObservableObject {
    
    private var currentNonce: String?
    @Published var didSignInWithApple: Bool = false
    
    func signInAple() async throws {
       startSignInWithAppleFlow()
    }

    func startSignInWithAppleFlow() {
        guard let topViewController = Utilities.shared.topViewController() else {
            return
        }
        
        let nonce = randomNonceString()
        currentNonce = nonce
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        request.nonce = sha256(nonce)
        
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = topViewController
        authorizationController.performRequests()
    }
    
    private func randomNonceString(length: Int = 32) -> String {
        precondition(length > 0)
        var randomBytes = [UInt8](repeating: 0, count: length)
        let errorCode = SecRandomCopyBytes(kSecRandomDefault, randomBytes.count, &randomBytes)
        if errorCode != errSecSuccess {
            fatalError(
                "Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)"
            )
        }
        
        let charset: [Character] =
        Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
        
        let nonce = randomBytes.map { byte in
            // Pick a random character from the set, wrapping around if needed.
            charset[Int(byte) % charset.count]
        }
        
        return String(nonce)
    }
    
    @available(iOS 13, *)
    private func sha256(_ input: String) -> String {
      let inputData = Data(input.utf8)
      let hashedData = SHA256.hash(data: inputData)
      let hashString = hashedData.compactMap {
        String(format: "%02x", $0)
      }.joined()

      return hashString
    }
}

extension AppleAuthenticationViewModel: ASAuthorizationControllerDelegate {
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        
        guard
            let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential,
            let appleIDToken = appleIDCredential.identityToken,
            let idTokenString = String(data: appleIDToken, encoding: .utf8),
            let nonce = currentNonce else {
            print("error")
            return
        }
        
        //MARK: GET USERS DETAILS HERE
        let email = appleIDCredential.email
        let familyName = appleIDCredential.fullName?.familyName
        let givenName = appleIDCredential.fullName?.givenName
        let tokens = AppleSignInResultModel(token: idTokenString, nonce: nonce)
        
        Task {
            do {
                try await FirebaseAuthenticationManager.shared.signInWithApple(tokens: tokens)
                didSignInWithApple = true
            } catch {
                
            }
        }
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        // Handle error.
        print("Sign in with Apple errored: \(error)")
    }
    
}

//MARK: MAKES THE TOP VIEW CONTROLLER THE DELEGATE
extension UIViewController: ASAuthorizationControllerPresentationContextProviding {
    
    public func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
}
