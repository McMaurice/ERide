//
//  EmailFieldView.swift
//  ERide
//
//  Created by Macmaurice Osuji on 4/4/24.
//

import SwiftUI

struct EmailFieldView: View {
    @EnvironmentObject var authenticationViewModel: AuthenticationViewModel
    @FocusState private var usernameInFocus: Bool
    @Binding var emailField: String
    
    var body: some View {
        VStack {
            ZStack {
                TextField("", text: $emailField)
                    .focused($usernameInFocus)
                    .padding(.horizontal, 10)
                    .frame(height: 50)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                HStack {
                    Text("Email")
                        .font(.system(.subheadline, design: .monospaced, weight: .semibold))
                        .foregroundColor(.accentColor)
                        .padding(5)
                        .background(Utilities.shared.isDarkMode() ? .black : .white)
                    Spacer()
                }
                .padding(.leading, 10)
                .offset(x: 0, y: -25)
                if !emailField.isEmpty {
                    HStack {
                        Spacer()
                        Image(systemName: authenticationViewModel.emailIsGood ? "checkmark.shield" : "xmark.shield")
                            .font(.system(size: 17, weight: .semibold, design: .rounded))
                            .foregroundColor(authenticationViewModel.emailIsGood ? .green : .red)
                    }
                    .padding(.trailing)
                }
            }
            .onChange(of: emailField) { newValue in
                authenticationViewModel.emailIsGood = authenticationViewModel.isValidEmail(email: newValue)
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.usernameInFocus = true
                }
            }
        }
    }
}

struct EmailFieldView_Previews: PreviewProvider {
    static var previews: some View {
        EmailSignUpView()
            .environmentObject(AuthenticationViewModel())
    }
}
