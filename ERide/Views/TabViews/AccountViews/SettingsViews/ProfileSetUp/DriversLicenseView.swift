//
//  DriversLicenseView.swift
//  ERide
//
//  Created by Macmaurice Osuji on 4/25/24.
//

import SwiftUI

struct DriversLicenseView: View {
    
    @Binding var driversLicense: String
    @Binding var licenseIsEmpty: Bool
    
    var body: some View {
        Section {
            ZStack {
                TextField("Upload your driver's License", text: $driversLicense)
                    .modifier(PlaceHolderModifier())
                if !driversLicense.isEmpty {
                    HStack {
                        Spacer()
                        Text("Driver's License")
                            .modifier(FormSubTitleModifier())
                    }
                    .modifier(TextFieldNameModifier())
                }
            }
        } footer: {
            if licenseIsEmpty {
                Text("Please fill upload your driver's License")
                    .modifier(FooterModifier())
            }
        }
    }
}

struct DriversLicenseView_Previews: PreviewProvider {
    static var previews: some View {
        DriversLicenseView(driversLicense: .constant(""), licenseIsEmpty: .constant(false))
    }
}
