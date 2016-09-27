//
//  AppDelegate.swift
//  GateKeeper
//
//  Created by Vladislav Zagorodnyuk on 9/19/16.
//  Copyright © 2016 Vlad Z. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

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
        style.backgroundColor = UIColor.GKBlueColor()
        style.messageFont = UIFont.appBoldFont(size: 15.0)
        
        ToastManager.shared.style = style
    }
    
    // MARK: - Notifications
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        
        
    }
}
