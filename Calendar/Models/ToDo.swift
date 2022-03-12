//
//  ToDo.swift
//  Calendar
//
//  Created by ramy on 2022-03-11.
//

import Foundation

struct ToDo {
    var member: [TaskWithStatus]?
}
struct TaskWithStatus{
    var task: String?
    var status: String?
    var date: Date?
    var section: String?
}
