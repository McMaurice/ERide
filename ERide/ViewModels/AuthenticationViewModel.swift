//
//  SignInEmailViewModel.swift
//  ERide
//
//  Created by Macmaurice Osuji on 3/29/24.
//

import Foundation

@MainActor
final class AuthenticationViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var showAuthenticationView = true
    
    func signUpWithEmail() async throws {
        guard !email.isEmpty, !password.isEmpty else {
            // add any alerts
            print("No email or password found")
            return
        }
        
        try await AuthenticationManager.shared.createUser(email: email, password: password)
    }
    
    func signInWithEmail() async throws {
        guard !email.isEmpty, !password.isEmpty else {
            // add any alerts
            print("No email or password found")
            return
        }
        
        try await AuthenticationManager.shared.signInUser(email: email, password: password)
    }
    
    func signOut() throws {
        try AuthenticationManager.shared.signOut()
    }
    
//    func resetPassword(email: String) async throws {
//        try await Auth.auth().sendPasswordReset(withEmail: email)
//    }
//    
////MARK: Updates in app while loged in
//    
//    func updatePassword(password: String) async throws {
//        guard let user = Auth.auth().currentUser else {
//            throw URLError(.badServerResponse)
//        }
//        try await user.updatePassword(to: password)
//    }
//    
//    func updateEmail(email: String) async throws {
//        guard let user = Auth.auth().currentUser else {
//            throw URLError(.badServerResponse)
//        }
//        try await user.sendEmailVerification(beforeUpdatingEmail: email)
//    }
    
    func isPasswordGood(password: String) -> Bool {
        let passwordRegex = "^(?=.*[0-9])(?=.*[^a-zA-Z0-9]).{8,}$"
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return passwordPredicate.evaluate(with: password)
    }
}
