//
//  GKNetworkingManager.swift
//  GateKeeper
//
//  Created by Vladislav Zagorodnyuk on 9/19/16.
//  Copyright © 2016 Vlad Z. All rights reserved.
//

// Networking
import Alamofire

// Parsing
import SwiftyJSON

// Asynch
import PromiseKit

// Extensions
import EZSwiftExtensions

public let GKNetworkingManagerAccessTokenKey = "GKNetworkingManagerAccessTokenKey"
public let GKNetworkingManagerLoginFailureNotificationKey = "GKNetworkingManagerLoginFailureNotificationKey"
public let GKNetworkingManagerLoginSuccessfulNotificationKey = "GKNetworkingManagerLoginSuccessfulNotificationKey"
public let GKNetworkingManagerLogoutSuccessfulNotificationKey = "GKNetworkingManagerLogoutSuccessfulNotificationKey"
public let GKNetworkingManagerRequestUnauthorizedNotificationKey = "GKNetworkingManagerRequestUnauthorizedNotificationKey"

public var _hostName = ""

let hostName = "admin.gatekeeperdirectory.com/GateKeeper/"

class GKNetworkingManager: NSObject {

    private var isHeaderSet = false
    
    var headers = [
        "Content-Type": "application/json"
    ]
    
    var accessToken: String?
//    {
//        get {
//            
//            let keychain = TMAppDelegate.appDelegate?.keychain
//            let accessTokenOld = keychain?[TMNetworkingManagerAccessTokenKey]
//            
//            if accessTokenOld != nil {
//                return accessTokenOld
//            }
//            
//            return nil
//        }
//        set {
//            
//            let keychain = TMAppDelegate.appDelegate?.keychain
//            keychain?[TMNetworkingManagerAccessTokenKey] = newValue
//        }
//    }
    
    static let sharedManager = GKNetworkingManager()
    
    let manager = Alamofire.SessionManager.default
    
    func configureHTTPHeader() {
        
        // Custom header configuration
        self.headers["accessToken"] = "0"
        self.headers["deviceId"] = UIDevice.idForVendor()
    }
    
    // MARK: - Path building
    func handleUnauthorizedResponse() {
        
        self.accessToken = nil
    }
    
    func baseUrl() -> String {
        
        return String(format: "http://%@", hostName)
    }
    
    func URLWithPath(path: String)-> URL {
        
        let urlResult = URL(string: self.URLString(path: path))
        if let urlResult = urlResult {
            
            return urlResult
        }
        
        return URL(string: baseUrl())!
    }
    
    func URLString(path: String)-> String {
        
        return String(format: "%@%@", self.baseUrl(), path)
    }
    
    // MARK: - HTTP Requests
    func request(_ method: HTTPMethod, path URLString: String, parameters: [String: Any]? = nil, success: @escaping (_ response: JSON?)-> Void, failure: @escaping (_ error: Error)-> Void) {
        
        self.configureHTTPHeader()

        self.manager.request(self.URLWithPath(path: URLString), method: method, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
            .validate()
            .responseJSON { response in
                
                // Parsing response to json
                switch response.result {
                case .success:
                    if let value = response.result.value {
                        let json = JSON(value)
                        success(json)
                    }
                case .failure(let error):

                    // Handling failure
                    failure(error)
                }
        }
    }
    
    // MARK: - HTTP Request + Promise
    func request(_ method: HTTPMethod, path URLString: String, parameters: [String: Any]? = nil) -> Promise<JSON> {
        
        self.configureHTTPHeader()
        
        return Promise { fulfill, reject in
            self.manager.request(self.URLWithPath(path: URLString), method: method, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
                .validate()
                .responseJSON { response in

                    switch response.result {
                        
                    case .success:
                        if let value = response.result.value {
                            let json = JSON(value)
                            fulfill(json)
                        }
                        
                    case .failure(let error):
                        
                        reject(error)
                    }
            }
        }
    }
    
    // MARK: - Utilities
    func postUnauthorizedResponseNotification() {
        
        let nc = NotificationCenter.default
        nc.post(name: Notification.Name(rawValue: GKNetworkingManagerRequestUnauthorizedNotificationKey), object: nil)
    }
    
    func clearAllCookies() {
        
        let storage = HTTPCookieStorage.shared
        
        if storage.cookies != nil {
            for cookie in storage.cookies! {
                
                let domainName = cookie.domain
                let domainRange = domainName.range(of: hostName)
                
                if domainRange?.isEmpty != nil {
                    
                    storage.deleteCookie(cookie)
                }
            }
        }
    }
    
    // Notifications
    func postLoginNotificaitonWithSuccess(_ success: Bool) {
        
        let nc = NotificationCenter.default
        
        if success {
            nc.post(name: Notification.Name(rawValue: GKNetworkingManagerLoginSuccessfulNotificationKey), object: nil)
        }
        else {
            nc.post(name: Notification.Name(rawValue: GKNetworkingManagerLoginFailureNotificationKey), object: nil)
        }
    }
}
