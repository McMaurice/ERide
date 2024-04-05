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
    @Published var passwordIsGood = false
    @Published var emailIsGood = false
    @Published var passwordMatch = false
    @Published var showPassword = false
    @Published var newUser = true
    @Published var authProviders: [AuthProviderOption] = []
    
    @Published var newEmail = ""
    @Published var newPassword = ""
    
    func loadAuthProviders() {
        if let providers = try? FirebaseAuthenticationManager.shared.getProviders() {
            authProviders = providers
        }
    }
    
    func signUpWithEmail() async throws {
        guard !email.isEmpty, !password.isEmpty else {
            // add any alerts
            print("No email or password found")
            return
        }
        
        try await FirebaseAuthenticationManager.shared.createUser(email: email, password: password)
    }
    
    func signInWithEmail() async throws {
        guard !email.isEmpty, !password.isEmpty else {
            // add any alerts
            print("No email or password found")
            return
        }
        
        try await FirebaseAuthenticationManager.shared.signInUser(email: email, password: password)
    }
    
    func signOut() throws {
        try FirebaseAuthenticationManager.shared.signOut()
    }
    
    func resetPassword() async throws {
        guard !email.isEmpty else {
            // add any alerts
            print("No email found")
            return
        }
        try await FirebaseAuthenticationManager.shared.resetPassword(email: email)
    }
    
    func updatePassword() async throws {
        guard !newPassword.isEmpty else {
            // add any alerts
            print("No email found")
            return
        }
        try await FirebaseAuthenticationManager.shared.updatePassword(password: newPassword)
    }
    
    func updateEmail() async throws {
        guard !newEmail.isEmpty else {
            // add any alerts
            print("No email found")
            return
        }
        
        try await FirebaseAuthenticationManager.shared.updateEmail(email: newEmail)
    }
 
    func isValidEmail(email: String) -> Bool {
        let emailRegex = #"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}$"#
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    func isPasswordGood(password: String) -> Bool {
        let passwordRegex = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[^A-Za-z\\d]).{8,}$"
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return passwordPredicate.evaluate(with: password)
    }
}
