//
//  ListingView.swift
//  ERide
//
//  Created by Macmaurice Osuji on 4/11/24.
//

import SwiftUI

struct PublishingView: View {
    @State private var numbers = [1,2,3,4,5,6,7,8,9]
    
    var body: some View {
        GeometryReader { reader in
            ScrollView {
                Text("header")
                List {
                    ForEach(0..<99, id: \.self) {
                        Text("\($0)")
                    }
                    .onDelete { index in
                        // delete item
                    }
                }.frame(width: reader.size.width , height: reader.size.height - 30, alignment: .center)
            }
        }
    }
}

struct PublishingView_Previews: PreviewProvider {
    static var previews: some View {
        PublishingView()
    }
}
