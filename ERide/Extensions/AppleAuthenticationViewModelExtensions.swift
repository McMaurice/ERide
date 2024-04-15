//
//  AppleAuthenticationViewModelExtensions.swift
//  ERide
//
//  Created by Macmaurice Osuji on 4/15/24.
//

import Foundation
import AuthenticationServices
import CryptoKit

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
        
        let tokens = AppleSignInResultModel(token: idTokenString, nonce: nonce)
        
        //MARK: GET USERS DETAILS HERE
        let userProfileViewModel = UserViewModel()
        if let email = appleIDCredential.email,
           let familyName = appleIDCredential.fullName?.familyName,
           let givenName = appleIDCredential.fullName?.givenName {
            
            userProfileViewModel.updateUserDetails(email: email, givenName: givenName, familyName: familyName)
            
        } else {
            print("User has no details")
        }
        
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
