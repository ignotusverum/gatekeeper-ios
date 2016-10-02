//
//  GKUser.swift
//  GateKeeper
//
//  Created by Vladislav Zagorodnyuk on 10/02/16.
//  Copyright Â© 2016 Vladislav Zagorodnyuk Co. All rights reserved.
//

import Sync
import CoreData

import PromiseKit

struct tempUser {
    
    var firstName: String?
    var lastName: String?
    
    var prefix: String?
    
    var phoneNumber: String?
    
    var emails: [String]?
    
    var addresses: [Address]?
    
    var works: [Work]?
    
    var socials: [String]?
    
    var birthday: Date?
    
    init(phoneNumber: String?) {
        
        self.phoneNumber = phoneNumber
    }
}

struct Work {
    
    var company: String?
    var Title: String?
}

struct Address {
    
    var street1: String?
    var street2: String?
    
    var city: String?
    var state: String?
    
    var country: String?
    var zip: String?
}

@objc(GKUser)
open class GKUser: _GKUser {

	// MARK: - Synchronization logic
	class func synchronize(withJSON JSON: [[String : Any]])-> Promise<GKUser?> {

		return Promise { fulfill, reject in

			let appDelegate = GKAppDelegate.shared
			let stack = appDelegate!.dataStack

			Sync.changes(JSON,
				inEntityNamed: GKUser.entityName(),
				dataStack: stack,
				completion: { error in

					if let error = error {
						reject(error)
					}
                    else {
                        fulfill(nil)
                    }
            })
        }
    }
}
