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

    @State private var otherName = ""
    @State private var userName = ""
    @State private var address = ""
    @State private var PhoneNumber = ""
    @State private var profilePicture = UIImage(systemName: "person.fill")
    @State private var driverLicense = UIImage(systemName: "person.fill")
    @State private var dateOfBirth = Date()
    @State private var age = 18
    @State private var hasDriverLicense = false
    @State private var isVerified = false
    @State private var rating = 3
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                ZStack {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .frame(maxWidth: .infinity)
                    
                    Circle()
                        .fill(Color.accentColor)
                        .frame(width: 40, height: 40)
                        .overlay(
                            Image(systemName: "camera.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                        )
                        .offset(x: 50, y: 50)
                        .onTapGesture {
                            //
                        }
                }
                
                VStack {
                    //MARK: PRIMARY DETAILS (ONE TIME CHANGE)
                    Group {
                        Text(userViewModel.userPrimaryModels.email)
                        
                        Section {
                            ZStack {
                                TextField("Family Name", text: $userViewModel.userPrimaryModels.familyName)
                                    .modifier(PlaceHolderModifier())
                                if !userViewModel.userPrimaryModels.familyName.isEmpty {
                                    HStack {
                                        Spacer()
                                        Text("Family Name")
                                            .modifier(FormSubTitleModifier())
                                    }
                                    .modifier(TextFieldNameModifier())
                                }
                            }
                        } footer: {
                            Text("Please enter family name")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(.red)
                                .modifier(FormSubTitleModifier())
                                .padding(.top, -5)
                        }
                        
                        Section {
                            ZStack {
                                TextField("Given Name", text: $userViewModel.userPrimaryModels.givenName)
                                    .modifier(PlaceHolderModifier())
                                if !userViewModel.userPrimaryModels.givenName.isEmpty {
                                    HStack {
                                        Spacer()
                                        Text("Given Name")
                                            .modifier(FormSubTitleModifier())
                                    }
                                    .modifier(TextFieldNameModifier())
                                }
                            }
                        } footer: {
                            Text("Please enter given name")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(.red)
                                .modifier(FormSubTitleModifier())
                                .padding(.top, -5)
                        }
                    }
                    
                    //MARK: SECONDARY DETAILS
                    Group {
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
                        .padding(.bottom)
            
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
                            Text("Username should be up to 6 characters long and must include at least one number.")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(.red)
                                .modifier(FormSubTitleModifier())
                                .padding(.top, -5)
                        }
                        
                        Section {
                            DatePickers(dateOfBirth: $dateOfBirth, age: $age)
                            PhoneDropDownView(PhoneNumber: $PhoneNumber)
                        }
                        .padding(.bottom)

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
                            Text("Please fill in your address")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(.red)
                                .modifier(FormSubTitleModifier())
                                .padding(.top, -5)
                        }
                        
                        Section {
                            ZStack {
                                TextField("Upload your driver's License", text: $address)
                                    .modifier(PlaceHolderModifier())
                                if !address.isEmpty {
                                    HStack {
                                        Spacer()
                                        Text("Driver's License")
                                            .modifier(FormSubTitleModifier())
                                    }
                                    .modifier(TextFieldNameModifier())
                                }
                            }
                        } footer: {
                            Text("Please fill upload your driver's License")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(.red)
                                .modifier(FormSubTitleModifier())
                                .padding(.top, -5)
                        }
                        
                        Button {
                            //
                            authenticationViewModel.newUser = false
                        } label: {
                            Text("Submit")
                                .modifier(LongButtonModifier())
                        }
                        .padding(.top)

                    }
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
