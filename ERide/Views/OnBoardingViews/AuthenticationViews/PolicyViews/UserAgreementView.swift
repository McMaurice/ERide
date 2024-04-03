//
//  UserAgreementView.swift
//  ERide
//
//  Created by Macmaurice Osuji on 3/31/24.
//

import SwiftUI

struct UserAgreementView: View {
    @State private var userAgreements: [UserAgreement] = []
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
            }
            .listStyle(.plain)
            .navigationBarTitle("User Agreement")
            .onAppear {
                userAgreements = JSONDecoderHelper.decode(fileName: "agreement", fileExtension: "json", type: [UserAgreement].self) ?? []
            }
        }
    }
}

struct UserAgreementView_Previews: PreviewProvider {
    static var previews: some View {
        UserAgreementView()
    }
}

