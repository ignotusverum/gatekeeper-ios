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

@objc(GKUser)
public class GKUser: _GKUser {

	// MARK: - Synchronization logic
	class func synchronize(withJSON JSON: [String : Any])-> Promise<GKUser?> {

		return Promise { fulfill, reject in

			let appDelegate = GKAppDelegate.shared
			let stack = appDelegate.dataStack

			Sync.changes(
				changes: JSON,
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
