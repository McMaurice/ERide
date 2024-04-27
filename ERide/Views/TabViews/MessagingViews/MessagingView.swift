//
//  MessagingView.swift
//  ERide
//
//  Created by Macmaurice Osuji on 4/11/24.
//

import SwiftUI

struct MessagingView: View {
    var body: some View {
        ScrollView {
            LazyHStack {
                ForEach(0..<20) { index in
                    RoundedRectangle(cornerRadius: 25.0)
                        .fill(Color.white)
                        .frame(width: 200, height: 150)
                        .shadow(radius: 10)
                        .padding()
                }
            }
        }
    }
}

struct MessagingView_Previews: PreviewProvider {
    static var previews: some View {
        MessagingView()
    }
}
