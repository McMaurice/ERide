//
//  PrimaryDetailsView.swift
//  ERide
//
//  Created by Macmaurice Osuji on 4/25/24.
//

import SwiftUI

struct PrimaryDetailsView: View {
    @StateObject private var userViewModel = UserViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
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
                if userViewModel.familyNameIsEmpty {
                    Text("Please enter family name")
                        .modifier(FooterModifier())
                }
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
                if userViewModel.givenNameIsEmpty {
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
    }
}
