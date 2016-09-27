//
//  GKPushHandler.swift
//  GateKeeper
//
//  Created by Vladislav Zagorodnyuk on 9/26/16.
//  Copyright © 2016 Vlad Z. All rights reserved.
//

import UIKit
import UserNotifications

class GKPushHandler: NSObject {

    static let shared = GKPushHandler()
    
    // Device ID
    var deviceID = "1234567890"
    
    // Shared Manager
    
    class func deviceTokenString(deviceToken: Data)-> String {
        
        let characterSet :CharacterSet = CharacterSet(charactersIn: "<>")
        let deviceTokenString: String = (deviceToken.description)
            .trimmingCharacters(in: characterSet)
            .replacingOccurrences(of: " ", with: "")
        
        self.shared.deviceID = deviceTokenString
        
        return deviceTokenString
    }
    
    class func registerForPushNotifications(application: UIApplication) {
        
        if #available(iOS 10.0, *) {
            
            UNUserNotificationCenter.current().getNotificationSettings(){ (setttings) in
                
                switch setttings.soundSetting{
                case .enabled:
                    
                    print("enabled sound setting")
                    
                case .disabled:
                    
                    print("setting has been disabled")
                    
                case .notSupported:
                    print("something vital went wrong here")
                }
            }

        } else {
            
            let setting = UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
            
            application.registerUserNotificationSettings(setting)
            application.registerForRemoteNotifications()
        }
    }
    
    class func sendPushToken(pushToken: Data, success: ()-> Void, failure: ()-> Void) {
        
        let pushTokenString = self.deviceTokenString(deviceToken: pushToken)
        
        // Register call
    }
}
