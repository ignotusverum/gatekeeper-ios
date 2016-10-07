//
//  GKModalView.swift
//  GateKeeper
//
//  Created by Vladislav Zagorodnyuk on 10/2/16.
//  Copyright © 2016 Vlad Z. All rights reserved.
//

import UIKit

class GKModalView: UIView {

    // Datasource Array
    var datasource = [String]()
    
    // Background
    @IBOutlet weak var backgroundView: UIView!
    
    // Datasource
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    // Selection Handler
    var selectionHandler: ((_ indexPath: IndexPath) -> Void)?
    
    // MARK: - View lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let modalCellNib = UINib(nibName: "GKModalTableViewCell", bundle: nil)
        self.tableView.register(modalCellNib, forCellReuseIdentifier: "GKModalTableViewCell")
    }
}

// Table View Datasource
extension GKModalView: UITableViewDataSource {
    
    @objc(tableView:heightForRowAtIndexPath:)
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "GKModalTableViewCell", for: indexPath) as! GKModalTableViewCell
        cell.typeLabel.text = datasource[indexPath.row]
        
        return cell
    }
}

// Table View Delegate
extension GKModalView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Pass selectionHandler
        self.selectionHandler?(indexPath)
    }
}
