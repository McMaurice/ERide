//
//  GoogleAuthenticationViewModel.swift
//  ERide
//
//  Created by Macmaurice Osuji on 4/5/24.
//

import Foundation
import GoogleSignIn
import GoogleSignInSwift

@MainActor
final class GoogleAuthenticationViewModel: ObservableObject {
    
    func signInGoogle() async throws {
        guard let topViewController = Utilities.shared.topViewController() else {
            throw URLError(.cannotFindHost)
        }
                
        let gIDSignInResul = try await GIDSignIn.sharedInstance.signIn(withPresenting: topViewController)
        
        guard let idToken = gIDSignInResul.user.idToken?.tokenString else {
            throw URLError(.badServerResponse)
        }
        let accessToken = gIDSignInResul.user.accessToken.tokenString
        
        let tokens = GoogleSignInResultModel(idToken: idToken, accessToken: accessToken)
        
        try await FirebaseAuthenticationManager.shared.signInWithGoogle(tokens: tokens)
    }
}
