//
//  FederallyButtonsView.swift
//  ERide
//
//  Created by Macmaurice Osuji on 3/29/24.
//

import SwiftUI

struct FederallyButtonsView: View {
    
    var body: some View {
        VStack(spacing: 20) {
                   signInButton(imageName: "apple", buttonText: "Continue with Apple", action: signInWithApple)
                   signInButton(imageName: "google", buttonText: "Continue with Google", action: signInWithGoogle)
                   signInButton(imageName: "facebook", buttonText: "Continue with Facebook", action: signInWithFacebook)
               }
               .foregroundColor(.white)
               .font(.system(size: 20, weight: .semibold, design: .rounded))
               .frame(maxWidth: .infinity)
               .padding(.vertical, 20)
               .padding()
               .background(.ultraThinMaterial)
               .clipShape(RoundedRectangle(cornerRadius: 30))
       }
       
    func signInButton(imageName: String, buttonText: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            HStack {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: imageName == "facebook" ? 30 : 20, height: imageName == "facebook" ? 30 : 20)
                Text(buttonText)
            }
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(imageName == "facebook" ? Color.blue : Color.black)
            .cornerRadius(15)
        }
    }
    
    func signInWithApple() {
  
       }
       
    func signInWithGoogle() {

    }
   
    func signInWithFacebook() {

    }
}


struct FederallyButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        FederallyButtonsView()
    }
}
