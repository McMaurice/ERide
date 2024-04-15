//
//  EmailSignUp.swift
//  ERide
//
//  Created by Macmaurice Osuji on 3/29/24.
//

import SwiftUI

struct EmailSignUpView: View {
    @EnvironmentObject var authenticationViewModel: AuthenticationViewModel
    @State private var emailField = ""
    @State private var passwordField = ""
    @State private var passwordConfirmationField = ""
   
    var body: some View {
        VStack {
            VStack {
                Image("sign_up")
                    .resizable()
                    .scaledToFit()
            }
            Section {
                EmailFieldView(emailField: $emailField)
                    .padding(.bottom)
                Group {
                    ZStack {
                        PasswordFieldView(passwordField: $passwordField)
                        if !passwordField.isEmpty {
                            HStack {
                                Spacer()
                                Image(systemName: authenticationViewModel.passwordIsGood ? "checkmark.shield" : "xmark.shield")
                                    .font(.system(size: 17, weight: .semibold, design: .rounded))
                                    .foregroundColor(authenticationViewModel.passwordIsGood ? .green : .red)
                                    .padding()
                            }
                        }
                    }
                    ConfirmPasswordFieldView(passwordConfirmationField: $passwordConfirmationField, passwordField: $passwordField)
                }
            } footer: {
                Text("Password must be at least 8 characters long, with atleaste a letter, number and a special character.")
                    .italic()
                    .font(.subheadline)
            }
            .textInputAutocapitalization(.never)
            .keyboardType(.asciiCapable) // This avoids suggestions bar on the keyboard.
            .autocorrectionDisabled(true)
            
            Button {
                authenticationViewModel.email = emailField
                authenticationViewModel.password = passwordField
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
                    .modifier(LongButtonModifier())
            }
            .padding(.top)
        }
        .padding()
    }
}
struct EmailSignUp_Previews: PreviewProvider {
    static var previews: some View {
        EmailSignUpView()
            .environmentObject(AuthenticationViewModel())
    }
}




