//
//  ForgotPasswordView.swift
//  ERide
//
//  Created by Macmaurice Osuji on 3/30/24.
//

import SwiftUI

struct ForgotPasswordView: View {
    @EnvironmentObject var authenticationViewModel: AuthenticationViewModel
    @Environment(\.dismiss) var dismiss
    @FocusState private var usernameInFocus: Bool
    @State private var emailField = ""
    @State private var showNotification = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                EmailFieldView(emailField: $emailField)
                    .textInputAutocapitalization(.never)
                    .keyboardType(.asciiCapable) // This avoids suggestions bar on the keyboard.
                    .autocorrectionDisabled(true)
                Button {
                    authenticationViewModel.email = emailField
                    Task {
                        do {
                            try await authenticationViewModel.resetPassword()
                            showNotification.toggle()
                        } catch {

                        }
                    }
                   // dismiss()
                } label: {
                    Text("Reset Password")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .shadow(radius: 15)
                }
                
                VStack {
                    Image("forgot_password")
                        .resizable()
                        .scaledToFit()
                }
            }
            .padding()
            .navigationTitle("Reset your password")
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.usernameInFocus = true}
            }
            Spacer()
        }
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
            .environmentObject(AuthenticationViewModel())
    }
}
