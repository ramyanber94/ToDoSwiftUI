//
//  UserController.swift
//  Calendar
//
//  Created by ramy on 2022-03-11.
//

import Foundation

class UserController: ObservableObject {
    
    @Published var member = Member()
    
    func addTodo(section: String, taskList: String, status: String, date: Date , email: String, notes: String, color: [String])-> Bool {
        let check = CoreDataService.shared.addToDo(section: section, task: taskList, status: status, email: email, date: date, note: notes , color1: color[0], color2: color[1])
        if check != nil {
            let todo = ToDo(task: (check?.task)!, status: (check?.status)!, date: (check?.date)!, section: (check?.section)!, notes: (check?.note)!, color: [(check?.color1)!, (check?.color2)!])
            member.todos.append(todo)
            let date = todo.date
            let formatter1 = DateFormatter()
            formatter1.dateStyle = .full
            print(formatter1.string(from: date))
            print("Saved")
            return true
        }else{
            print("Failed")
            return false
        }
    }
    func addUser(email: String , password: String , name: String)-> Bool {
        let check = CoreDataService.shared.addUser(email: email, name: name, password: password)
        if check != nil {
            print("Saved")
            member = check!
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
