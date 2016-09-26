//
//  GKNavigationBar.swift
//  GateKeeper
//
//  Created by Vladislav Zagorodnyuk on 9/26/16.
//  Copyright © 2016 Vlad Z. All rights reserved.
//

extension UINavigationBar {
    
    func setNavigation(withColor color: UIColor = UIColor.init(white: 0.0, alpha: 0.1), height: CGFloat = 1.0) {
        let bottomBorderRect = CGRect(x: 0, y: frame.height, width: frame.width, height: height)
        let bottomBorderView = UIView(frame: bottomBorderRect)
        bottomBorderView.backgroundColor = color
        addSubview(bottomBorderView)
    }
}
