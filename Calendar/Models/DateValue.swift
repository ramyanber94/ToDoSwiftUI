//
//  DateValue.swift
//  Calendar
//
//  Created by ramy on 2022-03-13.
//

import Foundation

struct DateValue: Identifiable {
    var id = UUID().uuidString
    var day: Int
    var date: Date
}
