//
//  HomeView.swift
//  ERide
//
//  Created by Macmaurice Osuji on 3/31/24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var authenticationViewModel: AuthenticationViewModel
    @State private var newPasswordField = "testing@gmail.com"
    @State private var newEmailFiel = "testing"
    
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
            .navigationTitle("Welcome boss")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(AuthenticationViewModel())
    }
}
