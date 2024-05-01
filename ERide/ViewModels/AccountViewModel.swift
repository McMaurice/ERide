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
class AccountViewModel: ObservableObject {
    
    @Published var familyNameIsEmpty = false
    @Published var givenNameIsEmpty = false
    @Published var usernameIsNotValid = false
    @Published var numberIsEmpty = false
    @Published var addressIsEmpty = false
    @Published var completedChecks = false
    
    @Published var detailsIcon = ["","envelope","phone.arrow.down.left","house"]
    @Published var eRideOptions = ["Fund Wallet","Active Rentals","Contact Support"]
    @Published var settingsOptions = ["Edit Profile","Security Settings","Privacy Settings","Notification Preferences"]

    @Published var accountDetailsModel: AccountDetailsModel
        
        init(accountDetailsModel: AccountDetailsModel) {
            self.accountDetailsModel = accountDetailsModel
        }
    
    func updateUserDetails(email: String, givenName: String, familyName: String) {
        guard !email.isEmpty else {
            print("No user details")
            return
        }

        accountDetailsModel.updatePrimaryDetails(email: email, givenName: givenName, familyName: familyName)
    }
    
    func updateSecondaryDetails(otherName: String, userName: String, address: String, phoneNumber: String, profilePicture: UIImage?, driverLicense: UIImage?, dateOfBirth: Date, age: Int, hasDriverLicense: Bool, isVerified: Bool) {
        accountDetailsModel.updateSecondaryDetails(otherName: otherName, userName: userName, address: address, phoneNumber: phoneNumber, profilePicture: profilePicture, driverLicense: driverLicense, dateOfBirth: dateOfBirth, age: age, hasDriverLicense: hasDriverLicense, isVerified: isVerified)
    }
    
    func checkEntryDetails(familyName: String, givenName: String, userName: String, phoneNumber: String, driverLicense: UIImage?, address: String) {
        var checkPassed = 0
        if familyName.isEmpty {
            familyNameIsEmpty = true
            checkPassed += 1
        }
        if givenName.isEmpty {
            givenNameIsEmpty = true
            checkPassed += 1
        }
        if userName.count <= 6 && !userName.contains(where: \.isNumber) && userName.isEmpty {
           usernameIsNotValid = true
            checkPassed += 1
        }
        if phoneNumber.count < 5 {
           numberIsEmpty = true
            checkPassed += 1
        }
        if driverLicense != nil {
            checkPassed += 1
        }
        if address.isEmpty {
           addressIsEmpty = true
            checkPassed += 1
        }
        if checkPassed == 6 {
            completedChecks = true
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

