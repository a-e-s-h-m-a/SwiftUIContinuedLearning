//
//  LocalNotificationBootcamp.swift
//  ContinuedLearning
//
//  Created by Malith Madhushanka on 2024-01-26.
//

import SwiftUI
import UserNotifications
import CoreLocation

class NotificationManager {
    static let instance = NotificationManager() // singleton
    
    func requestAuthorization() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { (success, error) in
            if let error = error {
                print("ERROR: \(error)")
            } else {
                print("SUCCESS")
            }
        }
    }
    
    func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = "This is my first notification"
        content.subtitle = "This was sooo easy"
        content.sound = .default
        content.badge = 1
        
        // triggers ---
        // 1 - time
        let timeTrigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
        
        // 2 - calander
        var dateComponents = DateComponents()
        dateComponents.hour = 20
        dateComponents.minute = 49
        // dateComponents.weekday = 6 // friday
        let calanderTrigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        // 3 - location
        let coordinates = CLLocationCoordinate2D(
            latitude: 40.00,
            longitude: 50.00
        )
        
        let region = CLCircularRegion(
            center: coordinates,
            radius: 100,
            identifier: UUID().uuidString
        )
        region.notifyOnEntry = true
        region.notifyOnExit = false
        let locationTrigger = UNLocationNotificationTrigger(region: region, repeats: true)
        
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: timeTrigger // calanderTrigger, locationTrigger
        )
        UNUserNotificationCenter.current().add(request)
    }
    
    func cancelNotifications() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
    }
    
    func clearBadges() {
        UNUserNotificationCenter.current().setBadgeCount(0)
    }
}

struct LocalNotificationBootcamp: View {
    var body: some View {
        VStack(spacing: 40) {
            Button("Request permission") {
                NotificationManager.instance.requestAuthorization()
            }
            Button("Schedule notifications") {
                NotificationManager.instance.scheduleNotification()
            }
            Button("Cancel notifications") {
                NotificationManager.instance.cancelNotifications()
            }
        }
        .onAppear {
//            NotificationManager.instance.clearBadges()
            UIApplication.shared.applicationIconBadgeNumber = 0
        }
    }
}

#Preview {
    LocalNotificationBootcamp()
}
