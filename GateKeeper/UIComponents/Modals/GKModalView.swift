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
    var datasource = [String]() {
        didSet {
            // Reload tableView
            self.tableView.reloadData()
        }
    }
    
    static let shared = UINib(nibName: "GKModalView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! GKModalView
    
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
    
    func showAnimate() {
        
        let window = GKAppDelegate.shared!.window!
        
        let sharedView = GKModalView.shared
        
        sharedView.frame = window.frame
        sharedView.datasource = ["Test 1", "Test 2"]
        sharedView.backgroundImageView.alpha = 0.9
        
        window.addSubview(sharedView)
        
        self.showAnimateLogic()
    }
    
    private func showAnimateLogic() {
        
        let sharedView = GKModalView.shared
        
        sharedView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        sharedView.alpha = 0.0
        
        UIView.animate(withDuration: 0.25, animations: {
            
            sharedView.alpha = 1.0
            sharedView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        })
    }
    
    func removeAnimate() {
        
        let sharedView = GKModalView.shared
        
        sharedView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        sharedView.alpha = 0.0
        
        UIView.animate(withDuration: 0.25, animations: {
            
            sharedView.removeFromSuperview()
        })
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
