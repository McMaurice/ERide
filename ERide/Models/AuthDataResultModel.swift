//
//  AuthDataResultModel.swift
//  ERide
//
//  Created by Macmaurice Osuji on 4/5/24.
//

import Foundation
import FirebaseAuth

struct AuthDataResultModel {
    let uid: String
    let email: String?
    let photoUrl: String?
    
    init(user: User) {
        self.uid = user.uid
        self.email = user.email
        self.photoUrl = user.photoURL?.absoluteString
    }
}

struct GoogleSignInResultModel {
    let idToken: String
    let accessToken: String
}

struct AppleSignInResultModel {
    let token: String
    let nonce: String
}
