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
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(authenticationViewModel)
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
