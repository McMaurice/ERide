//
//  HomeView.swift
//  ERide
//
//  Created by Macmaurice Osuji on 3/31/24.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var authenticationViewModel: AuthenticationViewModel
    
    var body: some View {
        NavigationStack {
            List {
                Button("Log out") {
                    Task {
                        do {
                            try authenticationViewModel.signOut()
                            authenticationViewModel.showAuthenticationView = true
                        } catch {
                            print(error)
                        }
                    }
                }
                
                if authenticationViewModel.authProviders.contains(.email) {
                    ExtractedView()
                }
            }
            .navigationTitle("Welcome boss")
            .onAppear {
                authenticationViewModel.loadAuthProviders()
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(AuthenticationViewModel())
    }
}

struct ExtractedView: View {
    @EnvironmentObject var authenticationViewModel: AuthenticationViewModel
    @State private var newPasswordField = "testing@gmail.com"
    @State private var newEmailFiel = "testing"
    
    var body: some View {
        Section {
            Button("Update Password") {
                authenticationViewModel.newPassword = newPasswordField
                Task {
                    do {
                        try await authenticationViewModel.updatePassword()
                        print("Password Updated")
                    } catch {
                        // Notification to log out and log back in
                    }
                }
            }
            Button("Update Email") {
                authenticationViewModel.newEmail = newEmailFiel
                Task {
                    do {
                        try await authenticationViewModel.updateEmail()
                        print("Email Updated")
                    } catch {
                        // Notification to log out and log back in
                    }
                }
            }
        }
    }
}
