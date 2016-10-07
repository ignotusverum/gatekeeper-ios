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
    let profileSectionCells: [Reusable.Type] = [GKFirstNameCell.self, GKLastNameCell.self, GKPrefixCell.self]
    
    let phoneCells = [GKPhoneCell.self]
    
    let emailCells = [GKEmailCell.self]
    
    let socialCells = [GKSocialCell.self]
    
    let birthdayCells = [GKBirthdayCell.self]
    
    let workSectionCells: [Reusable.Type] = [GKCompanyCell.self, GKTitleCell.self]
    
    let addressCells: [Reusable.Type] = [GKStreet1Cell.self, GKStreet2Cell.self, GKCityCell.self, GKStateCell.self, GKCountryCell.self, GKZipCell.self]
    
    var datasourceCells = [[Reusable.Type]]()
    
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
        
        // Init cell identifiers array
        self.datasourceCells = [profileSectionCells, phoneCells, emailCells, addressCells, workSectionCells, socialCells, birthdayCells]
        
        for arrays in self.datasourceCells {
            for classObj in arrays {
                
                if classObj is GKAccountTableViewCell {
                    
                    let accountCellNib = UINib(nibName: "GKAccountTableViewCell", bundle: nil)
                    self.tableView.register(accountCellNib, forCellReuseIdentifier: classObj.reuseIdentifier)
                }
                else {
                    
                }
            }
        }
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
            // Number of email
        else if section == 2 {
            
            return 1
        }
            // Number of addresses
        else if section == 3, let addresses = self.tempUser?.addresses {
            
            return addresses.count * 6
        }
            // Company - Company name / Title
        else if section == 4 {
            
            return 2
        }
            // Social
        else if section == 5, let social = self.tempUser?.socials {
            
            return social.count + 1
        }
        
        // Birthday
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier = self.datasourceCells[indexPath.section][indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier.reuseIdentifier, for: indexPath) as! GKAccountTableViewCell
        
        // Phone population
        if identifier.reuseIdentifier == phoneCells.first?.reuseIdentifier {
            
            cell.textField?.text = tempUser?.phoneNumber.toE164()
        }
        
        cell.textField?.delegate = self
        
        cell.customInit()
        
        return cell
    }
}

// MARK: - TableView Delegate
extension GKAccountViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        // Text field in cell become responder
        let cell = tableView.cellForRow(at: indexPath) as? GKAccountTableViewCell
        cell?.textField?.becomeFirstResponder()
    }
}

// MARK: - MARK: TextField Delegate
extension GKAccountViewController: UITextFieldDelegate {
    
    func textfieldDidChange(_ textField: UITextField) {
        
    }
}
