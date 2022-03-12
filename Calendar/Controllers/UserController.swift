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
    
    func addTodo(section: String, taskList: String, status: String, date: Date , email: String , password: String){
        let check = CoreDataService.shared.addToDo(section: section, task: taskList, status: status, email: email, password: password, date: date)
        if check {
            print("Saved")
        }else{
            print("Failed")
        }
    }
    func addUser(email: String , password: String , name: String){
        let check = CoreDataService.shared.addUser(email: email, name: name, password: password)
        if check {
            print("Saved")
        }else{
            print("Failed")
        }
    }
    func getUser(email: String , password: String){
        let check = CoreDataService.shared.getUser(email: email, password: password)
        if check != nil {
            member = check!
            print("Saved")
        }else{
            print("Failed")
        }
    }
}
