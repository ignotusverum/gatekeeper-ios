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
    
    // Selected cell
    var selectedCell: GKAccountTableViewCell?
    
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
        
        cell.delegate = self
        
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

// MARK: - TextField Delegate
extension GKAccountViewController: UITextFieldDelegate {
    
    func textfieldDidChange(_ textField: UITextField) {
     
        let selectedCellIdentifier = self.selectedCell?.reuseIdentifier
        let selectedIndexPath = self.selectedCell?.indexPath
        
        // First name
        if selectedCellIdentifier == GKFirstNameCell.reuseIdentifier {
            
            self.tempUser?.firstName = textField.text
        }
        // Last name
        else if selectedCellIdentifier == GKLastNameCell.reuseIdentifier {
            
            self.tempUser?.lastName = textField.text
        }
        // Prefix
        else if selectedCellIdentifier == GKPrefixCell.reuseIdentifier {
            
            self.tempUser?.prefix = textField.text
        }
        // Phones
        else if selectedCellIdentifier == GKPhoneCell.reuseIdentifier {
            
            let phoneCell = self.selectedCell as! GKPhoneCell
            
            self.tempUser?.phoneNumberString = phoneCell.phoneNumberInput.text
        }
        // Emails
        else if selectedCellIdentifier == GKEmailCell.reuseIdentifier {
            
            if var emails = self.tempUser?.emails {
                if emails.count > 0 {
                  
                    emails[selectedIndexPath!.row] = textField.text!
                }
                else {
                    
                    emails.append(textField.text!)
                }
            }
        }
        // Addresses
        if let selectedIndexPath = selectedIndexPath {
            if selectedIndexPath.section == 3 {
                
                var address = Address()
                if self.tempUser!.addresses.count > 0 {
                    
                    address = self.tempUser!.addresses[selectedIndexPath.row]
                }
                
                if selectedCellIdentifier == GKStreet1Cell.reuseIdentifier {
                    
                    address.street1 = textField.text
                }
                else if selectedCellIdentifier == GKStreet2Cell.reuseIdentifier {
                    
                    address.street2 = textField.text
                }
                else if selectedCellIdentifier == GKCityCell.reuseIdentifier {
                    
                    address.city = textField.text
                }
                else if selectedCellIdentifier == GKStateCell.reuseIdentifier {
                    
                    address.state = textField.text
                }
                else if selectedCellIdentifier == GKCountryCell.reuseIdentifier {
                    
                    address.country = textField.text
                }
                else if selectedCellIdentifier == GKZipCell.reuseIdentifier {
                    
                    address.zip = textField.text
                }
                
                if self.tempUser!.addresses.count > 0 {
                    
                    self.tempUser!.addresses[selectedIndexPath.row] = address
                }
                else {
                    
                    self.tempUser?.addresses.append(address)
                }
            }
            // Work
            if selectedIndexPath.section == 4 {
             
                var work = Work()
                if let userWork = self.tempUser?.work {
                    work = userWork
                }
                
                if selectedCellIdentifier == GKCompanyCell.reuseIdentifier {
                    
                    work.company = textField.text
                }
                else if selectedCellIdentifier == GKTitleCell.reuseIdentifier {
                    
                    work.Title = textField.text
                }
                
                self.tempUser?.work = work
            }
            // Social
            if selectedIndexPath.section == 5 {
                
                if var socials = self.tempUser?.socials {
                    if socials.count > 0 {
                        
                        socials[selectedIndexPath.row] = textField.text!
                    }
                    else {
                        
                        socials.append(textField.text!)
                    }
                }
            }
        }
        
        print(self.tempUser)
    }
}

// MARK: - GKAccountTableViewCellDelegate
extension GKAccountViewController: GKAccountTableViewCellDelegate {
    
    func cellPressed(_ cell: GKAccountTableViewCell) {
        
        // Track selected cell
        self.selectedCell = cell
        
        if cell is GKPhoneCell {
            let phoneCell = cell as! GKPhoneCell
            phoneCell.phoneNumberInput.becomeFirstResponder()
            
            phoneCell.phoneNumberInput.addTarget(self, action: #selector(GKAccountViewController.textfieldDidChange(_:)), for: .editingChanged)
        }
        else if cell is GKBirthdayCell {
            
            // Birthday
            let sharedDatePicker = GKDatePicker.shared
            sharedDatePicker.showAnimate()
        }
        else {
            
            cell.textField?.becomeFirstResponder()
            
            cell.textField?.addTarget(self, action: #selector(GKAccountViewController.textfieldDidChange(_:)), for: .editingChanged)
        }
    }
    
    func addActionButtonPressed(_ cell: GKAccountTableViewCell) {
        
        let sharedModal = GKModalView.shared
        sharedModal.showAnimate()
    }
    
    func closeActionButtonPressed(_ cell: GKAccountTableViewCell) {
        
        let sharedModal = GKModalView.shared
        sharedModal.showAnimate()
    }
}
