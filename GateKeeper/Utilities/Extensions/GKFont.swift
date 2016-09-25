//
//  GKFont.swift
//  GateKeeper
//
//  Created by Vladislav Zagorodnyuk on 9/25/16.
//  Copyright © 2016 Vlad Z. All rights reserved.
//

//MARK: - Font  Used By Application
extension UIFont
{
    class func appBoldFontWithSize(_ fontsize:CGFloat) -> UIFont {
        
        return UIFont(name: "ProximaNova-Bold", size: fontsize)!
    }
    
    class func appRegularFontWithSize(_ fontsize:CGFloat) -> UIFont {
        
        return UIFont(name: "ProximaNova-Regular", size: fontsize)!
    }
    
    class func appSemiBoldFontWithSize(_ fontsize:CGFloat) -> UIFont {
        
        return UIFont(name: "ProximaNova-Semibold", size: fontsize)!
    }
}
