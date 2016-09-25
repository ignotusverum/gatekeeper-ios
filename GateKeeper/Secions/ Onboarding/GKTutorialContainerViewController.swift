//
//  GKTutorialContainerViewController.swift
//  GateKeeper
//
//  Created by Vladislav Zagorodnyuk on 9/19/16.
//  Copyright © 2016 Vlad Z. All rights reserved.
//

import EZSwipeController
import EZSwiftExtensions

class GKTutorialContainerViewController: EZSwipeController {

    // Skip Tutorial
    // Initially hidden in IB
    @IBOutlet weak var skipButton: UIButton!
    
    // Page indicator
    @IBOutlet weak var pageControl: UIPageControl!
    
    // Tutorial Controllers - datasource
    var tutorialControllers = [UIViewController]()

    // MARK: - Controller lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Hiding navigation bar
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.createTutorialPages()

        // Setting number of pages
        self.pageControl.numberOfPages = self.tutorialControllers.count + 1

        // Bringing skip button to front
        self.view.bringSubview(toFront: self.skipButton)
    }
    
    // Initializing datasource
    func createTutorialPages() {
        
        let sb = UIStoryboard(name: "Onboarding", bundle: nil)
        
        let page1 = sb.instantiateViewController(withIdentifier: "GKTutorialViewController") as! GKTutorialViewController
        page1.customSetup(imageName: "Tutorial_1")
        
        let page2 = sb.instantiateViewController(withIdentifier: "GKTutorialViewController") as! GKTutorialViewController
        page2.customSetup(imageName: "Tutorial_2")
        
        let page3 = sb.instantiateViewController(withIdentifier: "GKTutorialViewController") as! GKTutorialViewController
        page3.customSetup( imageName: "Tutorial_3")
        
        let page4 = sb.instantiateViewController(withIdentifier: "GKTutorialViewController") as! GKTutorialViewController
        page4.customSetup( imageName: "Tutorial_4")
        
        self.tutorialControllers = [page1, page2, page3, page4]
    }
    
    // EZSwipeController Delegate
    override func setupView() {
        
        self.createTutorialPages()
        
        super.setupView()
        
        datasource = self
        navigationBarShouldNotExist = true
    }
    
    // MARK: - Actions
    @IBAction func skipButtonPressed() {
        
        // Skip segue
        self.performSegue(withIdentifier: "termsSegue", sender: nil)
    }
}

// MARK: - EZSwipeControllerDataSource
extension GKTutorialContainerViewController: EZSwipeControllerDataSource {
    
    func viewControllerData()-> [UIViewController] {
        
        // Controllers for page controller
        return self.tutorialControllers
    }
    
    // Changed page func
    func changedToPageIndex(_ index: Int) {
        
        self.pageControl.currentPage = index
        
        if index == self.tutorialControllers.count - 1 {
            
            self.skipButton.isHidden = false
        }
        else {
            
            self.skipButton.isHidden = true
        }
    }
}
