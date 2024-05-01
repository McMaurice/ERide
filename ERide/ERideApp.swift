//
//  ERideApp.swift
//  ERide
//
//  Created by Macmaurice Osuji on 3/11/24.
//

import SwiftUI
import Firebase

@main
struct ERideApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var authenticationViewModel: AuthenticationViewModel = AuthenticationViewModel()
    @StateObject var accountDetailsModel: AccountViewModel = AccountViewModel(accountDetailsModel: AccountDetailsModel(email: "example@gmail.com", familyName: "Taylor", givenName: "Swift", otherName: "", userName: "", address: "", phoneNumber: "", dateOfBirth: Date(), age: 18, hasDriverLicense: false, isVerified: false, rating: 0))
    
    var body: some Scene {
        WindowGroup {
           // RootMenuView()
            ContentView()
                .environmentObject(authenticationViewModel)
                .environmentObject(accountDetailsModel)
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
      print("Done")
    return true
  }
}
