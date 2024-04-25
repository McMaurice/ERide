//
//  ProfileView.swift
//  ERide
//
//  Created by Macmaurice Osuji on 4/11/24.
//

import SwiftUI

struct AccountView: View {
    @EnvironmentObject var authenticationViewModel: AuthenticationViewModel
    @ObservedObject var userViewModel = UserViewModel()
    
    var body: some View {
        NavigationStack {
            AccountHeaderView()
            List {
                Section {
                    ForEach(userViewModel.userDetails.indices, id: \.self) { index in
                        HStack {
                            Image(systemName: userViewModel.detailsIcon[index])
                                .foregroundColor(.accentColor)
                            Text(userViewModel.userDetails[index])
                                .fontWeight(.semibold)
                        }
                    }
                    .modifier(CleanListModifier())
                }
                Section {
                    ForEach(userViewModel.eRideOptions, id: \.self) { option in
                        NavigationLink(destination: userViewModel.eRideOptionsdestinationView(for: option)) {
                            Text(option)
                        }
                    }
                    .modifier(CleanListModifier())
                } header: {
                    Text("ERide")
                        .foregroundColor(.accentColor)
                }
                
                Section {
                    ForEach(userViewModel.settingsOptions, id: \.self) { option in
                        NavigationLink(destination: userViewModel.settingsOptionsdestinationView(for: option)) {
                            Text(option)
                        }
                    }
                    .modifier(CleanListModifier())
                    
                    HStack {
                        Spacer()
                        Button {
                            Task {
                                do {
                                    try authenticationViewModel.signOut()
                                    authenticationViewModel.showAuthenticationView = true
                                } catch {
                                    print(error)
                                }
                            }
                        } label: {
                            Text("Log out")
                                .foregroundColor(.accentColor)
                        }
                        Spacer()
                    }
                    .listRowSeparator(.hidden)
                } header: {
                    Text("Settings")
                        .foregroundColor(.accentColor)
                }
            }
            .scrollIndicators(.hidden)
            .listStyle(.plain)
            .navigationTitle("Account Management")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
            .environmentObject(AuthenticationViewModel())
    }
}
