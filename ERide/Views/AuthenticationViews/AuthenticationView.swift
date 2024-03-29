//
//  AuthenticationView.swift
//  ERide
//
//  Created by Macmaurice Osuji on 3/28/24.
//

import SwiftUI

struct AuthenticationView: View {
    @State private var animateCar: Bool = false
    @Binding var showSignInView: Bool
    let secondaryAccentColor = Color("SecondaryAccentColor")
    
    var body: some View {
        ZStack {
            Color.accentColor.ignoresSafeArea()
            VStack {
                VStack(spacing: 0) {
                    Image("car")
                        .resizable()
                        .foregroundColor(.white)
                        .scaledToFit()
                        .offset(x: animateCar ? 0 : -250)
                    Text("Let's get you signed up!")
                        .foregroundColor(.white)
                        .font(.system(size: 25, weight: .bold, design: .rounded))
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding()
                FederallyButtonsView()
                
                VStack {
                    Text("or")
                        .foregroundColor(.white)
                        .font(.subheadline.bold())
                        .padding()
                    
                    NavigationLink {
                        EmailSignUpView(showSignInView: $showSignInView)
                    } label: {
                        Text("Create account")
                            .font(.system(size: 20, weight: .semibold, design: .rounded))
                            .foregroundColor(.white)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(.black)
                            .cornerRadius(15)
                    }
                    
                    Text("By signing up, you agree to our Terms, privacy Policy, and Cookie Use.")
                        .foregroundColor(.white)
                        .font(.subheadline.bold())
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .padding()
            .padding(.bottom, 50)
        }
        .onAppear {
            withAnimation(.spring(response: 0.8, dampingFraction: 0.7, blendDuration: 0.4))  {
                animateCar.toggle()
            }
        }
        .onDisappear {
            animateCar = false
        }
    }
}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView(showSignInView: .constant(false))
    }
}
