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
}
