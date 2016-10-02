//
//  GKFirstNameCell.swift
//  GateKeeper
//
//  Created by Vladislav Zagorodnyuk on 10/2/16.
//  Copyright © 2016 Vlad Z. All rights reserved.
//

import UIKit

class GKFirstNameCell: GKAccountTableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.customSetup()
    }
    
    func customSetup() {
        
        self.textField.placeholder = "First name"
        self.iconImageView.image = UIImage(named: "ico_user")
    }
}
