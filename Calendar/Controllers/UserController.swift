//
//  UserController.swift
//  Calendar
//
//  Created by ramy on 2022-03-11.
//

import Foundation
import SwiftUI

class UserController: ObservableObject {
    
    @Published var member = Member()
    
    func addTodo(section: String, taskList: String, status: String, date: Date , email: String)-> Bool {
        let check = CoreDataService.shared.addToDo(section: section, task: taskList, status: status, email: email, date: date)
        if check {
            print("Saved")
            return true
        }else{
            print("Failed")
            return false
        }
    }
    func addUser(email: String , password: String , name: String)-> Bool {
        let check = CoreDataService.shared.addUser(email: email, name: name, password: password)
        if check {
            print("Saved")
            return true
        }else{
            print("Failed")
            return true
        }
    }
    func getUser(email: String , password: String)-> Bool {
        let check = CoreDataService.shared.getUser(email: email, password: password)
        if check != nil {
            member = check!
            print("Saved \(check!)")
            return true
        }else{
            print("Failed")
            return false
        }
    }
}
