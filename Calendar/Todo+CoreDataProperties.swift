//
//  Todo+CoreDataProperties.swift
//  Calendar
//
//  Created by ramy on 2022-03-12.
//
//

import Foundation
import CoreData


extension Todo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Todo> {
        return NSFetchRequest<Todo>(entityName: "Todo")
    }

    @NSManaged public var date: Date?
    @NSManaged public var section: String?
    @NSManaged public var status: String?
    @NSManaged public var task: String?
    @NSManaged public var color1: String?
    @NSManaged public var color2: String?
    @NSManaged public var note: String?
    @NSManaged public var userTodos: User?
    
    public var unwrappedDate: Date {
        date ?? Date()
    }
    public var unwrappedSection: String {
        section ?? ""
    }
    public var unwrappedStatus: String {
        status ?? ""
    }
    public var unwrappedTask: String {
        task ?? ""
    }
    public var unwrappedColor1: String {
        color1 ?? ""
    }
    public var unwrappedColor2: String {
        color2 ?? ""
    }
    public var unwrappedNote: String {
        note ?? ""
    }

}
