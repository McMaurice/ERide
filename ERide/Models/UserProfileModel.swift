//
//  File.swift
//  ERide
//
//  Created by Macmaurice Osuji on 4/5/24.
//

import Foundation
import UIKit

struct UserPrimaryModels {
    var email: String
    var familyName: String
    var givenName: String

    mutating func update(email: String, givenName: String, familyName: String) {
        self.email = email
        self.givenName = givenName
        self.familyName = familyName
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




