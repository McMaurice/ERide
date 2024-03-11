//
//  NotificationManager.swift
//  ERide
//
//  Created by Macmaurice Osuji on 3/11/24.
//

import Foundation
import UserNotifications

class NotificationManager {
    
    //NotificationManager.instance.scheduleNotification(date: date, title: title)
    static let instance = NotificationManager()
    
    func requestAuthorization() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { success, error in
            if let error = error {
                print("ERROR: \(error)")
            } else {
                print("SUCCESS")
            }
        }
    }
    
    func scheduleNotification(date: Date, title: String) {
        let content = UNMutableNotificationContent()
        content.title = "Your ERide is nearby"
        content.subtitle = "Contact Rider"
        content.sound = .default
        content.badge = 1
        
        //Calendar
        let calendar = Calendar.current
        let dateComponents = calendar.dateComponents([.hour, .minute, .second], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
  
        
        let request = UNNotificationRequest(identifier: UUID().uuidString,
                                            content: content,
                                            trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
    
    func cancelNotifications() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
    }
}
