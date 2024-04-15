//
//  PrivacySettingsView.swift
//  ERide
//
//  Created by Macmaurice Osuji on 4/15/24.
//

import SwiftUI

struct PrivacySettingsView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Privacy settings")
            }
            .navigationTitle("Privacy settings")
        }
    }
}

struct PrivacySettingsView_Previews: PreviewProvider {
    static var previews: some View {
        PrivacySettingsView()
    }
}
