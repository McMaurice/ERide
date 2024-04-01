//
//  ForgotPasswordView.swift
//  ERide
//
//  Created by Macmaurice Osuji on 3/30/24.
//

import SwiftUI

struct ForgotPasswordView: View {
    @EnvironmentObject var authenticationViewModel: AuthenticationViewModel
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                TextField("Email", text: $authenticationViewModel.email)
                    .padding()
                    .background(Color.gray.opacity(0.4))
                    .cornerRadius(10)
                
                Button {
//                    Task {
//                        do {
//                            try await authenticationViewModel.forgotPassword()
//                            return
//                        } catch {
//
//                        }
//                    }
                } label: {
                    Text("Reset Password")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }
            .padding()
            .navigationTitle("Reset your password")
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
