//
//  GKTermsViewController.swift
//  GateKeeper
//
//  Created by Vladislav Zagorodnyuk on 9/20/16.
//  Copyright © 2016 Vlad Z. All rights reserved.
//

import UIKit

class GKTermsViewController: UIViewController {

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
    }
}
