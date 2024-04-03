//
//  PrivacyPolicyView.swift
//  ERide
//
//  Created by Macmaurice Osuji on 3/31/24.
//

import SwiftUI

struct PrivacyPolicyView: View {
    @State private var privacyPolicy = PrivacyPolicy(heading: "", content1: "", content2: "", content3: "", content4: "")

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
                            .font(.headline)
                            .fontWeight(.bold)
                            .padding(.top)
                    }
                    
                    Section {
                        Text(privacyPolicy.content2)
                    } header: {
                        Text("How We Use Your Information")
                            .font(.headline)
                            .fontWeight(.bold)
                            .padding(.top)
                    }
                    
                    Section {
                        Text(privacyPolicy.content3)
                    } header: {
                        Text("Sharing of Information")
                            .font(.headline)
                            .fontWeight(.bold)
                            .padding(.top)
                    }
                    
                    Section {
                        Text("\(privacyPolicy.content4) \(email)")
                    } header: {
                        Text("For Inquires")
                            .font(.headline)
                            .fontWeight(.bold)
                            .padding(.top)
                    }
                }
                .font(.subheadline)
                .padding()
            }
            .navigationBarTitle("Privacy Policy")
            .onAppear {
                privacyPolicy = JSONDecoderHelper.decode(fileName: "privacyPolicy", fileExtension: "json", type: PrivacyPolicy.self) ?? privacyPolicy
            }
        }
    }
}

struct PrivacyPolicyView_Previews: PreviewProvider {
    static var previews: some View {
        PrivacyPolicyView()
    }
}
