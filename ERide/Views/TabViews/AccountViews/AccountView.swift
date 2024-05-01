//
//  ProfileView.swift
//  ERide
//
//  Created by Macmaurice Osuji on 4/11/24.
//

import SwiftUI

struct AccountView: View {
    @EnvironmentObject var authenticationViewModel: AuthenticationViewModel
    @EnvironmentObject var accountViewModel: AccountViewModel
    
    var body: some View {
        NavigationStack {
            AccountHeaderView()
            List {
                Section {
//                    ForEach(accountViewModel.userDetails.indices, id: \.self) { index in
//                        HStack {
//                            Image(systemName: accountViewModel.detailsIcon[index])
//                                .foregroundColor(.accentColor)
//                            Text(accountViewModel.userDetails[index])
//                                .fontWeight(.semibold)
//                        }
 //                   }
 //                   .modifier(CleanListModifier())
                }
                Section {
                    ForEach(accountViewModel.eRideOptions, id: \.self) { option in
                        NavigationLink(destination: accountViewModel.eRideOptionsdestinationView(for: option)) {
                            Text(option)
                        }
                    }
                    .modifier(CleanListModifier())
                } header: {
                    Text("ERide")
                        .foregroundColor(.accentColor)
                }
                
                Section {
                    ForEach(accountViewModel.settingsOptions, id: \.self) { option in
                        NavigationLink(destination: accountViewModel.settingsOptionsdestinationView(for: option)) {
                            Text(option)
                        }
                    }
                    .modifier(CleanListModifier())
                    
                    HStack {
                        Spacer()
                        if authenticationViewModel.authUser?.isAnonymous == false {
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
            .onAppear { authenticationViewModel.loadAuthUser() }
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
            .environmentObject(AuthenticationViewModel())
            .environmentObject(AccountViewModel(accountDetailsModel: AccountDetailsModel(email: "", familyName: "", givenName: "", otherName: "", userName: "", address: "", phoneNumber: "", dateOfBirth: Date(), age: 18, hasDriverLicense: false, isVerified: false, rating: 3)))
    }
}
