//
//  TMString.swift
//  GateKeeper
//
//  Created by Vladislav Zagorodnyuk on 9/25/16.
//  Copyright © 2016 Vlad Z. All rights reserved.
//

extension String {
    
    func navTitle(color: UIColor = UIColor.black)-> NSAttributedString {
        
        let attributedString = NSMutableAttributedString(string: self)
        
        attributedString.addAttribute(NSFontAttributeName, value: UIFont.appBoldFont(size: 17.0), range: NSRange(location: 0, length: self.length))
        attributedString.addAttribute(NSForegroundColorAttributeName, value: color, range: NSRange(location: 0, length: self.length))
        
        return attributedString
    }
}

extension NSMutableAttributedString {
    
    convenience init(string: String, lineSpacing: CGFloat = 5.0, aligntment: NSTextAlignment = .center) {
    
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        paragraphStyle.alignment = aligntment
        
        let attrsDict : [String: AnyObject] =  [NSParagraphStyleAttributeName : paragraphStyle]
        
        self.init(string: string, attributes: attrsDict)
    }
}
