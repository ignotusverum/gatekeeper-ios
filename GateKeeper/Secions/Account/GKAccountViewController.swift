//
//  GKAccountViewController.swift
//  GateKeeper
//
//  Created by Vladislav Zagorodnyuk on 10/1/16.
//  Copyright © 2016 Vlad Z. All rights reserved.
//

import UIKit

class GKAccountViewController: UIViewController {

    // User image
    @IBOutlet weak var profileImageButton: UIButton!
    
    // User tableview data
    @IBOutlet weak var tableView: UITableView!
    
    // User datasource
    var tempUser: TempUser?
    
    // MARK: - Controller lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Init custom cells
        self.tableViewInit()
    }
    
    // Table view init
    func tableViewInit() {
     
        // Account cells
        let accountCellNib = UINib(nibName: "GKAccountTableViewCell", bundle: nil)
        let accountActionCellNib = UINib(nibName: "GKActionAccountTableViewCell", bundle: nil)
        
        // Register custom cells
        self.tableView.register(accountCellNib, forCellReuseIdentifier: "GKAccountTableViewCell")
        self.tableView.register(accountActionCellNib, forCellReuseIdentifier: "accountActionCellNib")
    }
    
    // MARK: - Actions
    @IBAction func profileButtonPressed(_ sender: UIButton) {
        
        // show image picker
    }
}

// MARK: - TableView Datasource
extension GKAccountViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
//        profileArr.add(firstName!)
//        profileArr.add(lastName!)
//        profileArr.add(prefixName!)
        
//        profileArr.add(phone)
        
//        profileArr.add(email)
        
//        profileArr.add(address)
        
//        profileArr.add(company)
        
//        profileArr.add(website!)
        
//        profileArr.add(birthday!)
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        return cell
    }
}

// MARK: - TableView Delegate
extension GKAccountViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        // Text field in cell become responder
        let cell = tableView.cellForRow(at: indexPath) as? GKAccountTableViewCell
        cell?.textField.becomeFirstResponder()
    }
}
