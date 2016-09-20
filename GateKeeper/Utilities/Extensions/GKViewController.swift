//
//  GKViewController.swift
//  GateKeeper
//
//  Created by Vladislav Zagorodnyuk on 9/20/16.
//  Copyright © 2016 Vlad Z. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func addTitleText(titleText: String, color: UIColor = UIColor.black) {
        
        let label = UILabel()
        
        label.text = titleText
        
        label.sizeToFit()
        
        self.navigationItem.titleView = label
    }
    
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
