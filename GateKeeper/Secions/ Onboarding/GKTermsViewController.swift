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
        
        self.customSetup()
        
        // Setting title for navBar
        self.addTitleText(titleText: "Terms & Conditions")
    }
    
    // MARK: - UI Setup
    // Scroll to bottom of textView
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.termsTextView.setContentOffset(CGPoint.zero, animated: false)
    }
    
    func customSetup() {
        
        let config = GKCongif.shared
        
        // Show Terms if it's stored
        if let termsString = config.termsString {
            
            self.termsTextView.text = termsString
        }
        else {
         
            GMDCircleLoader.setOn(self.view, withTitle: "", animated: true)
            
            GKCongif.fetchTerms().then { resultString-> Void in
                
                self.termsTextView.text = resultString
                
                GMDCircleLoader.hide(from: self.view, animated: true)
                
                }.catch { error in
                    
                    self.termsTextView.text = ""
                    
                    GMDCircleLoader.hide(from: self.view, animated: true)
            }
        }
    }
    
    // MARK: - Actions
    @IBAction func acceptButtonPressed(_ sender: UIButton) {
        
        // Phone input segue
        self.performSegue(withIdentifier: "phoneInputSegue", sender: nil)
    }
    
    @IBAction func rejectButtonPressed(_ sender: UIButton) {
        
        self.showOneButtonAlertController(title: "Warning", message: "If you want to proceed, please accept Terms & Conditions.", cancelButtonText: "OK")
    }
}
