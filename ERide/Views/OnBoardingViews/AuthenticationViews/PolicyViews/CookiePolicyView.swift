//
//  CookiePolicyView.swift
//  ERide
//
//  Created by Macmaurice Osuji on 3/31/24.
//

import SwiftUI

struct CookiePolicyView: View {
    @State private var cookiePolicy = CookiePolicy(policy: "", what_are_cookies: "", how_we_use_cookies: "", your_choices_regarding_cookies: "", third_party_cookies: "", changes_to_this_cookie_policy: "", contact_us: "")

    let email = Text("macmauriceosuji@gmail.com").foregroundColor(.blue)
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 5) {
                    Text(cookiePolicy.policy)
                    Section {
                        Text(cookiePolicy.what_are_cookies)
                    } header: {
                        Text("What are Cookies")
                            .font(.headline)
                            .fontWeight(.bold)
                            .padding(.top)
                    }
                    
                    Section {
                        Text(cookiePolicy.how_we_use_cookies)
                    } header: {
                        Text("How We Use Cookies")
                            .font(.headline)
                            .fontWeight(.bold)
                            .padding(.top)
                    }
                    
                    Section {
                        Text(cookiePolicy.your_choices_regarding_cookies)
                    } header: {
                        Text("Your Choices Regarding Cookies")
                            .font(.headline)
                            .fontWeight(.bold)
                            .padding(.top)
                    }
                    
                    Section {
                        Text(cookiePolicy.third_party_cookies)
                    } header: {
                        Text("Third-Party Cookies")
                            .font(.headline)
                            .fontWeight(.bold)
                            .padding(.top)
                    }
                    
                    Section {
                        Text(cookiePolicy.changes_to_this_cookie_policy)
                    } header: {
                        Text("Changes to this Cookie Policy")
                            .font(.headline)
                            .fontWeight(.bold)
                            .padding(.top)
                    }
                    
                    Section {
                        Text("\(cookiePolicy.contact_us) \(email)")
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
            .navigationBarTitle("Cookie Policy")
            .onAppear {
                cookiePolicy = JSONDecoderHelper.decode(fileName: "cookiePolicy", fileExtension: "json", type: CookiePolicy.self) ?? cookiePolicy
            }
        }
    }
}

struct CookiePolicyView_Previews: PreviewProvider {
    static var previews: some View {
        CookiePolicyView()
    }
}
