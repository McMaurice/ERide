//
//  ShowPasswordView.swift
//  ERide
//
//  Created by Macmaurice Osuji on 3/30/24.
//

import SwiftUI

struct PasswordFieldView: View {
    @EnvironmentObject var authenticationViewModel: AuthenticationViewModel
    @Binding var passwordField: String
    
    var body: some View {
        ZStack {
            if authenticationViewModel.showPassword {
                TextField("Password", text: $passwordField)
            } else {
                SecureField("Password", text: $passwordField)
            }
            HStack {
                Spacer()
                if !passwordField.isEmpty {
                    Image(systemName: authenticationViewModel.showPassword ? "eye" : "eye.slash")
                        .foregroundColor(Color.gray)
                        .onTapGesture {
                            authenticationViewModel.showPassword.toggle()
                        }
                        .padding(.trailing, authenticationViewModel.newInput ? 25 : 0)
                }
            }
        }
        .accentColor(.primary)
        .onAppear {
            authenticationViewModel.showPassword = false
        }
        .padding()
        .background(Color.gray.opacity(0.4))
        .cornerRadius(10)
        .onChange(of: passwordField) { newValue in
            authenticationViewModel.passwordIsGood = authenticationViewModel.isPasswordGood(password: newValue)
        }
    }
}

struct PasswordFieldView_Previews: PreviewProvider {
    static var previews: some View {
        EmailSignUpView()
            .environmentObject(AuthenticationViewModel())
    }
}
