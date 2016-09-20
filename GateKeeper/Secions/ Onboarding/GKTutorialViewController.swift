//
//  GKTutorialViewController.swift
//  GateKeeper
//
//  Created by Vladislav Zagorodnyuk on 9/19/16.
//  Copyright © 2016 Vlad Z. All rights reserved.
//

import UIKit

class GKTutorialViewController: UIViewController {

    @IBOutlet var imageView: UIImageView! {
        didSet {
            
            self.imageView.image = UIImage(named: self.imageName)
        }
    }
    
    private var imageName = ""
    
    func customSetup(imageName: String) {
        
        self.imageName = imageName
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
