//
//  UserAgreementView.swift
//  ERide
//
//  Created by Macmaurice Osuji on 3/31/24.
//

import SwiftUI

struct UserAgreementView: View {
    let userAgreements: [UserAgreement] = Bundle.main.decode("userAgreement.json")
    
    let email = Text("macmauriceosuji@gmail.com").foregroundColor(.blue)
    
    var body: some View {
        NavigationView {
            List(userAgreements, id: \.content) { agreement in
                VStack(alignment: .leading, spacing: 5) {
                    Text(agreement.title)
                        .font(.headline)
                    Text(agreement.content)
                        .font(.subheadline)
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .navigationBarTitle("User Agreement")
        }
    }
}

struct UserAgreementView_Previews: PreviewProvider {
    static var previews: some View {
        UserAgreementView()
    }
}

