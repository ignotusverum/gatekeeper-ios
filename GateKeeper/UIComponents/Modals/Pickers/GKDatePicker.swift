//
//  GKDatePicker.swift
//  GateKeeper
//
//  Created by Vladislav Zagorodnyuk on 10/10/16.
//  Copyright © 2016 Vlad Z. All rights reserved.
//

import UIKit

class GKDatePicker: UIView {

    // Date Selection Handler
    var selectionHandler: ((_ indexPath: Date?) -> Void)?

    // Actual Picker
    @IBOutlet weak var birthdayPickerView: UIDatePicker!
    
    // Backgound views
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    // MARK: - View lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Setting datePicker datasource
        self.setDatePicker()
    }

    // Setting min/max date picker
    func setDatePicker() {
        
        let oneYearTime: TimeInterval  = -(365 * 24 * 60 * 60)
        let todayDate = Date()
        let minDateNew = todayDate.addingTimeInterval( 130 * oneYearTime )
        
        self.birthdayPickerView.minimumDate = minDateNew
        self.birthdayPickerView.maximumDate = todayDate
    }
    
    class func showDatePicker() {
        
        let window = GKAppDelegate.shared!.window!
        
        let modalView = UINib(nibName: "GKDatePicker", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! GKDatePicker
        
        modalView.frame = window.frame
        modalView.backgroundImageView.alpha = 0.9
        
        window.addSubview(modalView)
        
        GKModalView.showAnimate(modalView)
    }
    
    // MARK: - Actions
    @IBAction func doneButonPressed(_ sender: UIButton) {
        
        self.selectionHandler?(self.birthdayPickerView.date)
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        
        self.selectionHandler?(nil)
    }
}
