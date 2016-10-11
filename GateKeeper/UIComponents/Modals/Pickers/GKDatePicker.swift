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
    var selectionClosure: ((_ date: Date?) -> ())?

    // Actual Picker
    @IBOutlet weak var birthdayPickerView: UIDatePicker!
    
    // Backgound views
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    // Shared view
    static let shared = UINib(nibName: "GKDatePicker", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! GKDatePicker
    
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
    
    func showDatePicker(completion: ((_ indexPath: IndexPath?) -> ())?) {
        
        let window = GKAppDelegate.shared!.window!
        
        let modalView = GKDatePicker.shared
        
        modalView.frame = window.frame
        modalView.backgroundImageView.alpha = 0.9
        
        window.addSubview(modalView)
        
        self.showAnimate()

        self.selectionClosure = completion
    }
    
    private func showAnimate() {
        
        let sharedView = GKDatePicker.shared
        
        sharedView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        sharedView.alpha = 0.0
        
        UIView.animate(withDuration: 0.25, animations: {
            
            sharedView.alpha = 1.0
            sharedView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        })
    }
    
    func removeAnimate() {
        
        let sharedView = GKDatePicker.shared
        
        sharedView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        sharedView.alpha = 0.0
        
        UIView.animate(withDuration: 0.25, animations: {
            
            sharedView.removeFromSuperview()
            sharedView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        })
    }
    
    // MARK: - Actions
    @IBAction func doneButonPressed(_ sender: UIButton) {
        
        self.selectionClosure?(self.birthdayPickerView.date)
        
        self.removeAnimate()
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        
        self.selectionClosure?(nil)
        
        self.removeAnimate()
    }
}
