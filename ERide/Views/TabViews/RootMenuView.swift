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
        TabView(selection: $defaultTab) {
            PublishingView()
                .tabItem {
                    Image (systemName: "plus.app")
                    Text("Publish")
                }
                .tag(0)
            MessagingView()
                .tabItem {
                    Image (systemName: "ellipsis.message")
                    Text("Messages")
                }
                .tag(1)
            HomeView()
                .tabItem {
                    Image (systemName: "house")
                    Text("Feed")
                }
                .tag(2)
            CategoriesView()
                .tabItem {
                    Image (systemName: "square.fill.text.grid.1x2")
                    Text("Categories")
                }
                .tag(3)
            AccountView()
                .tabItem {
                    Image (systemName: "person.crop.circle.badge.checkmark")
                    Text("Account")
                }
                .tag(4)
        }
    }
}

struct RootMenuView_Previews: PreviewProvider {
    static var previews: some View {
        RootMenuView()
    }
}

