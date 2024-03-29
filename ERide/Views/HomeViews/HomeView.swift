//
//  HomeView.swift
//  ERide
//
//  Created by Macmaurice Osuji on 3/28/24.
//

import SwiftUI

struct HomeView: View {
    @Binding var showSignInView: Bool
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(showSignInView: .constant(false))
    }
}
