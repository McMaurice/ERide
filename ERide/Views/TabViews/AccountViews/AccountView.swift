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
            VStack {
                VStack {
                    VStack(spacing: 2) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 25)
                                .fill(Color.clear)
                                .frame(width: 150, height: 150)
                                .overlay {
                                    Image(systemName: "person.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .padding(4)
                                }
                            
                            HStack(spacing: 50) {
                                Text("ID")
                                Text("DL")
                            }
                            .padding(.top, 120)
                            .foregroundColor(.blue)
                            .font(.system(.title2, design: .rounded, weight: .semibold))
                        }
                        Text("@username")
                    }
                    .background {
                        Circle()
                            .fill(
                                LinearGradient(colors: [.accentColor, secondaryAccentColor],
                                               startPoint: .topLeading,
                                               endPoint: .bottomTrailing)
                            )
                            .frame(width: 500, height: 500)
                            .offset(y: -50)
                            .shadow(radius: 15)
                    }
                    
                    HStack(spacing: 120) {
                        VStack(spacing: 5) {
                            Text("Cars Rented")
                            Text("4")
                                .font(.system(size: 20, weight: .semibold, design: .monospaced))
                        }
                        VStack(spacing: 5) {
                            Text("Cars Published")
                            Text("10")
                                .font(.system(size: 20, weight: .semibold, design: .monospaced))
                        }
                    }
                    .padding(.top, 2)
                }
                .padding(.bottom, 40)
                VStack {
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
                                    Text("Log out gr")
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
                    
                    
                }
                
                
            }
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
