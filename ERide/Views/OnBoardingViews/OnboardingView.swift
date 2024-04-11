//
//  OnboardingView.swift
//  ERide
//
//  Created by Macmaurice Osuji on 3/29/24.
//

import SwiftUI

struct OnboardingView: View {
@State private var data = ""
    @StateObject private var userProfileViewModel = UserProfileViewModel()
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
                    Text(userProfileViewModel.userPrimaryModels.email)
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
                        if !userProfileViewModel.userPrimaryModels.familyName.isEmpty {
                            Text(userProfileViewModel.userPrimaryModels.familyName)
                        } else {
                            Text("Family Name")
                        }
                    }
                    TextField(text: $givenNameFild) {
                        if !userProfileViewModel.userPrimaryModels.givenName.isEmpty {
                            Text(userProfileViewModel.userPrimaryModels.givenName)
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
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
            .environmentObject(AuthenticationViewModel())
    }
}
