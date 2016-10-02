//
//  GKPlaceholder.swift
//  GateKeeper
//
//  Created by Vladislav Zagorodnyuk on 10/2/16.
//  Copyright © 2016 Vlad Z. All rights reserved.
//

import UIKit

class GKPlaceholder: GKAccountTableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.textField.placeholder = "Placeholder"
    }
}
