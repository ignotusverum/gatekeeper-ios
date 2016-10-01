//
//  GKActionAccountTableViewCell.swift
//  GateKeeper
//
//  Created by Vladislav Zagorodnyuk on 10/1/16.
//  Copyright © 2016 Vlad Z. All rights reserved.
//

import UIKit

protocol GKActionAccountTableViewCellDelegate {
    
    func actionButtonPressed(_ cell: GKActionAccountTableViewCell)
}

class GKActionAccountTableViewCell: GKAccountTableViewCell {

    // Add / Remove Button
    @IBOutlet weak var actionButton: UIButton!

    // Delegate
    
    
    @IBAction func actionButtonPressed(_ sender: UIButton) {
        
    }
}
