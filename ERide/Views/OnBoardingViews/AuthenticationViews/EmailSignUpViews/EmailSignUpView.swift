//
//  EmailSignUp.swift
//  ERide
//
//  Created by Macmaurice Osuji on 3/29/24.
//

import SwiftUI
import Foundation

struct EmailSignUpView: View {
    @EnvironmentObject var authenticationViewModel: AuthenticationViewModel
    @FocusState private var usernameInFocus: Bool
    @State private var secondPasswordEntry = ""
    @State private var passwordIsGood = false
    @State private var passwordMatch = false
    @State private var showPassword = false
    
    
    var body: some View {
        VStack {
            VStack {
                Image("signup")
                    .resizable()
                    .scaledToFit()
            }
            TextField("Email", text: $authenticationViewModel.email)
                .focused($usernameInFocus)
                .padding()
                .background(Color.gray.opacity(0.4))
                .foregroundColor(secondaryAccentColor)
                .cornerRadius(10)
                .padding(.bottom)
            
            Section {
                if showPassword {
                    ShowPasswordView(secondPasswordEntry: $secondPasswordEntry, showPassword: $showPassword, passwordMatch: $passwordMatch, passwordIsGood: $passwordIsGood)
                    
                } else {
                    HidePasswordView(secondPasswordEntry: $secondPasswordEntry, showPassword: $showPassword, passwordMatch: $passwordMatch, passwordIsGood: $passwordIsGood)
                }
            } footer: {
                Text("Password must be at least 8 characters long, with atleaste a number and a special character.")
                    .font(.subheadline)
            }
            .textInputAutocapitalization(.never)
            .keyboardType(.asciiCapable) // This avoids suggestions bar on the keyboard.
            .autocorrectionDisabled(true)
            
            Button {
                Task {
                    do {
                        try await authenticationViewModel.signUpWithEmail()
                        authenticationViewModel.showAuthenticationView = false
                        return
                    } catch {
                        
                    }
                }
            } label: {
                Text("Sign up")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.accentColor)
                    .cornerRadius(10)
            }
            .padding(.top)
        }
        .padding()
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.usernameInFocus = true}
        }
        .onChange(of: authenticationViewModel.password) { newValue in
            passwordIsGood = authenticationViewModel.isPasswordGood(password: newValue)
        }
        .onChange(of: secondPasswordEntry) { newValue in
            if newValue == authenticationViewModel.password {
                passwordMatch = true
            }
        }
    }
}
struct EmailSignUp_Previews: PreviewProvider {
    static var previews: some View {
        EmailSignUpView()
            .environmentObject(AuthenticationViewModel())
    }
}




