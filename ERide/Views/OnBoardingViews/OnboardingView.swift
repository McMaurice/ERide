//
//  OnboardingView.swift
//  ERide
//
//  Created by Macmaurice Osuji on 3/29/24.
//

import SwiftUI

struct OnboardingView: View {

    var body: some View {
        NavigationStack {
            VStack {
                HStack(spacing: 200) {
                    NavigationLink {
                        AuthenticationView()
                    } label: {
                        Text("Sign up")
                    }

                    NavigationLink {
                        SignInView()
                    } label: {
                        Text("Sign in")
                    }
                }
            }
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
            .environmentObject(AuthenticationViewModel())
    }
}
