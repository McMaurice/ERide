//
//  File.swift
//  ERide
//
//  Created by Macmaurice Osuji on 4/5/24.
//

import Foundation
import UIKit

struct UserPrimaryModels {
    let email: String
    let familyName: String
    let givenName: String
    
    func updatePrimaryModel(email: String, familyName: String, givenName: String) -> UserPrimaryModels {
        return UserPrimaryModels(email: email, familyName: familyName, givenName: givenName)
    }
}

struct UserSecondaryModel {
    var userName: String
    var profilePicture: UIImage
    let age: Int
    var hasDriversLicense: Bool
    var isVerified: Bool
    var rating: Int
}




