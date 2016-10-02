//
//  GKPhoneValidationViewController.swift
//  GateKeeper
//
//  Created by Vladislav Zagorodnyuk on 10/1/16.
//  Copyright © 2016 Vlad Z. All rights reserved.
//

import UIKit

class GKPhoneValidationViewController: UIViewController {

    // Temp user id
    var tempUser: TempUser?
    
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
        
        // Become first responder
        self.phoneValidationField.becomeFirstResponder()
    }
    
    // MARK: - Actions
    @IBAction func validatePhoneButtonTapped(_ sender: UIButton) {
        
        if self.phoneValidationField.text!.length > 2 {
        
            self.validatePhoneNumber()
            return
        }
        
        self.view.makeToast("Please enter valid code.")
    }
    
    // MARK: - Utilities
    func validatePhoneNumber() {
        
        // Text check
        if let validationCode = self.phoneValidationField.text {
            
            // Validation request
            GKUserAdapter.validate(validationCode, tempUserID: self.tempUser!.modelID).then { result-> Void in
                
                // Success check
                if let success = result?["success"].bool {
                    if success == true {
                        
                        // Perform segue
                        self.pushAccount()
                    }
                }
                else {
                    
                    // If message = error
                    if let message = result?["message"].string {
                        
                        self.view.makeToast(message)
                        return
                    }
                }
                
                }.catch { error in
             
                    self.showError()
            }
        }
        else {
            
            self.showError()
        }
    }
    
    // MARK: - Utilities
    func showError() {
        
        self.view.makeToast("Something went wrong, please try again.")
    }
    
    func pushAccount() {
        
        // Get account storybard
        let sb = UIStoryboard.init(name: "Account", bundle: nil)
        
        // init controller
        let accountVC = sb.instantiateViewController(withIdentifier: "GKAccountViewController") as! GKAccountViewController
        
        // pass datasource
        accountVC.tempUser = self.tempUser
        
        // Push controller
        self.navigationController?.pushViewController(accountVC, animated: true)
    }
}

extension GKPhoneValidationViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        // lenght should be < 8 and can delete
        return textField.text!.length < 8 || string == ""
    }
}
