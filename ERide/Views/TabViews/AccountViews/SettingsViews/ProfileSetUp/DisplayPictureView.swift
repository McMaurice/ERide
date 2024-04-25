//
//  DisplayPictureView.swift
//  ERide
//
//  Created by Macmaurice Osuji on 4/25/24.
//

import SwiftUI

struct DisplayPictureView: View {
    
    var body: some View {
        ZStack {
            Image(systemName: "person.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .frame(maxWidth: .infinity)
            
            Circle()
                .fill(Color.white)
                .frame(width: 30, height: 30)
                .overlay(
                    Image(systemName: "camera.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                )
                .offset(x: 50, y: 50)
                .onTapGesture {
                    //
                }
        }
    }
}

struct DisplayPictureView_Previews: PreviewProvider {
    static var previews: some View {
        DisplayPictureView()
    }
}
