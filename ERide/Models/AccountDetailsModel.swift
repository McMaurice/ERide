//
//  File.swift
//  ERide
//
//  Created by Macmaurice Osuji on 4/5/24.
//

import Foundation
import UIKit

struct AccountDetailsModel {
    var email: String
    var familyName: String
    var givenName: String

    var otherName: String
    var userName: String
    var address: String
    var phoneNumber: String
    var profilePicture: UIImage?
    var driverLicense: UIImage?
    var dateOfBirth: Date
    var age: Int
    var hasDriverLicense: Bool
    var isVerified: Bool
    var rating: Int
    
    mutating func updatePrimaryDetails(email: String, givenName: String, familyName: String) {
        self.email = email
        self.givenName = givenName
        self.familyName = familyName
    }
    
    mutating func updateSecondaryDetails(otherName: String, userName: String, address: String, phoneNumber: String, profilePicture: UIImage?, driverLicense: UIImage?, dateOfBirth: Date, age: Int, hasDriverLicense: Bool, isVerified: Bool) {
        self.otherName = otherName
        self.userName = userName
        self.address = address
        self.phoneNumber = phoneNumber
        self.profilePicture = profilePicture
        self.driverLicense = driverLicense
        self.dateOfBirth = dateOfBirth
        self.age = age
        self.hasDriverLicense = hasDriverLicense
        self.isVerified = isVerified
    }

}



