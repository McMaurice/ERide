//
//  UserAgreementModel.swift
//  ERide
//
//  Created by Macmaurice Osuji on 4/1/24.
//

import Foundation

struct UserAgreement: Codable {
    let title: String
    let content: String
}

struct PrivacyPolicy: Codable {
    let heading: String
    let content1: String
    let content2: String
    let content3: String
    let content4: String
}

struct CookiePolicy: Codable {
    let policy: String
    let what_are_cookies: String
    let how_we_use_cookies: String
    let your_choices_regarding_cookies: String
    let third_party_cookies: String
    let changes_to_this_cookie_policy: String
    let contact_us: String
}
