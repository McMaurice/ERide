//
//  ContentView.swift
//  ERide
//
//  Created by Macmaurice Osuji on 3/11/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authenticationViewModel: AuthenticationViewModel
    
    var body: some View {
        VStack {
            if authenticationViewModel.showAuthenticationView {
                AuthenticationView()
            } else {
                if authenticationViewModel.newUser {
                    EditProfileView()
                } else {
                    RootMenuView()
                }
            }
        }
        .onAppear {
            let authUser = try? FirebaseAuthenticationManager.shared.getAuthenticatedUser()
            self.authenticationViewModel.showAuthenticationView = authUser == nil
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AuthenticationViewModel())
            .environmentObject(AccountViewModel(accountDetailsModel: AccountDetailsModel(email: "example@gmail.com", familyName: "Taylor", givenName: "Swift", otherName: "", userName: "", address: "", phoneNumber: "", dateOfBirth: Date(), age: 18, hasDriverLicense: false, isVerified: false, rating: 3)))
    }
}
