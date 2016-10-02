// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to GKUser.swift instead.

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

@objc public
class _GKUser: GKManagedObject {

    // MARK: - Class methods

    public class func entityName () -> String {
        return "GKUser"
    }

    public class func entity(managedObjectContext: NSManagedObjectContext!) -> NSEntityDescription! {
        return NSEntityDescription.entityForName(self.entityName(), inManagedObjectContext: managedObjectContext);
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext!) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }

    public convenience init(managedObjectContext: NSManagedObjectContext!) {
        let entity = _GKUser.entity(managedObjectContext)
        self.init(entity: entity, insertIntoManagedObjectContext: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged public
    var addresses: NSData?

    // func validateAddresses(value: AutoreleasingUnsafeMutablePointer<AnyObject>, error: NSErrorPointer) -> Bool {}

    @NSManaged public
    var birthday: NSDate?

    // func validateBirthday(value: AutoreleasingUnsafeMutablePointer<AnyObject>, error: NSErrorPointer) -> Bool {}

    @NSManaged public
    var emailAddresses: NSData?

    // func validateEmailAddresses(value: AutoreleasingUnsafeMutablePointer<AnyObject>, error: NSErrorPointer) -> Bool {}

    @NSManaged public
    var firstName: String?

    // func validateFirstName(value: AutoreleasingUnsafeMutablePointer<AnyObject>, error: NSErrorPointer) -> Bool {}

    @NSManaged public
    var lastName: String?

    // func validateLastName(value: AutoreleasingUnsafeMutablePointer<AnyObject>, error: NSErrorPointer) -> Bool {}

    @NSManaged public
    var modelID: String?

    // func validateModelID(value: AutoreleasingUnsafeMutablePointer<AnyObject>, error: NSErrorPointer) -> Bool {}

    @NSManaged public
    var phoneNumberString: String?

    // func validatePhoneNumberString(value: AutoreleasingUnsafeMutablePointer<AnyObject>, error: NSErrorPointer) -> Bool {}

    @NSManaged public
    var phoneNumbers: NSData?

    // func validatePhoneNumbers(value: AutoreleasingUnsafeMutablePointer<AnyObject>, error: NSErrorPointer) -> Bool {}

    @NSManaged public
    var prefix: String?

    // func validatePrefix(value: AutoreleasingUnsafeMutablePointer<AnyObject>, error: NSErrorPointer) -> Bool {}

    @NSManaged public
    var websites: NSData?

    // func validateWebsites(value: AutoreleasingUnsafeMutablePointer<AnyObject>, error: NSErrorPointer) -> Bool {}

    // MARK: - Relationships

}

