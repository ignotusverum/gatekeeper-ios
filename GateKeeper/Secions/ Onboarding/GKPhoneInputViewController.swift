
//  GKPhoneInputViewController.swift
//  GateKeeper
//
//  Created by Vladislav Zagorodnyuk on 9/26/16.
//  Copyright © 2016 Vlad Z. All rights reserved.
//

import UIKit
import PhoneNumberKit

class GKPhoneInputViewController: UIViewController {

    // MARK: - Outlets
    // Description label
    @IBOutlet weak var descriptionLabel: UILabel!
    
    // Country input
    @IBOutlet weak var countryCodeTextField: UITextField!
    
    // Phone input
    // Automatically formats with local region
    @IBOutlet weak var phoneNubmerTextField: PhoneNumberTextField!
    
    // Formatted phone number
    var phoneNumber: String? {
        
        do {
            let phoneNumber = try PhoneNumber(rawNumber: self.phoneNubmerTextField.text!)
            
            return phoneNumber.toE164()
        } catch { }
        
        return nil
    }

    // MARK: - Controller lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add navigation title
        self.addTitleText(titleText: "Generate Code")
        
        // Custom UI setup
        self.customSetup()
    }
    
    // MARK: - Custom Setup
    func customSetup() {
        
        // Copy Setup
        let copy = GKCopy.shared
        self.descriptionLabel.attributedText = copy.phoneInput
        
        // Current reion setup
        let phoneNumberKit = PhoneNumberKit()
        
        if let currentRegion = Locale.current.regionCode {
         
            let countryCode = phoneNumberKit.codeForCountry(currentRegion)
            
            if let countryCode = countryCode {
            
                // Int to string
                let countryCodeString = String(countryCode)
                
                // Setting country code for region
                self.countryCodeTextField.text = "+" + countryCodeString
            }
        }
    }
    
    // MARK: - Actions
    @IBAction func generateCodeButtonPressed(_ sender: UIButton) {
        
        // Validation check + Country code check
        guard let countryCode = self.countryCodeTextField.text, countryCodeTextField.text!.length > 0, phoneNubmerTextField.isValidNumber else {
            
            // Show alert
            self.view.makeToast("Please enter country code")
            
            return
        }
        
        // Buiding params - different phone format
        let phoneParams = ["keyData": "mobileNo", "valueData": self.phoneNumber!]
        let phoneRequest = ["phones": phoneParams]
        
        let deviceToken = GKPushHandler.shared.deviceID
        
        // Current device params
        let deviceParams = ["deviceId": UIDevice.idForVendor()!, "deviceType": "2", "deviceToken": deviceToken]
        
        // Current user params
        let userContact: [String: Any] = ["userContact": phoneRequest, "userDevice": deviceParams, "countryCode": countryCode]
        
        // Post request with params
        let netman = GKNetworkingManager.sharedManager
        netman.request(.post, path: "getOtp", parameters: userContact).then { result-> Void in
            print(result)
            
            }.catch { error in
                print(error)
        }
    }
}
