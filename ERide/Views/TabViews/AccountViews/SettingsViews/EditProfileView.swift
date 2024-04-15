//
//  OnboardingView.swift
//  ERide
//
//  Created by Macmaurice Osuji on 3/29/24.
//

import SwiftUI

struct EditProfileView: View {
@State private var data = ""
    @StateObject private var userViewModel = UserViewModel()
    @State private var showAlert = false
    
    @State private var familyNameFild = ""
    @State private var givenNameFild = ""
    @State private var otherName = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
            }
            Form {
                Section {
                    Text(userViewModel.userPrimaryModels.email)
                }
                
                Section(header: Text("Username")
                    .modifier(FormSubTitleModifier())
                ) {
                    TextField("Username", text: .constant(""))
                }
                
                Section(header: Text("Names")
                    .modifier(FormSubTitleModifier())
                ) {
                    TextField(text: $familyNameFild) {
                        if !userViewModel.userPrimaryModels.familyName.isEmpty {
                            Text(userViewModel.userPrimaryModels.familyName)
                        } else {
                            Text("Family Name")
                        }
                    }
                    TextField(text: $givenNameFild) {
                        if !userViewModel.userPrimaryModels.givenName.isEmpty {
                            Text(userViewModel.userPrimaryModels.givenName)
                        } else {
                            Text("Given Name")
                        }
                    }
                    TextField(text: $otherName) {
                        Text("Other Name")
                    }
                }
                
                Section(header: Text("Upload Address")
                    .modifier(FormSubTitleModifier())
                ) {
                    Text("Upload Address Field")
                }
            }
            .navigationTitle("Edit Profile")
        }
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
            .environmentObject(AuthenticationViewModel())
    }
}
