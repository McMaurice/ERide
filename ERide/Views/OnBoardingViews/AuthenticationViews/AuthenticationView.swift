//
//  AuthenticationView.swift
//  ERide
//
//  Created by Macmaurice Osuji on 3/28/24.
//

import SwiftUI

struct AuthenticationView: View {
    @State private var animateCar: Bool = false
    @State private var backgoundColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(backgoundColor).ignoresSafeArea()
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
                            EmailSignUpView()
                        } label: {
                            Text("Create account")
                                .font(.system(size: 20, weight: .semibold, design: .rounded))
                                .foregroundColor(.white)
                                .frame(height: 55)
                                .frame(maxWidth: .infinity)
                                .background(.black)
                                .cornerRadius(15)
                        }
                        PoliciesView()
                    }
                    HStack {
                        Text("Already have an account?")
                        NavigationLink("Sign in.") {
                            SignInView()
                        }
                        .foregroundColor(.blue)
                    }
                    .padding()
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
}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView()
            .environmentObject(AuthenticationViewModel())
    }
}
