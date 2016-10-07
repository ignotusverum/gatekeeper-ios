//
//  GKActionAccountTableViewCell.swift
//  GateKeeper
//
//  Created by Vladislav Zagorodnyuk on 10/1/16.
//  Copyright © 2016 Vlad Z. All rights reserved.
//

import UIKit

protocol GKActionAccountTableViewCellDelegate {
    
    func addActionButtonPressed(_ cell: GKActionAccountTableViewCell)
    func closeActionButtonPressed(_ cell: GKActionAccountTableViewCell)
}

class GKActionAccountTableViewCell: GKAccountTableViewCell {

    // Is first - add button
    var indexPath: IndexPath? {
        didSet {
            
            // If first row - update button icons
            if indexPath?.row == 0 {
                
                self.actionButton?.setImage(UIImage(named: "Add"), for: .normal)
                
                return
            }
            
            self.actionButton?.setImage(UIImage(named: "Close"), for: .normal)
        }
    }
    
    // Add / Remove Button
    @IBOutlet weak var actionButton: UIButton?

    // Delegate
    var delegate: GKActionAccountTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Setting image only if index == 0
        if self.indexPath?.row == 0 {
            
            self.iconImageView?.image = UIImage(named: iconImageName)
        }
    }
    
    // Action
    @IBAction func actionButtonPressed(_ sender: UIButton) {
    
        // First row = add
        if self.indexPath?.row == 0 {
            
            self.delegate?.addActionButtonPressed(self)
            
            return
        }
        
        // Remove
        self.delegate?.closeActionButtonPressed(self)
    }
}
