//
//  ToDo.swift
//  Calendar
//
//  Created by ramy on 2022-03-11.
//

import Foundation

struct ToDo {
    var section: [String: TaskWithStatus]?
}
struct TaskWithStatus{
    var task: [String: String]?
}
