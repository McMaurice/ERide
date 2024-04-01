//
//  HidePasswordView.swift
//  ERide
//
//  Created by Macmaurice Osuji on 3/30/24.
//

import SwiftUI

struct HidePasswordView: View {
    @EnvironmentObject var authenticationViewModel: AuthenticationViewModel
    @Binding var secondPasswordEntry: String
    @Binding var showPassword: Bool
    @Binding var passwordMatch: Bool
    @Binding var passwordIsGood: Bool
    
    var body: some View {
        VStack {
            HStack {
                SecureField("Password", text: $authenticationViewModel.password)
                if !authenticationViewModel.password.isEmpty {
                    Image(systemName: showPassword ? "eye" : "eye.slash")
                        .foregroundColor(Color.gray)
                        .onTapGesture {
                            showPassword.toggle()
                        }
                    ZStack {
                        Text(passwordIsGood ? "" : "Weak")
                        Image(systemName: passwordIsGood ? "checkmark.shield" : "")
                    }
                    .font(.system(size: 17, weight: .semibold, design: .rounded))
                    .foregroundColor(passwordIsGood ? .green : .red)
                    
                }
            }
            .padding()
            .background(Color.gray.opacity(0.4))
            .cornerRadius(10)
            
            HStack {
                SecureField("Confirm Password", text: $secondPasswordEntry)
                if !secondPasswordEntry.isEmpty {
                    Image(systemName: passwordIsGood ? "checkmark.shield" : "xmark.shield")
                        .font(.system(size: 17, weight: .semibold, design: .rounded))
                        .foregroundColor(passwordMatch ? .green : .red)
                }
                
            }
            .padding()
            .background(Color.gray.opacity(0.4))
            .cornerRadius(10)
        }
    }
}

struct HidePasswordView_Previews: PreviewProvider {
    static var previews: some View {
        EmailSignUpView()
            .environmentObject(AuthenticationViewModel())
    }
}
