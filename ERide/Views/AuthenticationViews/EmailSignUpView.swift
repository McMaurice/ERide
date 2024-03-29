//
//  EmailSignUp.swift
//  ERide
//
//  Created by Macmaurice Osuji on 3/29/24.
//

import SwiftUI

struct EmailSignUpView: View {
    @StateObject private var viewModel = SignInEmailViewModel()
    @State private var passwordIsGood = false
    @State private var passwordMatch = false
    @Binding var showSignInView: Bool
    
    
    var body: some View {
        NavigationStack {
            VStack {
                Image("signup")
                    .resizable()
                    .scaledToFit()
            }
            TextField("Email", text: $viewModel.email)
                .padding()
                .background(Color.gray.opacity(0.4))
                .foregroundColor(.secondary)
                .cornerRadius(10)
                .padding(.bottom)
            Section {
                SecureField("Password", text: $viewModel.password)
                    .padding()
                    .background(Color.gray.opacity(0.4))
                    .foregroundColor(passwordIsGood ? .green : .red)
                    .cornerRadius(10)
                
                SecureField("Confirm Password", text: $viewModel.password)
                    .padding()
                    .background(Color.gray.opacity(0.4))
                    .foregroundColor(passwordMatch ? .green : .red)
                    .cornerRadius(10)
            } footer: {
                Text("Password must be at least 8 characters long, with atleaste a number and a special character.")
                    .font(.subheadline)
            }
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
                Text("Sign In")
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
        .navigationTitle("Sign up with Email")
    }
}


struct EmailSignUp_Previews: PreviewProvider {
    static var previews: some View {
        EmailSignUpView(showSignInView: .constant(false))
    }
}
