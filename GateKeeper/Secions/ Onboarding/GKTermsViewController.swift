//
//  GKTermsViewController.swift
//  GateKeeper
//
//  Created by Vladislav Zagorodnyuk on 9/20/16.
//  Copyright © 2016 Vlad Z. All rights reserved.
//

import UIKit

class GKTermsViewController: UIViewController {

    // MARK: - Outlets
    
    // Control Buttons
    @IBOutlet weak var acceptButton: UIButton!
    @IBOutlet weak var rejectButton: UIButton!
    
    // Terms Text View
    @IBOutlet weak var termsTextView: UITextView!
    
    // MARK: - Controller lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Showing navigation bar
        self.navigationController?.view.backgroundColor = UIColor.white
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setting title for navBar
        self.addTitleText(titleText: "Terms & Conditions")
        
        // UI Setup
        self.customSetup()
    }
    
    // MARK: - UI Setup
    func customSetup() {
        
        GKCongif.fetchTerms()
    }
    
    // MARK: - Actions
    @IBAction func acceptButtonPressed(_ sender: UIButton) {
        
        // Perform segue to code generation
    }
    
    @IBAction func rejectButtonPressed(_ sender: UIButton) {
        
        self.showOneButtonAlertController(title: "Warning", message: "If you want to proceed, please accept Terms & Conditions.", cancelButtonText: "OK")
    }
}
