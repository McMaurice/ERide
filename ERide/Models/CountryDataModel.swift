//
//  CPData.swift
//  BeginnersBootcamp
//
//  Created by Macmaurice Osuji on 4/17/24.
//

import Foundation

struct CountryDataModel: Codable, Identifiable {
    let id: String
    let name: String
    let flag: String
    let dial_code: String
    let pattern: String

}
