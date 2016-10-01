//
//  GKPhoneValidationViewController.swift
//  GateKeeper
//
//  Created by Vladislav Zagorodnyuk on 10/1/16.
//  Copyright © 2016 Vlad Z. All rights reserved.
//

import UIKit

class GKPhoneValidationViewController: UIViewController {

    // Phone Validation Field
    @IBOutlet weak var phoneValidationField: UITextField! {
        didSet {
            
            phoneValidationField.layer.borderWidth = 1.0
            phoneValidationField.layer.borderColor = UIColor.GKBorderColor.cgColor
        }
    }
    
    // Title copy
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: - Controller lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Adding title
        self.addTitleText(titleText: "Validate Phone Number")
        
        // Custom ui setup
        self.customInit()
    }
    
    // Custom init
    func customInit() {
        
        // Attributed string
        let sharedCopy = GKCopy.shared
        
        self.titleLabel.attributedText = sharedCopy.phoneValidation
    }
}
