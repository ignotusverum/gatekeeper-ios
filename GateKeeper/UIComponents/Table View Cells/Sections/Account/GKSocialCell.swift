//
//  GKSocialCell.swift
//  GateKeeper
//
//  Created by Vladislav Zagorodnyuk on 10/2/16.
//  Copyright © 2016 Vlad Z. All rights reserved.
//

import UIKit

class GKSocialCell: GKActionAccountTableViewCell {

    // Override Placeholder
    override public var placeholderString: String {
        return "Website"
    }
    
    // Overriding icon name
    override public var iconImageName: String {
        return "ico_web"
    }
}
