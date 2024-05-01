//
//  RatingView.swift
//  ERide
//
//  Created by Macmaurice Osuji on 4/18/24.
//


import SwiftUI

struct RatingView: View {
    @EnvironmentObject var accountViewModel: AccountViewModel
  
    var label = ""
    var maxRating = 5
    
    var offImage: Image?
    var onImage = Image(systemName: "star.fill")
    
    var offColor = Color.gray
    var onColor = Color.yellow
    
    var body: some View {
        HStack {
            if label.isEmpty == false {
                Text(label)
            }
            ForEach(1..<maxRating + 1, id: \.self) { number in
                image(for: number)
                    .foregroundColor(number > accountViewModel.accountDetailsModel.rating ? offColor : onColor)
                    .onTapGesture {
                        accountViewModel.accountDetailsModel.rating = number
                    }
            }
        }
    }
    
    func image(for number: Int) -> Image {
        if number > accountViewModel.accountDetailsModel.rating {
            return offImage ?? onImage
        } else {
            return onImage
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView()
            .environmentObject(AccountViewModel(accountDetailsModel: AccountDetailsModel(email: "", familyName: "", givenName: "", otherName: "", userName: "", address: "", phoneNumber: "", dateOfBirth: Date(), age: 18, hasDriverLicense: false, isVerified: false, rating: 3)))
    }
}

