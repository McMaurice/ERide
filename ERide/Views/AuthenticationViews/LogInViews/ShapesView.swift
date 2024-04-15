//
//  ShapesView.swift
//  ERide
//
//  Created by Macmaurice Osuji on 4/4/24.
//

import SwiftUI

struct ShapesView: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(
                    .linearGradient(colors: [.blue, .green], startPoint: .top, endPoint: .bottom)
                )
                .frame(width: 150, height: 150)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .offset(x: -80, y: 60)
            
            Circle()
                .fill(
                    .linearGradient(colors: [.purple, .indigo], startPoint: .top, endPoint: .bottom)
                )
                .frame(width: 50, height: 50)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .offset(x: 70, y: -70)
            
            Circle()
                .fill(
                    .linearGradient(colors: [.purple, .yellow], startPoint: .top, endPoint: .bottom)
                )
                .frame(width: 100, height: 100)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .offset(x: -100, y: -150)
            
            Circle()
                .fill(
                    .linearGradient(colors: [.green, .blue], startPoint: .top, endPoint: .bottom)
                )
                .frame(width: 100, height: 100)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                .offset(x: 40, y: -220)
            
            
            Circle()
                .fill(
                    .linearGradient(colors: [.indigo, .pink], startPoint: .top, endPoint: .bottom)
                )
                .frame(width: 70, height: 70)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .offset(x: 250, y: 110)
            
            
            Circle()
                .fill(
                    .linearGradient(colors: [.indigo, .purple], startPoint: .top, endPoint: .bottom)
                )
                .frame(width: 100, height: 100)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
                .offset(x: 75, y: 180)
        }
    }
}

struct ShapesView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
            .environmentObject(AuthenticationViewModel())
    }
}
