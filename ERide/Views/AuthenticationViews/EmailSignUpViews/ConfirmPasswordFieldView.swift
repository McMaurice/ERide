//
//  HidePasswordView.swift
//  ERide
//
//  Created by Macmaurice Osuji on 3/30/24.
//

import SwiftUI

struct ConfirmPasswordFieldView: View {
    @EnvironmentObject var authenticationViewModel: AuthenticationViewModel
    @Binding var passwordConfirmationField: String
    @Binding var passwordField: String
    
    var body: some View {
        ZStack {
            if authenticationViewModel.showPassword {
                TextField("Confirm Password", text: $passwordConfirmationField)
            } else {
                SecureField("Confirm Password", text: $passwordConfirmationField)
            }
            HStack {
                Spacer()
                if !passwordConfirmationField.isEmpty {
                    Image(systemName: authenticationViewModel.passwordMatch ? "checkmark.shield" : "xmark.shield")
                        .font(.system(size: 17, weight: .semibold, design: .rounded))
                        .foregroundColor(authenticationViewModel.passwordMatch ? .green : .red)
                }
            }
        }
        .accentColor(.primary)
        .padding()
        .background(Color.gray.opacity(0.4))
        .cornerRadius(10)
        .onChange(of: passwordConfirmationField) { newValue in
            if newValue == passwordField {
                authenticationViewModel.passwordMatch = true
            } else {
                authenticationViewModel.passwordMatch = false
            }
        }
    }
}

struct ConfirmPasswordFieldView_Previews: PreviewProvider {
    static var previews: some View {
        EmailSignUpView()
            .environmentObject(AuthenticationViewModel())
    }
}

