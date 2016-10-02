//
//  GKPhoneCell.swift
//  GateKeeper
//
//  Created by Vladislav Zagorodnyuk on 10/2/16.
//  Copyright © 2016 Vlad Z. All rights reserved.
//

import UIKit

class GKPhoneCell: GKActionAccountTableViewCell {

    // Is first - add button
    var indexPath: IndexPath? {
        didSet {
            
            // If first row - update button icons
            if indexPath?.row == 0 {
                
                self.actionButton.setImage(UIImage(named: "Add"), for: .normal)
                
                return
            }
            
            self.actionButton.setImage(UIImage(named: "Close"), for: .normal)
        }
    }
    
    override func actionButtonPressed(_ sender: UIButton) {
     
        // First row = add
        if self.indexPath?.row == 0 {
            
            self.delegate?.addActionButtonPressed(self)
            
            return
        }
        
        // Remove 
        self.delegate?.closeActionButtonPressed(self)
    }
}
