//
//  GKSynchronizerAdapter.swift
//  GateKeeper
//
//  Created by Vladislav Zagorodnyuk on 9/25/16.
//  Copyright © 2016 Vlad Z. All rights reserved.
//

protocol GKSynchronizerAdapterDelegate {
    
    func adapterDidSynchronized(adapter: GKSynchronizerAdapter)
}

class GKSynchronizerAdapter: NSObject {

    // MARK: - Delegates
    var delegate: GKSynchronizerAdapterDelegate?
    
    // MARK: - Properties
    var synchronized = false
    
    var updateNotificationKey: String?
    
    // MARK: - Initialization methods
    
    class func modelName()-> String {
        return ""
    }
    
    class func updatedNotificationKey()-> String {
        
        return String(format: "GKSynchronizerAdapterUpdateNotificationFor%@", self.modelName())
    }
    
    class func postUpdateNoticiation(objectID: String?) {
        
        guard let _objectID = objectID else {
            
            print("objectID in update call is nil")
            return
        }
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: self.updatedNotificationKey()), object: nil, userInfo: ["objectID": _objectID])
    }
    
    // MARK: - Synchronization logic
    
    func synchronizeData() {
        
        self.synchronized = true
        
        if self.delegate != nil {
            self.delegate?.adapterDidSynchronized(adapter: self)
        }
    }
}
