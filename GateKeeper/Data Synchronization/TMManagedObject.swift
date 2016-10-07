//
//  TMManagedObject.swift
//  consumer
//
//  Created by Vladislav Zagorodnyuk on 2/3/16.
//  Copyright © 2016 Vlad Zagorodnyuk. All rights reserved.
//

import CoreData

open class TMManagedObject: NSManagedObject {

    func propertyNames() -> [String] {
        return Mirror(reflecting: self).children.filter { $0.label != nil }.map { $0.label! }
    }
}
