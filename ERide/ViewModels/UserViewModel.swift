//
//  UserViewModel.swift
//  ERide
//
//  Created by Macmaurice Osuji on 4/5/24.
//

import Foundation
import UIKit
import SwiftUI

@MainActor
class UserViewModel: ObservableObject {
    
    @Published var otherName = ""
    @Published var userName = ""
    @Published var address = ""
    @Published var phoneNumber = ""
    @Published var profilePicture: UIImage? 
    @Published var driverLicense: UIImage? 
    @Published var dateOfBirth = Date()
    @Published var age = 18
    @Published var rating = 3
    
    @Published var isVerified = false
    @Published var familyNameIsEmpty = false
    @Published var givenNameIsEmpty = false
    @Published var usernameIsNotValid = false
    @Published var numberIsEmpty = false
    @Published var addressIsEmpty = false
    @Published var hasDriversLicense = false
    
    @Published var detailsIcon = ["","envelope","phone.arrow.down.left","house"]
    @Published var eRideOptions = ["Fund Wallet","Active Rentals","Contact Support"]
    @Published var settingsOptions = ["Edit Profile","Security Settings","Privacy Settings","Notification Preferences"]
    @Published var userDetails = ["Taylor Swift. U","tailorswift@testing,com","+234 8140494659","No 23, testing Av 2000, USA"]
    
    @Published var userPrimaryModels = UserPrimaryModels(email: "example@gmail.com", familyName: "Taylor", givenName: "Swift")
    //@Published var userSecondaryModels = UserSecondaryModel

    func updateUserDetails(email: String, givenName: String, familyName: String) {
        guard !email.isEmpty else {
            print("No user details")
            return
        }
        
        // Update userPrimaryModel properties using its method
        userPrimaryModels.update(email: email, givenName: givenName, familyName: familyName)
    }
    func checkEntryDetails() {
        if userPrimaryModels.familyName.isEmpty {
            familyNameIsEmpty = true
        }
        if userPrimaryModels.givenName.isEmpty {
            givenNameIsEmpty = true
        }
        if userName.count <= 6 && !userName.contains(where: \.isNumber) && userName.isEmpty {
           usernameIsNotValid = true
        }
        if phoneNumber.count < 5 {
           numberIsEmpty = true
        }
        if driverLicense != nil {
           hasDriversLicense = true
        }
        if address.isEmpty {
           addressIsEmpty = true
        }
    }
    
    func eRideOptionsdestinationView(for option: String) -> some View {
        switch option {
        case "Eride Wallet":
            return AnyView(WalletView())
        case "Active Rentals":
            return AnyView(ActiveRentalsView())
        default:
            return AnyView(ContactSupportView())
        }
    }
    
    func settingsOptionsdestinationView(for option: String) -> some View {
        switch option {
        case "Edit Profile":
            return AnyView(EditProfileView())
        case "Security Settings":
            return AnyView(SecuritySettingsView())
        case "Privacy Settings":
            return AnyView(PrivacySettingsView())
        default:
            return AnyView(NotificationPreferencesView())
        }
    }
}

