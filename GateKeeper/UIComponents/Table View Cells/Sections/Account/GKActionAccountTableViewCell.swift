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

    // Add / Remove Button
    @IBOutlet weak var actionButton: UIButton!

    // Delegate
    var delegate: GKActionAccountTableViewCellDelegate?
    
    // Action
    @IBAction func actionButtonPressed(_ sender: UIButton) { }
}
