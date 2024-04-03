//
//  LogInView.swift
//  ERide
//
//  Created by Macmaurice Osuji on 3/30/24.
//

import SwiftUI

struct SignInView: View {
    @EnvironmentObject var authenticationViewModel: AuthenticationViewModel
    @FocusState private var usernameInFocus: Bool
    
    @State private var emailField = ""
    @State private var passwordField = ""
    @State private var animateView = false
    @State private var showPassword = false
    
    var body: some View {
        NavigationStack {
            Image("logo")
                .resizable()
                .scaledToFit()
                .offset(y: -50)
            
            VStack(spacing: 15) {
                TextField("Email", text: $emailField)
                    .focused($usernameInFocus)
                    .padding()
                    .background(Color.gray.opacity(0.4))
                    .cornerRadius(10)
                
                VStack {
                    if showPassword {
                        HStack {
                            TextField("Password", text: $passwordField)
                            if !authenticationViewModel.password.isEmpty {
                                Image(systemName: showPassword ? "eye" : "eye.slash")
                                    .foregroundColor(Color.gray)
                                    .onTapGesture {
                                        showPassword.toggle()
                                    }
                            }
                        }
                    } else {
                        HStack {
                            SecureField("Password", text: $passwordField)
                            if !authenticationViewModel.password.isEmpty {
                                Image(systemName: showPassword ? "eye" : "eye.slash")
                                    .foregroundColor(Color.gray)
                                    .onTapGesture {
                                        showPassword.toggle()
                                    }
                            }
                        }
                    }
                }
                .padding()
                .background(Color.gray.opacity(0.4))
                .cornerRadius(10)
            }
            .padding(.bottom)
            .offset(x: animateView ? 0 : 350)
            .textInputAutocapitalization(.never)
            .keyboardType(.asciiCapable) // This avoids suggestions bar on the keyboard.
            .autocorrectionDisabled(true)
            
            Button {
                authenticationViewModel.email = emailField
                authenticationViewModel.password = passwordField
                Task {
                    do {
                        try await authenticationViewModel.signInWithEmail()
                        authenticationViewModel.showAuthenticationView = false
                        return
                    } catch {
                        
                    }
                }
            } label: {
                Text("Log In")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            HStack {
                Text("Forgot your password?")
                NavigationLink("Reset password.") {
                    ForgotPasswordView()
                }
            }
            .onAppear {
                withAnimation(.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 0.4)) {
                    animateView = true
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.usernameInFocus = true}
            }
            .onDisappear {
                animateView = false
            }
            .navigationTitle("Welcome back!")
            .navigationBarTitleDisplayMode(.large)
            Spacer()
        }
        .padding()
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
            .environmentObject(AuthenticationViewModel())
    }
}
