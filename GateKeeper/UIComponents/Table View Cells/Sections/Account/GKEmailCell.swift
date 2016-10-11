//
//  GKEmailCell.swift
//  GateKeeper
//
//  Created by Vladislav Zagorodnyuk on 10/2/16.
//  Copyright © 2016 Vlad Z. All rights reserved.
//

import UIKit

class GKEmailCell: GKAccountTableViewCell {

    // Overriding icon name
    override public var iconImageName: String {
        return "ico_email"
    }
    
    override public var placeholderString: String {
        return "Email"
    }
}
