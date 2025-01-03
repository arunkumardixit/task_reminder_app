//
//  TaskTestModuleNativeAPI.swift
//  Runner
//
//  Created by Arun Dixit on 03/01/25.
//

import Foundation

class TaskTestModuleNativeAPI: TaskTestModuleNative {
    
    func addNotification(task: NativeTaskConfig) throws {
        let viewController = UIApplication.shared.windows.first?.rootViewController

        let content = UNMutableNotificationContent()
        content.title = task.title
        content.body = task.description
        content.sound = UNNotificationSound.default
        
        var dateComponents = DateComponents()
        dateComponents.calendar = Calendar.current


        
        dateComponents.hour = Int(task.hour)
        dateComponents.minute = Int(task.minute)
        // Create the trigger as a repeating event.
        let trigger = UNCalendarNotificationTrigger(
                 dateMatching: dateComponents, repeats: false)
       
        
        let uuidString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)


        // Schedule the request with the system.
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.add(request)
        let alert = UIAlertController(title: "Task Remider", message: "Notification Added for \(task.title)", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        viewController?.present(alert, animated: true, completion: nil)
    }
    
    
}
