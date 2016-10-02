// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to GKUser.swift instead.

import Foundation
import CoreData

public enum GKUserAttributes: String {
    case addresses = "addresses"
    case birthday = "birthday"
    case emailAddresses = "emailAddresses"
    case firstName = "firstName"
    case lastName = "lastName"
    case modelID = "modelID"
    case phoneNumberString = "phoneNumberString"
    case phoneNumbers = "phoneNumbers"
    case prefix = "prefix"
    case websites = "websites"
}

open class _GKUser: GKManagedObject {

    // MARK: - Class methods

    open class func entityName () -> String {
        return "GKUser"
    }

    open class func entity(managedObjectContext: NSManagedObjectContext) -> NSEntityDescription? {
        return NSEntityDescription.entity(forEntityName: self.entityName(), in: managedObjectContext)
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }

    public convenience init?(managedObjectContext: NSManagedObjectContext) {
        guard let entity = _GKUser.entity(managedObjectContext: managedObjectContext) else { return nil }
        self.init(entity: entity, insertInto: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged open
    var addresses: NSData?

    @NSManaged open
    var birthday: NSDate?

    @NSManaged open
    var emailAddresses: NSData?

    @NSManaged open
    var firstName: String?

    @NSManaged open
    var lastName: String?

    @NSManaged open
    var modelID: String?

    @NSManaged open
    var phoneNumberString: String?

    @NSManaged open
    var phoneNumbers: NSData?

    @NSManaged open
    var prefix: String?

    @NSManaged open
    var websites: NSData?

    // MARK: - Relationships

}

