//
//  PrimaryDetailsView.swift
//  ERide
//
//  Created by Macmaurice Osuji on 4/25/24.
//

import SwiftUI

struct PrimaryDetailsView: View {
    @EnvironmentObject var accountViewModel: AccountViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            Text(accountViewModel.accountDetailsModel.email)
            
            Section {
                ZStack {
                    TextField("Family Name", text: $accountViewModel.accountDetailsModel.familyName)
                        .modifier(PlaceHolderModifier())
                    if !accountViewModel.accountDetailsModel.familyName.isEmpty {
                        HStack {
                            Spacer()
                            Text("Family Name")
                                .modifier(FormSubTitleModifier())
                        }
                        .modifier(TextFieldNameModifier())
                    }
                }
            } footer: {
                if accountViewModel.familyNameIsEmpty {
                    Text("Please enter family name")
                        .modifier(FooterModifier())
                }
            }
            
            Section {
                ZStack {
                    TextField("Given Name", text: $accountViewModel.accountDetailsModel.givenName)
                        .modifier(PlaceHolderModifier())
                    if !accountViewModel.accountDetailsModel.givenName.isEmpty {
                        HStack {
                            Spacer()
                            Text("Given Name")
                                .modifier(FormSubTitleModifier())
                        }
                        .modifier(TextFieldNameModifier())
                    }
                }
            } footer: {
                if accountViewModel.givenNameIsEmpty {
                    Text("Please enter given name")
                        .modifier(FooterModifier())
                }
            }
        }
    }
}

struct PrimaryDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryDetailsView()
            .environmentObject(AccountViewModel(accountDetailsModel: AccountDetailsModel(email: "", familyName: "", givenName: "", otherName: "", userName: "", address: "", phoneNumber: "", dateOfBirth: Date(), age: 18, hasDriverLicense: false, isVerified: false, rating: 3)))
    }
}
