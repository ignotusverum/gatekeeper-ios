//
//  GKSynchronizerHandler.swift
//  GateKeeper
//
//  Created by Vladislav Zagorodnyuk on 9/25/16.
//  Copyright © 2016 Vlad Z. All rights reserved.
//

let GKSynchronizerHandlerSynchronizedNotificationKey = "GKSynchronizerHandlerSynchronizedNotificationKey"

class GKSynchronizerHandler: NSObject, GKSynchronizerAdapterDelegate {

    // MARK: - Properties
    
    var showProgress = false
    
    var dataAdaptersArray: [GKSynchronizerAdapter]?
    
    static let sharedSynchronizer = GKSynchronizerHandler()
    
    var synchronized: Bool = false
    
    // MARK: - Synchronization logic
    // synchronizing all adapters
    func resynchronize() {
        
        self.synchronized = false
        
        guard let _dataAdaptersArray = self.dataAdaptersArray else {
            
            return
        }
        
        if _dataAdaptersArray.count > 0 {
            for adapter in _dataAdaptersArray {
                
                adapter.synchronizeData()
            }
        }
    }
    
    func addAdapter(adapter: GKSynchronizerAdapter) {
        
        if self.dataAdaptersArray != nil {
            
            adapter.delegate = self
            self.dataAdaptersArray!.append(adapter)
        }
    }
    
    func adapterDidSynchronized(adapter: GKSynchronizerAdapter) {
        
        guard let _dataAdaptersArray = self.dataAdaptersArray else {
            
            return
        }
        
        var synchronized = true
        
        if _dataAdaptersArray.count > 0 {
            
            for adapter in _dataAdaptersArray {
                if !adapter.synchronized {
                    synchronized = false
                }
                
                print("--------------------")
                print(adapter, adapter.synchronized)
            }
        }
        
        self.synchronized = synchronized
        
        if self.synchronized {
            
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: GKSynchronizerHandlerSynchronizedNotificationKey), object: nil)
        }
    }

}
