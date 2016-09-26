//
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
    @IBOutlet weak var phoneNubmerTextField: PhoneNumberTextField!

    // MARK: - Controller lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add navigation title
        self.addTitleText(titleText: "Generate Code")
        
        // Custom UI setup
        self.customSetup()
        
        print(Locale.current.regionCode)
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
                
                self.countryCodeTextField.text = "+" + String(countryCode)
            }
        }
    }
    
    // MARK: - Actions
    @IBAction func generateCodeButtonPressed(_ sender: UIButton) {
     
        print("generate code button pressed")
    }
}
