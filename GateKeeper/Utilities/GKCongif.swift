//
//  GKCongif.swift
//  GateKeeper
//
//  Created by Vladislav Zagorodnyuk on 9/26/16.
//  Copyright © 2016 Vlad Z. All rights reserved.
//

import UIKit
import PromiseKit

class GKCongif: NSObject {
    
    // Shared Manager
    static let shared = GKCongif()

    // Terms request
    class func fetchTerms()-> Promise<String?> {
        
        return Promise { fulfill, reject in
         
            let netman = GKNetworkingManager.sharedManager
            netman.request(.post, path: "getTermAndCondtion").then { result in
                
                fulfill(nil)
                
                }.catch { error in
                    reject(error)
            }
        }
    }
}
