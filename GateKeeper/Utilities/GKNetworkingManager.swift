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

public let GKNetworkingManagerAccessTokenKey = "GKNetworkingManagerAccessTokenKey"
public let GKNetworkingManagerLoginFailureNotificationKey = "GKNetworkingManagerLoginFailureNotificationKey"
public let GKNetworkingManagerLoginSuccessfulNotificationKey = "GKNetworkingManagerLoginSuccessfulNotificationKey"
public let GKNetworkingManagerLogoutSuccessfulNotificationKey = "GKNetworkingManagerLogoutSuccessfulNotificationKey"
public let GKNetworkingManagerRequestUnauthorizedNotificationKey = "GKNetworkingManagerRequestUnauthorizedNotificationKey"

public var _hostName = ""

let hostName = "admin.gatekeeperdirectory.com/GateKeeper/"
let hostVersion = "1"

class GKNetworkingManager: NSObject {

    
}
