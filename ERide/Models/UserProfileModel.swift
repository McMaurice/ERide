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
    var otherName: String
    var userName: String
    var address: String
    var PhoneNumber: String
    var profilePicture: UIImage
    var driverLicense: UIImage
    var dateOfBirth: Date
    var age = 18
    var hasDriverLicense: Bool
    var isVerified: Bool
    var rating: Int
}




