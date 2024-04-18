//
//  PrivacyPolicyView.swift
//  ERide
//
//  Created by Macmaurice Osuji on 3/31/24.
//

import SwiftUI

struct PrivacyPolicyView: View {
    let privacyPolicy: PrivacyPolicy = Bundle.main.decode("privacyPolicy.json")
    
    let email = Text("macmauriceosuji@gmail.com").foregroundColor(.blue)
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 5) {
                    Text(privacyPolicy.heading)
                    Section {
                        Text(privacyPolicy.content1)
                    } header: {
                        Text("Information We Collect")
                            .modifier(HeaderTextModifier())
                    }
                    
                    Section {
                        Text(privacyPolicy.content2)
                    } header: {
                        Text("How We Use Your Information")
                            .modifier(HeaderTextModifier())
                    }
                    
                    Section {
                        Text(privacyPolicy.content3)
                    } header: {
                        Text("Sharing of Information")
                            .modifier(HeaderTextModifier())
                    }
                    
                    Section {
                        Text("\(privacyPolicy.content4) \(email)")
                    } header: {
                        Text("For Inquires")
                            .modifier(HeaderTextModifier())
                    }
                }
                .font(.subheadline)
                .padding()
            }
            .navigationBarTitle("Privacy Policy")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct PrivacyPolicyView_Previews: PreviewProvider {
    static var previews: some View {
        PrivacyPolicyView()
    }
}
