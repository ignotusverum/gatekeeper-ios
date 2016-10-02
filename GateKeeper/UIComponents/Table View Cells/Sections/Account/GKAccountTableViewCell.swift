//
//  GKAccountTableViewCell.swift
//  GateKeeper
//
//  Created by Vladislav Zagorodnyuk on 10/1/16.
//  Copyright © 2016 Vlad Z. All rights reserved.
//

import UIKit

class GKAccountTableViewCell: UITableViewCell {

    // Text Input
    @IBOutlet weak var textField: UITextField!
    
    // Icon Image
    @IBOutlet weak var iconImageView: UIImageView!
    
    // Icon image name
    public var iconImageName: String {
        return ""
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Set icon image view
        self.iconImageView.image = UIImage(named: iconImageName)
    }
}
