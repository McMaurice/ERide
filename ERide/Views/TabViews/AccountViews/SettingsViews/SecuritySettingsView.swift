//
//  HomeView.swift
//  ERide
//
//  Created by Macmaurice Osuji on 3/31/24.
//

import SwiftUI

struct SecuritySettingsView: View {
    @EnvironmentObject var authenticationViewModel: AuthenticationViewModel
    @State private var newPasswordField = "testing@gmail.com"
    @State private var newEmailFiel = "testing"
    
    let appName: String = Bundle.main.infoDictionary?["CFBundleName"] as! String
    let appVersion: String = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    if !authenticationViewModel.authProviders.contains(.email) {
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
                    
                    Button("Delete Account") {
                        Task {
                        //
                        }
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
