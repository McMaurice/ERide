//
//  FederallyButtonsView.swift
//  ERide
//
//  Created by Macmaurice Osuji on 3/29/24.
//

import SwiftUI

struct FederallyButtonsView: View {
    @EnvironmentObject var authenticationViewModel: AuthenticationViewModel
    @StateObject private var googleAuthenticationViewModel = GoogleAuthenticationViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
                   signInButton(imageName: "apple", buttonText: "Continue with Apple", action: signInWithApple)
                .shadow(radius: 10)
                   signInButton(imageName: "google", buttonText: "Continue with Google", action: signInWithGoogle)
                .shadow(radius: 10)
                   signInButton(imageName: "facebook", buttonText: "Continue with Facebook", action: signInWithFacebook)
                .shadow(radius: 10)
               }
               .foregroundColor(.white)
               .font(.system(size: 20, weight: .semibold, design: .rounded))
               .frame(maxWidth: .infinity)
               .padding(.vertical, 20)
               .padding()
               .background(.thinMaterial)
               .clipShape(RoundedRectangle(cornerRadius: 30))
               .shadow(radius: 15)
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
        Task {
            do {
                try await googleAuthenticationViewModel.signInGoogle()
                authenticationViewModel.showAuthenticationView = false
            } catch {
               print(error)
            }
        }
    }
   
    func signInWithFacebook() {

    }
}


struct FederallyButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        FederallyButtonsView()
            .environmentObject(AuthenticationViewModel())
    }
}
