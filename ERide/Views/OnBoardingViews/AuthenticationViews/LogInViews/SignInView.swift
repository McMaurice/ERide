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
    @State private var showSheet = false
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack {
                    Image("log_in")
                        .resizable()
                        .scaledToFit()
                    VStack(spacing: 15) {
                        EmailFieldView(emailField: $emailField)
                        
                        PasswordFieldView(passwordField: $passwordField)
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
                            .background(.blue)
                            .cornerRadius(20)
                            .shadow(radius: 15)
                    }
                    HStack {
                        Text("Forgot your password?")
                        Text("Reset password.")
                            .foregroundColor(.blue)
                            .onTapGesture {
                                showSheet.toggle()
                            }
                    }
                }
                .padding(.top)
                .navigationTitle("Welcome back!")
                .navigationBarTitleDisplayMode(.large)
                .background {
                    ShapesView()
                        .ignoresSafeArea()
                        
                }
                .padding()
                .onAppear {
                    authenticationViewModel.newUser = false
                    withAnimation(.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 0.4)) {
                        animateView = true
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        self.usernameInFocus = true}
                }
                .onDisappear {
                    authenticationViewModel.newUser = true
                    //animateView = false
                }
                .sheet(isPresented: $showSheet) {
                    ForgotPasswordView()
                }
            }
        }
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
            .environmentObject(AuthenticationViewModel())
    }
}
