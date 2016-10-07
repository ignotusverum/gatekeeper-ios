//
//  GKAccountTableViewCell.swift
//  GateKeeper
//
//  Created by Vladislav Zagorodnyuk on 10/1/16.
//  Copyright © 2016 Vlad Z. All rights reserved.
//

import UIKit

protocol GKAccountTableViewCellDelegate {
    
    func cellPressed(_ cell: UITableViewCell)
    
    func addActionButtonPressed(_ cell: UITableViewCell)
    func closeActionButtonPressed(_ cell: UITableViewCell)
}

class GKAccountTableViewCell: UITableViewCell {

    // Delegate
    var delegate: GKAccountTableViewCellDelegate?
    
    // Text Input
    @IBOutlet weak var textField: UITextField?
    
    // Icon Image
    @IBOutlet weak var iconImageView: UIImageView?
    
    // Add / Remove Button
    @IBOutlet weak var actionButton: UIButton?
    
    // Icon image name
    public var iconImageName: String {
        return ""
    }
    
    // Placeholder String
    public var placeholderString: String {
        return ""
    }
    
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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.customInit()
    }
    
    func customInit() {
     
        // Set icon image view
        self.iconImageView?.image = UIImage(named: iconImageName)
        
        // Set placeholder
        self.textField?.placeholder = self.placeholderString
    }
    
    // MARK: - Action 
    // Cell pressed
    @IBAction func cellPressed(_ sender: UIButton) {
        
        self.delegate?.cellPressed(self)
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
