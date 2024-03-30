//
//  EmailSignUp.swift
//  ERide
//
//  Created by Macmaurice Osuji on 3/29/24.
//

import SwiftUI
import Foundation

struct EmailSignUpView: View {
    @StateObject private var viewModel = SignInEmailViewModel()
    @State private var secondPasswordEntry = ""
    @State private var passwordIsGood = false
    @State private var passwordMatch = false
    @State private var showPassword = false
    @Binding var showSignInView: Bool
    
    
    var body: some View {
        VStack {
            VStack {
                Image("signup")
                    .resizable()
                    .scaledToFit()
            }
            TextField("Email", text: $viewModel.email)
                .padding()
                .background(Color.gray.opacity(0.4))
                .foregroundColor(secondaryAccentColor)
                .cornerRadius(10)
                .padding(.bottom)
            
            Section {
                if showPassword {
                    ShowPasswordView(viewModel: viewModel, secondPasswordEntry: $secondPasswordEntry, showPassword: $showPassword, passwordMatch: $passwordMatch, passwordIsGood: $passwordIsGood)
                    
                } else {
                    HidePasswordView(viewModel: viewModel, secondPasswordEntry: $secondPasswordEntry, showPassword: $showPassword, passwordMatch: $passwordMatch, passwordIsGood: $passwordIsGood)
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
                        try await viewModel.signUp()
                        showSignInView = false
                        return
                    } catch {
                        
                    }
                    do {
                        try await viewModel.signIn()
                        showSignInView = false
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
        .onChange(of: viewModel.password) { newValue in
            passwordIsGood = viewModel.isPasswordGood(password: newValue)
        }
        .onChange(of: secondPasswordEntry) { newValue in
            if newValue == viewModel.password {
                passwordMatch = true
            }
        }
    }
}
struct EmailSignUp_Previews: PreviewProvider {
    static var previews: some View {
        EmailSignUpView(showSignInView: .constant(false))
    }
}




