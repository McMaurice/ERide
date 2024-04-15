//
//  WalletView.swift
//  ERide
//
//  Created by Macmaurice Osuji on 4/15/24.
//

import SwiftUI

struct WalletView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Wallet")
            }
            .navigationTitle("Eride Wallet")
        }
    }
}

struct WalletView_Previews: PreviewProvider {
    static var previews: some View {
        WalletView()
    }
}
