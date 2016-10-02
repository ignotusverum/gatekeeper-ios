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
    
    // Static datasouce
    let nameSectionPlaceholoders = ["First name", "Last name", "Prefix"]
    
    let phoneNumberPlaceholoders = ["Home"]
    
    let emailPlaceholoders = ["Home"]
    
    let addressPlaceholoders = ["Street 1", "Street 2", "City", "State", "Country", "Zip"]
    
    let companyPlaceholoders = ["Company", "Title"]
    
    let socialPlaceholoders = ["Website"]
    
    let birthdayPlaceholoders = ["Birthday"]
    
    var cellPlaceholders = [[String]]()
    
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
     
        // Init cell placeholders
        self.cellPlaceholders = [nameSectionPlaceholoders, phoneNumberPlaceholoders, emailPlaceholoders, addressPlaceholoders, companyPlaceholoders, socialPlaceholoders, birthdayPlaceholoders]
        
        // Account cells
        let accountActionCellNib = UINib(nibName: "GKActionAccountTableViewCell", bundle: nil)
        
        // Register custom cells
        self.tableView.register(accountActionCellNib, forCellReuseIdentifier: "GKActionAccountTableViewCell")
    }
    
    // MARK: - Actions
    @IBAction func profileButtonPressed(_ sender: UIButton) {
        
        // show image picker
    }
}

// MARK: - TableView Datasource
extension GKAccountViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // First, last name, prefix
        if section == 0 {
            
            return nameSectionPlaceholoders.count
        }
        // Phone number
        else if section == 1 {
            
            return phoneNumberPlaceholoders.count
        }
            // Number of addresses
        else if section == 2, let addresses = self.tempUser?.addresses {
            
            return addresses.count + 1
        }
            // Company - Company name / Title
        else if section == 3 {
            
            return companyPlaceholoders.count
        }
            // Social
        else if section == 4, let social = self.tempUser?.socials {
            
            return social.count + 1
        }
        
        // Birthday
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "GKAccountActionTableViewCell", for: indexPath) as! GKActionAccountTableViewCell
        
        
        
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
