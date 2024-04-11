//
//  UserViewModel.swift
//  ERide
//
//  Created by Macmaurice Osuji on 4/5/24.
//

import Foundation
import UIKit

@MainActor
class UserProfileViewModel: ObservableObject {
    
    @Published var userPrimaryModels = UserPrimaryModels(email: "example@gmail.com", familyName: "Taylor", givenName: "Swift")
    
    @Published var userSecondaryModels = UserSecondaryModel(
        userName: "", profilePicture: UIImage(systemName: "person.fill")!, age: 18,
        hasDriversLicense: false, isVerified: false, rating: 0)
    
    func updateUserDetails(email: String, givenName: String, familyName: String) {
        guard !email.isEmpty else {
            print("No user details")
            return
        }
        
        // Update userPrimaryModel properties using its method
        userPrimaryModels.update(email: email, givenName: givenName, familyName: familyName)
    }
}
