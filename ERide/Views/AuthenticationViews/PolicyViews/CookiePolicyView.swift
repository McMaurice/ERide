//
//  CookiePolicyView.swift
//  ERide
//
//  Created by Macmaurice Osuji on 3/31/24.
//

import SwiftUI

struct CookiePolicyView: View {
    let cookiePolicy: CookiePolicy = Bundle.main.decode("cookiePolicy.json")
    
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
                            .modifier(HeaderTextModifier())
                    }
                    
                    Section {
                        Text(cookiePolicy.how_we_use_cookies)
                    } header: {
                        Text("How We Use Cookies")
                            .modifier(HeaderTextModifier())
                    }
                    
                    Section {
                        Text(cookiePolicy.your_choices_regarding_cookies)
                    } header: {
                        Text("Your Choices Regarding Cookies")
                            .modifier(HeaderTextModifier())
                    }
                    
                    Section {
                        Text(cookiePolicy.third_party_cookies)
                    } header: {
                        Text("Third-Party Cookies")
                            .modifier(HeaderTextModifier())
                    }
                    
                    Section {
                        Text(cookiePolicy.changes_to_this_cookie_policy)
                    } header: {
                        Text("Changes to this Cookie Policy")
                            .modifier(HeaderTextModifier())
                    }
                    
                    Section {
                        Text("\(cookiePolicy.contact_us) \(email)")
                    } header: {
                        Text("For Inquires")
                            .modifier(HeaderTextModifier())
                    }
                }
                .font(.subheadline)
                .padding()
            }
            .navigationBarTitle("Cookie Policy")
        }
    }
}

struct CookiePolicyView_Previews: PreviewProvider {
    static var previews: some View {
        CookiePolicyView()
    }
}
