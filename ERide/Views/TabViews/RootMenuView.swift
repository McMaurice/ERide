//
//  RootMenuView.swift
//  ERide
//
//  Created by Macmaurice Osuji on 4/11/24.
//

import SwiftUI

struct RootMenuView: View {
    @State private var defaultTab = 2
    
    var body: some View {
        VStack {
            TabView(selection: $defaultTab) {
                PublishingView()
                    .tabItem {
                        Image(systemName: "car.front.waves.up.fill")
                        Text("Publish")
                    }
                    .tag(0)
                CategoriesView()
                    .tabItem {
                        Image(systemName: "list.bullet.indent")
                        Text("Categories")
                    }
                    .tag(1)
                HomeView()
                    .tabItem {
                        Image(systemName: "dot.radiowaves.left.and.right")
                        Text("Feed")
                    }
                    .tag(2)
                MessagingView()
                    .tabItem {
                        Image(systemName: "envelope.badge.shield.leadinghalf.fill")
                        Text("Messages")
                    }
                    .tag(3)
                AccountView()
                    .tabItem {
                        Image(systemName: "person.badge.shield.checkmark")
                        Text("Account")
                    }
                    .tag(4)
            }
        }
    }
}


struct RootMenuView_Previews: PreviewProvider {
    static var previews: some View {
        RootMenuView()
            .environmentObject(AuthenticationViewModel())
    }
}

