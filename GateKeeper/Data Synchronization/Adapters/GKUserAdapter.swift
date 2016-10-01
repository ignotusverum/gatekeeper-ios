//
//  GKUserAdapter.swift
//  GateKeeper
//
//  Created by Vladislav Zagorodnyuk on 10/1/16.
//  Copyright © 2016 Vlad Z. All rights reserved.
//

import PromiseKit
import SwiftyJSON

class GKUserAdapter: GKSynchronizerAdapter {

    // Generate Phone Code Validation Promise
    class func generateValidation(forPhone phone: String, countryCode: String)-> Promise<String?> {
        
        return Promise { fulfill, reject in
            
            // Buiding params - different phone format
            let phoneString = "\(countryCode)\(phone)"
            
            let phoneParams = ["keyData": "mobileNo", "valueData": phoneString]
            let phoneRequest = ["phones": [phoneParams]]
            
            let deviceToken = GKPushHandler.shared.deviceID
            
            // Current device params
            let deviceParams = ["deviceId": UIDevice.idForVendor()!, "deviceType": "2", "deviceToken": deviceToken]
            
            // Current user params
            let userContact: [String: Any] = ["userContact": phoneRequest, "userDevice": deviceParams, "countryCode": countryCode]
            
            // Post request with params
            let netman = GKNetworkingManager.sharedManager
            netman.request(.post, path: "getOtp", parameters: userContact).then { result-> Void in
                
                if let userID = result["data"].string {
                    
                    fulfill(userID)
                }
                    // If it's already mapped - int
                else if let userID = result["data"].int {
                    
                    fulfill(String(userID))
                }
                
                fulfill(nil)
                
                }.catch { error in
                    
                    reject(error)
            }
        }
    }
    
    // Validate generated code
    class func validate(_ code: String, tempUserID: String)-> Promise<JSON?> {
        
        return Promise { fulfill, reject in
            
            let deviceToken = GKPushHandler.shared.deviceID
            
            // Current device params
            let deviceParams = ["deviceId": UIDevice.idForVendor()!, "deviceType": "2", "deviceToken": deviceToken]
            
            let requestParams: [String: Any] = ["id": tempUserID, "password": code, "userDevice": deviceParams]
            
            let netman = GKNetworkingManager.sharedManager
            netman.request(.post, path: "otpVerification", parameters: requestParams).then { result-> Void in
             
                fulfill(result)
                }.catch { error in
                    
                    reject(error)
            }
        }
    }
}
