//
//  AppDelegate.swift
//  GateKeeper
//
//  Created by Vladislav Zagorodnyuk on 9/19/16.
//  Copyright © 2016 Vlad Z. All rights reserved.
//

import UIKit
import UserNotifications

import DATAStack

@UIApplicationMain
class GKAppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

    // Shared delegate
    static let shared = UIApplication.shared.delegate as? GKAppDelegate
    
    // Window
    var window: UIWindow?
    
    // Data stack
    lazy var dataStack: DATAStack = {
        let dataStack = DATAStack(modelName: "GKModel")
        
        return dataStack
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
     
        // Fetching shared data
        self.fetchTerms()
        
        // Alert setup
        self.modalAlertSetup()
        
        return true
    }
    
    // MARK: - Fetching logic
    func fetchTerms() {
        
        let config = GKCongif.shared
        
        GKCongif.fetchTerms().then { result in
            
            config.termsString = result
            }.catch { error in
                print(error)
        }
    }
    
    // MARK: - UI Setup
    func modalAlertSetup() {
        
        // create a new style
        var style = ToastStyle()
        
        // this is just one of many style options
        style.backgroundColor = UIColor.GKBlueColor
        style.messageFont = UIFont.appBoldFont(size: 15.0)
        
        ToastManager.shared.style = style
    }
    
    // MARK: - Push Notifications
    
    @available(iOS 10.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler(.alert)
    }

    @available(iOS 10.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
    }
    
    func registerForPushNotificationsAndUpdateToken() {
        
//        GKPushHandler.registerForPushNotifications(UIApplication.sharedApplication())
    }
    
    func application(_ application: UIApplication, didRegister notificationSettings: UIUserNotificationSettings) {
        if notificationSettings.types != .none {
            application.registerForRemoteNotifications()
        }
    }

    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        GKPushHandler.sendPushToken(pushToken: deviceToken, success: {}) {}
    }
}
