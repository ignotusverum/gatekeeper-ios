//
//  GKCongif.swift
//  GateKeeper
//
//  Created by Vladislav Zagorodnyuk on 9/26/16.
//  Copyright © 2016 Vlad Z. All rights reserved.
//

import UIKit
import PromiseKit
import SwiftyJSON

class GKCongif: NSObject {
    
    // Shared Manager
    static let shared = GKCongif()

    var termsString: String?
    
    // Terms request
    class func fetchTerms()-> Promise<String?> {
        
        return Promise { fulfill, reject in
         
            let netman = GKNetworkingManager.sharedManager
            netman.request(.post, path: "getTermAndCondtion").then { result-> Void in
                
                if let termsString = result["data"].string {
                    fulfill(termsString)
                }
                else {
                    fulfill(nil)
                }
                
                }.catch { error in
                    reject(error)
            }
        }
    }
}
