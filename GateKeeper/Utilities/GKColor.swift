//
//  GKColor.swift
//  GateKeeper
//
//  Created by Vladislav Zagorodnyuk on 9/26/16.
//  Copyright © 2016 Vlad Z. All rights reserved.
//

import Foundation

extension UIColor {
    
    class func ColorWith(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)-> UIColor {
        return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: alpha)
    }
    
    // MARK: - Application colors
    open class var GKBlueColor: UIColor {
        return UIColor.ColorWith(red: 0.0, green: 95.0, blue: 159.0, alpha: 1.0)
    }
    
    open class var GKBorderColor: UIColor {
       return UIColor.ColorWith(red: 219.0, green: 220.0, blue: 221.0, alpha: 1.0)
    }
}
