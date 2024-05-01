//
//  AuthenticationManger.swift
//  ERide
//
//  Created by Macmaurice Osuji on 3/28/24.
//

// MARK: FIREBASE SDK CODES

import Foundation
import FirebaseAuth

enum AuthProviderOption: String {
    case email = "password"
    case google = "google.com"
    case apple = "apple.com"
}

final class FirebaseAuthenticationManager {
    
    static let shared = FirebaseAuthenticationManager()
    private init() {}
    
    // MARK: FETCHES AN EXISTING USER LOCALY
    func getAuthenticatedUser() throws -> AuthDataResultModel {
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badServerResponse)
        }
        return AuthDataResultModel(user: user)
    }
    
    // MARK: SIGNS OUT A USER IN THE APP
    func signOut() throws {
        try Auth.auth().signOut()
    }
    
    func deleteAcc() async throws {
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badURL)
        }
        try await user.delete()
    }
    
    // MARK: GETS THE SPECIFIC METHOD A USER SIGNS IN WITH
    func getProviders() throws -> [AuthProviderOption] {
        guard let providerData = Auth.auth().currentUser?.providerData else {
            throw URLError(.badServerResponse)
        }
        var providers: [AuthProviderOption] = []
        for provider in providerData {
            if let option = AuthProviderOption(rawValue: provider.providerID) {
                providers.append(option)
            } else {
                assertionFailure("Provider option not found: \(provider.providerID)")
            }
        }
        return providers
    }
}

// MARK: EMAIL AND PASSWORD SIGN IN
extension FirebaseAuthenticationManager {
    
    // MARK: CREATING A NEW USER
    @discardableResult
    func createUser(email: String, password: String) async throws -> AuthDataResultModel {
        let authDataResult = try await Auth.auth().createUser(withEmail: email, password: password)
        return AuthDataResultModel(user: authDataResult.user)
    }
  
    // MARK: SIGNS AN EXISTING USER IN WITHOUT CREATING ANOTHER ACCOUNT
    @discardableResult
    func signInUser(email: String, password: String) async throws -> AuthDataResultModel {
        let authDataResult = try await Auth.auth().signIn(withEmail: email, password: password)
        return AuthDataResultModel(user: authDataResult.user)
    }
    
    // MARK: GETS AN EMAIL LINK TO RESET PASSWORD
    func resetPassword(email: String) async throws {
        try await Auth.auth().sendPasswordReset(withEmail: email)
    }
    
    // MARK: GETS AN EMAIL LINK TO RESET PASSWORD
    func updatePassword(password: String) async throws {
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badServerResponse)
        }
        try await user.updatePassword(to: password)
    }
    
    func updateEmail(email: String) async throws {
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badServerResponse)
        }
        try await user.sendEmailVerification(beforeUpdatingEmail: email)
    }
}

// MARK: SSO SIGN IN
extension FirebaseAuthenticationManager {
    
    @discardableResult
    func signInWithGoogle(tokens: GoogleSignInResultModel) async throws -> AuthDataResultModel {
        let credential = GoogleAuthProvider.credential(withIDToken: tokens.idToken, accessToken: tokens.accessToken)
        return try await signInWithCredentials(credential: credential)
    }
    
    @discardableResult
    func signInWithApple(tokens: AppleSignInResultModel) async throws -> AuthDataResultModel {
        let credential = OAuthProvider.credential(withProviderID: AuthProviderOption.apple.rawValue, idToken: tokens.token, rawNonce: tokens.nonce)
        return try await signInWithCredentials(credential: credential)
    }
    
    //MARK: ALL CREDENTIAL SIGN IN
    func signInWithCredentials(credential: AuthCredential) async throws -> AuthDataResultModel {
        let authDataResult = try await Auth.auth().signIn(with: credential)
        return AuthDataResultModel(user: authDataResult.user)
    }
}

// MARK: ANONYMOUS SIGN IN
extension FirebaseAuthenticationManager {
    
    @discardableResult
    func signInAnonymously() async throws -> AuthDataResultModel {
        let authDataResult = try await Auth.auth().signInAnonymously()
        return AuthDataResultModel(user: authDataResult.user)
    }
    
    private func linkCredentials(credential: AuthCredential) async throws -> AuthDataResultModel {
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badURL)
        }
        let authDataResult = try await user.link(with: credential)
        return AuthDataResultModel(user: authDataResult.user)
    }
    
    func linkEmail(email: String, password: String) async throws -> AuthDataResultModel {
        let credential = EmailAuthProvider.credential(withEmail: email, password: password)
        return try await linkCredentials(credential: credential)
    }
    
    func linkApple(tokens: AppleSignInResultModel) async throws -> AuthDataResultModel {
        let credential = OAuthProvider.credential(withProviderID: AuthProviderOption.apple.rawValue, idToken: tokens.token, rawNonce: tokens.nonce)
        return try await linkCredentials(credential: credential)
    }

    func linkGoogle(tokens: GoogleSignInResultModel) async throws -> AuthDataResultModel {
        let credential = GoogleAuthProvider.credential(withIDToken: tokens.idToken, accessToken: tokens.accessToken)
        return try await linkCredentials(credential: credential)
    }
}
