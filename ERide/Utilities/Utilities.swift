//
//  Utilities.swift
//  ERide
//
//  Created by Macmaurice Osuji on 4/5/24.
//

import Foundation
import UIKit

final class Utilities {
    
    static let shared = Utilities()
    private init() {}
    
    // MARK: GETTING TOP VIEW CONTOLLER
    @MainActor
    func topViewController(controller: UIViewController? = nil) -> UIViewController? {
        let controller = controller ?? UIApplication.shared.keyWindow?.rootViewController
        
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
    }
    
    // MARK: KNOW IF IT ON DARK MODE
    @MainActor
    func isDarkMode() -> Bool {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            if let colorScheme = windowScene.windows.first?.rootViewController?.view.traitCollection.userInterfaceStyle {
                return colorScheme == .dark
            }
        }
        return false
    }
}

