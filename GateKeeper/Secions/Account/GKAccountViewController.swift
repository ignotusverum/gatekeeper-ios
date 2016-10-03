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
    
    // Cell Identifiers
    let profileSectionCells = ["GKFirstNameCell", "GKLastNameCell", "GKPlaceholderCell"]
    
    let phoneCells = ["GKPhoneCell"]
    
    let emailCells = ["GKEmailCell"]
    
    let socialCells = ["GKSocialCell"]
    
    let birthdayCells = ["GKBirthdayCell"]
    
    let workSectionCells = ["GKCompanyCell", "GKTitleCell"]
    
    let addressCells = ["GKStreet1Cell", "GKStreet2Cell", "GKCityCell", "GKStateCell", "GKCountryCell", "GKZipCell"]
    
    var datasourceCells = [[String]]()
    
    // User datasource
    var tempUser: TempUser?
    
    // MARK: - Controller lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Init custom cells
        self.tableViewInit()
        
        // Title
        self.addTitleText(titleText: "Your Information")
    }
    
    // Table view init
    func tableViewInit() {
        
        // Account cells
        // Profile cells
        self.tableView.register(GKFirstNameCell.self, forCellReuseIdentifier: "GKFirstNameCell")
        self.tableView.register(GKLastNameCell.self, forCellReuseIdentifier: "GKLastNameCell")
        self.tableView.register(GKPlaceholderCell.self, forCellReuseIdentifier: "GKPlaceholderCell")
        
        // Phone cells
        self.tableView.register(GKPhoneCell.self, forCellReuseIdentifier: "GKPhoneCell")
        
        // Email cells
        self.tableView.register(GKEmailCell.self, forCellReuseIdentifier: "GKEmailCell")
        
        // Address Cells
        self.tableView.register(GKStreet1Cell.self, forCellReuseIdentifier: "GKStreet1Cell")
        self.tableView.register(GKStreet2Cell.self, forCellReuseIdentifier: "GKStreet2Cell")
        self.tableView.register(GKCityCell.self, forCellReuseIdentifier: "GKCityCell")
        self.tableView.register(GKStateCell.self, forCellReuseIdentifier: "GKStateCell")
        self.tableView.register(GKCountryCell.self, forCellReuseIdentifier: "GKCountryCell")
        self.tableView.register(GKZipCell.self, forCellReuseIdentifier: "GKZipCell")
        
        // Work
        self.tableView.register(GKCompanyCell.self, forCellReuseIdentifier: "GKCompanyCell")
        self.tableView.register(GKTitleCell.self, forCellReuseIdentifier: "GKTitleCell")
        
        // Social
        self.tableView.register(GKSocialCell.self, forCellReuseIdentifier: "GKSocialCell")
        self.tableView.register(GKTitleCell.self, forCellReuseIdentifier: "GKTitleCell")
        
        // Birthday
        self.tableView.register(GKBirthdayCell.self, forCellReuseIdentifier: "GKBirthdayCell")
        
        // Init cell identifiers array
        self.datasourceCells = [profileSectionCells, phoneCells, emailCells, addressCells, workSectionCells, socialCells, birthdayCells]
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
            
            return 3
        }
        // Phone number
        else if section == 1 {
            
            return 1
        }
            // Number of addresses
        else if section == 2, let addresses = self.tempUser?.addresses {
            
            return addresses.count * 6
        }
            // Company - Company name / Title
        else if section == 3 {
            
            return 2
        }
            // Social
        else if section == 4, let social = self.tempUser?.socials {
            
            return social.count + 1
        }
        
        // Birthday
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: self.datasourceCells[indexPath.section][indexPath.row], for: indexPath)
        
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
