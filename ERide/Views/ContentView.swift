//
//  ContentView.swift
//  ERide
//
//  Created by Macmaurice Osuji on 3/11/24.
//

import MapKit
import SwiftUI

struct ContentView: View {
    
    @State private var showSignInView: Bool = true
    
    var body: some View {
        ZStack {
            NavigationStack {
                HomeView(showSignInView: $showSignInView)
            }
        }
        .onAppear {
            let authUser = try? AuthenticationManager.shared.getAuthenticatedUser()
            self.showSignInView = authUser == nil
        }
        .fullScreenCover(isPresented: $showSignInView) {
            NavigationStack {
                AuthenticationView(showSignInView: $showSignInView)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
