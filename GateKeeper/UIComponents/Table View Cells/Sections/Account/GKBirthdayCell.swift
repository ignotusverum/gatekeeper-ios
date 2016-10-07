//
//  GKBirthdayCell.swift
//  GateKeeper
//
//  Created by Vladislav Zagorodnyuk on 10/2/16.
//  Copyright © 2016 Vlad Z. All rights reserved.
//

import UIKit

class GKBirthdayCell: GKAccountTableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Disable input
        self.textField?.isUserInteractionEnabled = false
    }
    
    // Override Placeholder
    override public var placeholderString: String {
        return "Birthday"
    }

    // Overriding icon name
    override public var iconImageName: String {
        return "ico_date"
    }
}
