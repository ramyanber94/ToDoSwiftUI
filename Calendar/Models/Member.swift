//
//  User.swift
//  Calendar
//
//  Created by ramy on 2022-03-10.
//

import Foundation

struct Member {
    var email: String?
    var password: String?
    var name: String?
    var todos = [ToDo]()
}
