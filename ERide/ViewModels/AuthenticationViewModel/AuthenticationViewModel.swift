//
//  SignInEmailViewModel.swift
//  ERide
//
//  Created by Macmaurice Osuji on 3/29/24.
//

import Foundation

@MainActor
final class AuthenticationViewModel: ObservableObject {
    var googleAuthenticationViewModel = GoogleAuthenticationViewModel()
    @Published var newEmail = ""
    @Published var newPassword = ""
    @Published var email = ""
    @Published var password = ""
    @Published var passwordIsGood = false
    @Published var passwordMatch = false
    @Published var showPassword = false
    @Published var emailIsGood = false
    @Published var newUser = false
    @Published var newInput = true
    @Published var showAuthenticationView = true
    @Published var authUser: AuthDataResultModel? = nil
    @Published var authProviders: [AuthProviderOption] = []
    
    func loadAuthProviders() {
        if let providers = try? FirebaseAuthenticationManager.shared.getProviders() {
            authProviders = providers
        }
    }
    
    func loadAuthUser() {
        self.authUser = try? FirebaseAuthenticationManager.shared.getAuthenticatedUser()
    }
    
    func signUpWithEmail() async throws {
        guard !email.isEmpty, !password.isEmpty else {
            // add any alerts
            print("No email or password found")
            return
        }
        let accountDetailsModel = AccountDetailsModel(email: "", familyName: "", givenName: "", otherName: "", userName: "", address: "", phoneNumber: "", profilePicture: nil, driverLicense: nil, dateOfBirth: Date(), age: 18, hasDriverLicense: false, isVerified: false, rating: 0)
        
        let accountViewModel = AccountViewModel(accountDetailsModel: accountDetailsModel)
        accountViewModel.updateUserDetails(email: email, givenName: "", familyName: "")
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
    
    func deleteUser() async throws {
        try await FirebaseAuthenticationManager.shared.deleteAcc()
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
    
    func signInAnonymously() async throws {
        try await FirebaseAuthenticationManager.shared.signInAnonymously()
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
    
    // MARK: ACCOUNTS TO EXISTING ACCOUNT
    func linkEmailAccount(email: String, password: String) async throws {
        self.authUser = try await FirebaseAuthenticationManager.shared.linkEmail(email: email, password: password)
    }

    func linkGoogleAccount() async throws {
        self.authUser = try await FirebaseAuthenticationManager.shared.linkGoogle(tokens: googleAuthenticationViewModel.googleHelper())
    }
   
    func linkAppleAccount() async throws {
       //self.authUser = try await FirebaseAuthenticationManager.shared.linkApple(tokens: a)
    }
    
}
