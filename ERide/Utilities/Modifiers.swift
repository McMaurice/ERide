//
//  Modifiers.swift
//  ERide
//
//  Created by Macmaurice Osuji on 4/10/24.
//

import SwiftUI

let color1 = #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)


struct FormSubTitleModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: 15, weight: .regular, design: .rounded))
            .foregroundColor(Color(color1))
            .padding(5)
            .background(Utilities.shared.isDarkMode() ? .black : .white)  
    }
}

struct PlaceHolderModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .padding()
            .font(.headline)
            .fontWeight(.semibold)
            .frame(height: 50)
            .accentColor(.primary)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 1)
            )
    }
}

struct TextFieldNameModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .padding(.trailing)
            .offset(y: -26)
    }
}

struct HeaderTextModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .fontWeight(.bold)
            .padding(.top)
    }
}

struct LongButtonModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundColor(.white)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(Color.accentColor)
            .cornerRadius(20)
            .shadow(radius: 15)
    }
}

struct CleanListModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .listRowSeparator(.hidden)
            .listRowBackground(Color.clear)
    }
}
