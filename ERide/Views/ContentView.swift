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
                HomeView()
            }
        }
        .onAppear {
            let authUser = try? AuthenticationManager.shared.getAuthenticatedUser()
            self.authenticationViewModel.showAuthenticationView = authUser == nil
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AuthenticationViewModel())
    }
}
