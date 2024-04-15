//
//  NotificationPreferencesView.swift
//  ERide
//
//  Created by Macmaurice Osuji on 4/15/24.
//

import SwiftUI

struct NotificationPreferencesView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Notifications settting")
            }
            .navigationTitle("Notification Preferences")
        }
    }
}

struct NotificationPreferencesView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationPreferencesView()
    }
}
