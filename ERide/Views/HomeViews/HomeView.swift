//
//  HomeView.swift
//  ERide
//
//  Created by Macmaurice Osuji on 3/31/24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var authenticationViewModel: AuthenticationViewModel
    
    var body: some View {
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
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(AuthenticationViewModel())
    }
}
