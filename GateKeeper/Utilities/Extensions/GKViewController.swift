//
//  GKViewController.swift
//  GateKeeper
//
//  Created by Vladislav Zagorodnyuk on 9/20/16.
//  Copyright © 2016 Vlad Z. All rights reserved.
//

import UIKit

extension UIViewController {
    
    // Title Setup
    func addTitleText(titleText: String, color: UIColor = UIColor.black) {
        
        let label = UILabel()
        
        label.attributedText = titleText.navTitle()
        
        label.sizeToFit()
        
        self.navigationItem.titleView = label
    }
    
    // Alert
    func showOneButtonAlertController(title: String, message: String, cancelButtonText: String) {
        
        let alertController = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: cancelButtonText, style: .cancel, handler:nil)
        
        alertController.addAction(alertAction)
        
        self.presentVC(alertController)
    }
    
    // Action
    @IBAction func backButtonPressed(_ sender: AnyObject?) {
        
        self.view.endEditing(true)
        
        if self.presentingViewController?.presentedViewController != nil {
            
            self.dismissVC(completion: nil)
        }
        else {
            self.popVC()
        }
    }
}
