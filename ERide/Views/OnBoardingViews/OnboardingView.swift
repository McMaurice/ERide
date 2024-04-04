//
//  OnboardingView.swift
//  ERide
//
//  Created by Macmaurice Osuji on 3/29/24.
//

import SwiftUI

struct OnboardingView: View {
@State private var data = ""
    @State private var title = "Email"
    var body: some View {
        NavigationStack {
            ZStack {
                TextField("", text: $data)
                  .padding(.horizontal, 10)
                  .frame(height: 50)
                  .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(.gray, lineWidth: 1)
                  )
                HStack {                    // HStack for the text
                    Text(title )
                    .font(.system(.subheadline, design: .monospaced, weight: .semibold))
                    .foregroundColor(.blue)
                    .padding(5)
                    .background(.white)
                  Spacer()
                }
                .padding(.leading, 10)
                .offset(x: 0, y: -25)
              }
            .padding()
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
            .environmentObject(AuthenticationViewModel())
    }
}
