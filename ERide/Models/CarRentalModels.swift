//
//  CarDetails.swift
//  ERide
//
//  Created by Macmaurice Osuji on 4/5/24.
//

import Foundation
import UIKit

struct CarRentalModel {
    let carDetails: CarDetails
    var rentalDetails: RentalDetails
    
    struct CarDetails {
        let make: String
        let model: String
        let year: Int
        let mileage: Int
        let fuelType: String // e.g., Gasoline, Diesel, Electric, etc.
        let transmissionType: String // e.g., Manual, Automatic
        let imageURLs: [UIImage] // URLs of car images
        let description: String
    }
    
    struct RentalDetails {
        var pricePerDay: Double
        var isAvailable: Bool
        var location: String // Location where the car is available for rental
        var availableDates: [Date] // Dates the car is available for rental
    }
}
