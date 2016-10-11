//
//  GKPhoneCell.swift
//  GateKeeper
//
//  Created by Vladislav Zagorodnyuk on 10/2/16.
//  Copyright © 2016 Vlad Z. All rights reserved.
//

import UIKit
import PhoneNumberKit

class GKPhoneCell: GKAccountTableViewCell {

    // Phone input textField
    @IBOutlet weak var phoneNumberInput: PhoneNumberTextField!
    
    override public var placeholderString: String {
        return "Home"
    }
    
    // Overriding icon name
    override public var iconImageName: String {
        return "ico_phone"
    }
}
