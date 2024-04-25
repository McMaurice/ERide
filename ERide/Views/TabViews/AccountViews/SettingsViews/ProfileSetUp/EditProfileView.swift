//
//  OnboardingView.swift
//  ERide
//
//  Created by Macmaurice Osuji on 3/29/24.
//

import SwiftUI

struct EditProfileView: View {
    @EnvironmentObject var authenticationViewModel: AuthenticationViewModel
    @StateObject private var userViewModel = UserViewModel()
    @State private var showAlert = false
    @State private var number = ""

    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                DisplayPictureView()
                
                VStack {
                    //MARK: PRIMARY DETAILS (ONE TIME CHANGE)
                    PrimaryDetailsView()
                        .padding(.bottom)

                    //MARK: SECONDARY DETAILS
                    VStack(spacing: 20) {
                        Section {
                            ZStack {
                                TextField("Other Name", text: $userViewModel.otherName)
                                    .modifier(PlaceHolderModifier())
                                if !userViewModel.otherName.isEmpty {
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
                                TextField("Username", text: $userViewModel.userName)
                                    .modifier(PlaceHolderModifier())
                                if !userViewModel.userName.isEmpty {
                                    HStack {
                                        Spacer()
                                        Text("Username")
                                            .modifier(FormSubTitleModifier())
                                    }
                                    .modifier(TextFieldNameModifier())
                                }
                            }
                        } footer: {
                            if userViewModel.usernameIsNotValid {
                                Text("Username should be up to 6 characters long and must include at least one number.")
                                    .modifier(FooterModifier())
                            }
                        }

                        Section {
                            DatePickers(dateOfBirth: $userViewModel.dateOfBirth, age: $userViewModel.age)
                            PhoneDropDownView(phoneNumber: $number)
                                .padding(.top, -15)
                        } footer: {
                            if userViewModel.numberIsEmpty {
                                Text("Please enter your phone number")
                                    .modifier(FooterModifier())
                            }
                        }

                        Section {
                            ZStack {
                                TextField("Address", text: $userViewModel.address)
                                    .modifier(PlaceHolderModifier())
                                if !userViewModel.address.isEmpty {
                                    HStack {
                                        Spacer()
                                        Text("Address")
                                            .modifier(FormSubTitleModifier())
                                    }
                                    .modifier(TextFieldNameModifier())
                                }
                            }
                        } footer: {
                            if userViewModel.addressIsEmpty {
                                Text("Please fill in your address")
                                    .modifier(FooterModifier())
                            }
                        }

                        DriversLicenseView(driversLicense: $userViewModel.driverLicense, licenseIsEmpty: $userViewModel.driversLicenseIsEmpty)
                    }
                    Button {
                        userViewModel.phoneNumber = number
                        userViewModel.checkEntryDetails()
                        authenticationViewModel.newUser = false
                    } label: {
                        Text("Submit")
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
    }
}

