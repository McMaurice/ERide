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
    
    func googleHelper() async throws -> GoogleSignInResultModel {
        guard let topViewController = Utilities.shared.topViewController() else {
            throw URLError(.cannotFindHost)
        }
        
        let gIDSignInResul = try await GIDSignIn.sharedInstance.signIn(withPresenting: topViewController)
        
        guard let idToken = gIDSignInResul.user.idToken?.tokenString else {
            throw URLError(.badServerResponse)
        }
        
        let accessToken = gIDSignInResul.user.accessToken.tokenString
        
        //MARK: GET USERS DETAILS HERE
        if let email = gIDSignInResul.user.profile?.email,
           let familyName = gIDSignInResul.user.profile?.familyName,
           let givenName = gIDSignInResul.user.profile?.givenName {
            
            let accountDetailsModel = AccountDetailsModel(email: "", familyName: "", givenName: "", otherName: "", userName: "", address: "", phoneNumber: "", profilePicture: nil, driverLicense: nil, dateOfBirth: Date(), age: 18, hasDriverLicense: false, isVerified: false, rating: 0)
            
            let accountViewModel = AccountViewModel(accountDetailsModel: accountDetailsModel)
            accountViewModel.updateUserDetails(email: email, givenName: givenName, familyName: familyName)

        } else {
            print("User has no details")
        }
        
        return GoogleSignInResultModel(idToken: idToken, accessToken: accessToken)
    }
    
    func signInGoogle() async throws {
        try await FirebaseAuthenticationManager.shared.signInWithGoogle(tokens: googleHelper())
    }
    

}
