//
//  OnboardingView.swift
//  ERide
//
//  Created by Macmaurice Osuji on 3/29/24.
//

import SwiftUI

struct EditProfileView: View {
    @EnvironmentObject var authenticationViewModel: AuthenticationViewModel
    @EnvironmentObject var accountViewModel: AccountViewModel
    @Environment(\.presentationMode) var presentationMode
    
    @State private var otherName = ""
    @State private var userName = ""
    @State private var address = ""
    @State private var phoneNumber = ""
    @State private var age = 18
    @State private var hasDriverLicense = false
    @State private var isVerified = false
    @State private var profilePicture: UIImage?
    @State private var driverLicense: UIImage?
    @State private var dateOfBirth = Calendar.current.date(byAdding: .year, value: -18, to: Date()) ?? Date()
    @State private var showAlert = false

    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                DisplayPictureView(profilePicture: $profilePicture)
                VStack {
                    //MARK: PRIMARY DETAILS (ONE TIME CHANGE)
                    PrimaryDetailsView()
                        .padding(.bottom)

                    //MARK: SECONDARY DETAILS
                    VStack(spacing: 20) {
                        Section {
                            ZStack {
                                TextField("Other Name", text: $otherName)
                                    .modifier(PlaceHolderModifier())
                                if !otherName.isEmpty {
                                    HStack {
                                        Spacer()
                                        Text("Other Name")
                                            .modifier(FormSubTitleModifier())
                                    }
                                    .modifier(TextFieldNameModifier())
                                }
                            }
                        }

                        Section {
                            ZStack {
                                TextField("Username", text: $userName)
                                    .modifier(PlaceHolderModifier())
                                if !userName.isEmpty {
                                    HStack {
                                        Spacer()
                                        Text("Username")
                                            .modifier(FormSubTitleModifier())
                                    }
                                    .modifier(TextFieldNameModifier())
                                }
                            }
                        } footer: {
                            if accountViewModel.usernameIsNotValid {
                                Text("Username should be up to 6 characters long and must include at least one number.")
                                    .modifier(FooterModifier())
                            }
                        }

                        Section {
                            DatePickers(dateOfBirth: $dateOfBirth, age: $age)
                            PhoneDropDownView(phoneNumber: $phoneNumber)
                                .padding(.top, -15)
                        } footer: {
                            if accountViewModel.numberIsEmpty {
                                Text("Please enter your phone number")
                                    .modifier(FooterModifier())
                            }
                        }

                        Section {
                            ZStack {
                                TextField("Address", text: $address)
                                    .modifier(PlaceHolderModifier())
                                if !address.isEmpty {
                                    HStack {
                                        Spacer()
                                        Text("Address")
                                            .modifier(FormSubTitleModifier())
                                    }
                                    .modifier(TextFieldNameModifier())
                                }
                            }
                        } footer: {
                            if accountViewModel.addressIsEmpty {
                                Text("Please fill in your address")
                                    .modifier(FooterModifier())
                            }
                        }
                        DriversLicenseView(driverLicense: $driverLicense, hasDriverLicense: $hasDriverLicense, isVerified: $isVerified)
                    }
                    Button {
                        accountViewModel.checkEntryDetails(familyName: accountViewModel.accountDetailsModel.familyName, givenName: accountViewModel.accountDetailsModel.givenName, userName: userName, phoneNumber: phoneNumber, driverLicense: driverLicense, address: address)
                        if accountViewModel.completedChecks == true {
                            accountViewModel.updateSecondaryDetails(otherName: otherName, userName: userName, address: address, phoneNumber: phoneNumber, profilePicture: profilePicture, driverLicense: driverLicense, dateOfBirth: dateOfBirth, age: age, hasDriverLicense: hasDriverLicense, isVerified: isVerified)
                           // authenticationViewModel.newUser = false
                        }
                        authenticationViewModel.newUser = false
                    } label: {
                        Text("Update Profile")
                            .modifier(LongButtonModifier())
                    }
                    .padding(.top)
                }
                .padding()
            }
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}


struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
            .environmentObject(AuthenticationViewModel())
            .environmentObject(AccountViewModel(accountDetailsModel: AccountDetailsModel(email: "example@gmail.com", familyName: "Taylor", givenName: "Swift", otherName: "", userName: "", address: "", phoneNumber: "", dateOfBirth: Date(), age: 18, hasDriverLicense: false, isVerified: false, rating: 3)))
    }
}

