//
//  GKTableView.swift
//  GateKeeper
//
//  Created by Vladislav Zagorodnyuk on 10/2/16.
//  Copyright © 2016 Vlad Z. All rights reserved.
//

import UIKit

public protocol Reusable: class {
    static var reuseIdentifier: String { get }
}

public extension Reusable {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: Reusable { }
extension UITableViewHeaderFooterView: Reusable { }
extension UICollectionViewCell: Reusable { }

public extension UITableView {
    
    // Cells
    public func registerReusable(cellClass: Reusable.Type, fromNib: Bool = false) -> UITableView {
        if fromNib {
            let nib = UINib(nibName: cellClass.reuseIdentifier, bundle: nil)
            self.register(nib, forCellReuseIdentifier: cellClass.reuseIdentifier)
        } else {
            self.register(cellClass, forCellReuseIdentifier: cellClass.reuseIdentifier)
        }
        
        return self
    }
    
    public func dequeueReusableCellWithClass<T: UITableViewCell>(cellClass: T.Type, indexPath: IndexPath) -> T where T: Reusable {
        return self.dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as! T
        
    }
    
    // HeaderFooterViews
    public func registerReusableHeaderFooterViewClass(headerFooterViewClass: Reusable.Type, fromNib: Bool = false) -> UITableView {
        if fromNib {
            let nib = UINib(nibName: headerFooterViewClass.reuseIdentifier, bundle: nil)
            self.register(nib, forHeaderFooterViewReuseIdentifier: headerFooterViewClass.reuseIdentifier)
        } else {
            self.register(headerFooterViewClass, forHeaderFooterViewReuseIdentifier: headerFooterViewClass.reuseIdentifier)
        }
        
        return self
    }
    
    public func dequeueReusableHeaderFooterViewWithClass<T: UITableViewHeaderFooterView>(headerFooterViewClass: T.Type = T.self) -> T? where T: Reusable {
        return self.dequeueReusableHeaderFooterView(withIdentifier: T.reuseIdentifier) as? T
    }
}

extension UICollectionView {
    public func registerReusable(cellClass: Reusable.Type, fromNib: Bool = false) -> UICollectionView {
        if fromNib {
            let nib = UINib(nibName: cellClass.reuseIdentifier, bundle: nil)
            self.register(nib, forCellWithReuseIdentifier: cellClass.reuseIdentifier)
        } else {
            self.register(cellClass, forCellWithReuseIdentifier: cellClass.reuseIdentifier)
        }
        
        return self
    }
    
    public func dequeueReusableCellWithClass<T: UICollectionViewCell>(cellClass: T.Type, indexPath: NSIndexPath) -> T where T: Reusable {
        return self.dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath as IndexPath) as! T
    }
}


