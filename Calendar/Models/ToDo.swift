//
//  ToDo.swift
//  Calendar
//
//  Created by ramy on 2022-03-11.
//

import Foundation
import SwiftUI

struct ToDo : Identifiable {
    let id = UUID()
    var task: String?
    var status: String?
    var date: Date?
    var section: String?
    var color: String?
}
