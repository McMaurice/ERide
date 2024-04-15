//
//  ContactSupportView.swift
//  ERide
//
//  Created by Macmaurice Osuji on 4/15/24.
//

import SwiftUI

struct ContactSupportView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Contact us")
            }
            .navigationTitle("Contact us")
        }
    }
}

struct ContactSupportView_Previews: PreviewProvider {
    static var previews: some View {
        ContactSupportView()
    }
}
