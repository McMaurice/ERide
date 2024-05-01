//
//  AccountHeaderView.swift
//  ERide
//
//  Created by Macmaurice Osuji on 4/17/24.
//

import SwiftUI

struct AccountHeaderView: View {
    @EnvironmentObject var accountViewModel: AccountViewModel
    
    var body: some View {
        VStack {
            VStack(spacing: 2) {
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.clear)
                        .frame(width: 150, height: 150)
                        .overlay {
                            if accountViewModel.accountDetailsModel.profilePicture != nil {
                                Image(uiImage: accountViewModel.accountDetailsModel.profilePicture!)
                                    .resizable()
                                    .scaledToFill()
                            } else {
                                Image(systemName: "person.fill")
                                    .resizable()
                                    .scaledToFill()
                                    .padding()
                            }
                        }
                    
                    HStack(spacing: 50) {
                        Text("ID")
                        Text("DL")
                    }
                    .padding(.top, 120)
                    .foregroundColor(.blue)
                    .font(.system(.title2, design: .rounded, weight: .semibold))
                }
                Text("@username")
                RatingView()
                    .padding(.bottom)
            }
            .background {
                Circle()
                    .fill(
                        LinearGradient(colors: [secondaryAccentColor, .accentColor],
                                       startPoint: .topLeading,
                                       endPoint: .bottomTrailing)
                    )
                    .frame(width: 500, height: 500)
                    .offset(y: -50)
                    .shadow(radius: 15)
            }
            
            HStack(spacing: 120) {
                VStack(spacing: 5) {
                    Text("Cars Rented")
                    Text("4")
                        .font(.system(size: 20, weight: .semibold, design: .monospaced))
                }
                VStack(spacing: 5) {
                    Text("Cars Published")
                    Text("10")
                        .font(.system(size: 20, weight: .semibold, design: .monospaced))
                }
            }
            .padding(.top, -5)
        }
        .padding(.bottom, 50)
    }
}

struct AccountHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        AccountHeaderView()
            .environmentObject(AccountViewModel(accountDetailsModel: AccountDetailsModel(email: "", familyName: "", givenName: "", otherName: "", userName: "", address: "", phoneNumber: "", dateOfBirth: Date(), age: 18, hasDriverLicense: false, isVerified: false, rating: 3)))
    }
}
