//
//  PolicyView.swift
//  ERide
//
//  Created by Macmaurice Osuji on 3/31/24.
//

import SwiftUI

struct PoliciesView: View {
    @State private var showConfirmationDialog = false
    
    let userAgreementText = Text("User Agreement").foregroundColor(.blue)
    let privacyPolicyText = Text("Privacy Policy").foregroundColor(.blue)
    let cookiePolicyText = Text("Cookie Policy").foregroundColor(.blue)
    
    var body: some View {
        Section {
            VStack {
                Text("By signing up, you agree to our \(userAgreementText), \(privacyPolicyText), and \(cookiePolicyText).")

            }
            .font(.subheadline.bold())
            .foregroundColor(.white)
            .onTapGesture {
                showConfirmationDialog.toggle()
            }
            .confirmationDialog("", isPresented: $showConfirmationDialog) {
                NavigationLink("Privacy Policy") {
                    PrivacyPolicyView()
                }
                NavigationLink("User Agreement") {
                    UserAgreementView()
                }
                NavigationLink("Cookie Policy") {
                    CookiePolicyView()
                }
            }
        }
    }
}

struct PolicyView_Previews: PreviewProvider {
    static var previews: some View {
        PoliciesView()
    }
}
