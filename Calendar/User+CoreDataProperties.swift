//
//  User+CoreDataProperties.swift
//  Calendar
//
//  Created by ramy on 2022-03-12.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var email: String?
    @NSManaged public var name: String?
    @NSManaged public var password: String?
    @NSManaged public var todo: NSSet?

    public var unrwappedEmail: String {
        email ?? "Unknown email"
    }
    public var unrwappedName: String {
        name ?? "Unknown name"
    }
    public var unrwappedPassword: String {
        password ?? "Unknown password"
    }
    public var todoArray : [Todo] {
        let set = todo as? Set<Todo> ?? []
        return set.sorted {
            $0.unwrappedTask < $1.unwrappedTask
        }
    }
}

// MARK: Generated accessors for todo
extension User {

    @objc(addTodoObject:)
    @NSManaged public func addToTodo(_ value: Todo)

    @objc(removeTodoObject:)
    @NSManaged public func removeFromTodo(_ value: Todo)

    @objc(addTodo:)
    @NSManaged public func addToTodo(_ values: NSSet)

    @objc(removeTodo:)
    @NSManaged public func removeFromTodo(_ values: NSSet)

}

extension User : Identifiable {

}
