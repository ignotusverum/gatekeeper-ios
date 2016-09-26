//
//  GKPhoneInputViewController.swift
//  GateKeeper
//
//  Created by Vladislav Zagorodnyuk on 9/26/16.
//  Copyright © 2016 Vlad Z. All rights reserved.
//

import UIKit

class GKPhoneInputViewController: UIViewController {


    // MARK: - Controller lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add navigation title
        self.addTitleText(titleText: "Generate Code")
    }
}
