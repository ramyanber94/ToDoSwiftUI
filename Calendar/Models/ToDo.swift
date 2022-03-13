//
//  ToDo.swift
//  Calendar
//
//  Created by ramy on 2022-03-11.
//

import Foundation

struct ToDo : Identifiable {
    let id = UUID()
    var task: String
    var status: String
    var date: Date
    var section: String
    var notes: String
    var color: [String]
}
struct TaskMetaData: Identifiable {
    var id = UUID().uuidString
    var task: [Task]?
    var taskDate: Date?
}
