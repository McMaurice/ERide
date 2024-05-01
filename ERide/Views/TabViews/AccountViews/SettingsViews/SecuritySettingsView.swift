//
//  HomeView.swift
//  ERide
//
//  Created by Macmaurice Osuji on 3/31/24.
//

import SwiftUI

struct SecuritySettingsView: View {
    @EnvironmentObject var authenticationViewModel: AuthenticationViewModel
    
    let appName: String = Bundle.main.infoDictionary?["CFBundleName"] as! String
    let appVersion: String = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    if authenticationViewModel.authProviders.contains(.email) {
                        Section {
                            Button("Update Password") {
                                authenticationViewModel.newPassword = "newPasswordField"
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
                                authenticationViewModel.newEmail = "newEmailFiel"
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
                    
                    if authenticationViewModel.authUser?.isAnonymous == true {
                        Section {
                            Button("Link Email and Password") {
                                Task {
                                    do {
                                        try await authenticationViewModel.linkEmailAccount(email: "linkedemail@gmail.com", password: "linkedpassword")
                                        print("Email Linked")
                                    } catch {
                                        print(error)
                                    }
                                }
                            }
                            Button("Link Google Account") {
                                Task {
                                    do {
                                        try await authenticationViewModel.linkGoogleAccount()
                                        print("Google Linked")
                                    } catch {
                                        print(error)
                                    }
                                }
                            }
                            Button("Link Apple Account") {
                                Task {
                                    do {
                                        try await authenticationViewModel.linkAppleAccount()
                                        print("Apple Linked")
                                    } catch {
                                        print(error)
                                    }
                                }
                            }
                        } header: {
                            Text("Secure your guest account")
                        }
                    }
                    
                    Button(role: .destructive) {
                        Task {
                            do {
                                try await authenticationViewModel.deleteUser()
                                authenticationViewModel.showAuthenticationView = true
                                print("Account Deleted")
                            } catch {
                                // Notification to log out and log back in
                            }
                        }
                    } label: {
                        Text("Delete Account")
                    }
                    Section {
                        VStack {
                            Spacer()
                            Text(appName)
                            Text("Version: \(appVersion)")
                            Spacer()
                        }
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.gray)
                        .modifier(CleanListModifier())
                    }
                }
                .navigationTitle("Security Settings")
                .onAppear {
                    authenticationViewModel.loadAuthUser()
                    authenticationViewModel.loadAuthProviders()
                }
            }
        }
    }
}

struct SecuritySettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SecuritySettingsView()
            .environmentObject(AuthenticationViewModel())
    }
}
