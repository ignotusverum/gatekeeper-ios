//
//  GKCopy.swift
//  GateKeeper
//
//  Created by Vladislav Zagorodnyuk on 9/26/16.
//  Copyright © 2016 Vlad Z. All rights reserved.
//

import UIKit

class GKCopy: NSObject {

    static let shared = GKCopy()
    
    // Phone Input Attirbuted Copy
    var phoneInput: NSAttributedString {
        
        // A Confirmation Code will be generated & sent through SMS to the entered mobile number
        
        let ccString = NSMutableAttributedString(string: "Confirmation Code").bold()
        let smsString = NSMutableAttributedString(string: "SMS").bold()
        let mobileString = NSMutableAttributedString(string: "mobile").bold()

        let resultString = NSMutableAttributedString(string: "A ")
        resultString.append(ccString)
        resultString.append(NSAttributedString(string: " will be generated & sent through "))
        resultString.append(smsString)
        resultString.append(NSAttributedString(string: " to the entered "))
        resultString.append(mobileString)
        resultString.append(NSAttributedString(string: " number"))
        
        return resultString
    }
    
    var phoneValidation: NSAttributedString? {
       
        // *Code* has been sent to you via *message*. It will expire after 30 minutes.
        
        let code = NSMutableAttributedString(string: "Code").bold()
        let message = NSMutableAttributedString(string: "message").bold()
        
        let resultString = NSMutableAttributedString(attributedString: code)
        resultString.append(NSAttributedString(string: " has been sent to you via "))
        resultString.append(message)
        resultString.append(NSAttributedString(string: ". It will expire after 30 minutes."))
        
        return resultString
    }
}
