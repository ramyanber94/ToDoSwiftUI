//
//  CoreDataService.swift
//  Calendar
//
//  Created by ramy on 2022-03-06.
//

import Foundation
import CoreData

class CoreDataService : ObservableObject {
    
    public static var shared = CoreDataService()
    
    func addUser(email: String, name : String, password : String) -> Bool{
        let user = User(context: persistentContainer.viewContext)
        user.name = name
        user.email = email
        user.password = password
        saveContext()
        return true
    }
    
    
    
    func getUser(email: String , password: String)-> Member?{
        let fetch : NSFetchRequest<User> = User.fetchRequest()
        fetch.predicate = NSPredicate(format: "(email == %@) AND (password == %@)", argumentArray: [email , password])
        var member = Member()
        do{
            let result = try persistentContainer.viewContext.fetch(fetch) as [User]?
            if result?.count == 0 {
                return nil
            }else{
                if let emails = result?[0].email{
                    if let passwords = result?[0].password{
                        member.email = emails
                        member.name = result?[0].name
                        member.password = passwords
                        if let todos = result?[0].todo{
                            var tasks = TaskWithStatus()
                            for case let t as Todo in todos  {
                                tasks.task = t.task
                                tasks.status = t.status
                                tasks.date = t.date
                                tasks.section = t.section
                                var todosList = ToDo()
                                todosList.member?.append(tasks)
                                member.todo?.append(todosList)
                            }
                        }
                        return member
                    }
                }
                return member
            }
            
        }catch{}
        do{
            let result = try persistentContainer.viewContext.fetch(fetch) as [User]?
            if result?.count == 0 {
               
            }else{
                return nil
            }
        }catch{}
        return nil
    }

    func addToDo(section: String, task : String, status : String, email: String, password: String, date: Date)-> Bool{
        let todo = Todo(context: persistentContainer.viewContext)
        todo.task = task
        todo.status = status
        todo.section = section
        todo.date = date
        let fetch : NSFetchRequest<User> = User.fetchRequest()
        fetch.predicate = NSPredicate(format: "(email == %@) AND (password == %@)", argumentArray: [email , password])
        do{
            let result = try persistentContainer.viewContext.fetch(fetch) as [User]?
            if result?.count == 0 {
                result?[0].addToTodo(todo)
                print("saved")
                return true
            }
        }catch{}
        return false
    }
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Calendar")
          container.loadPersistentStores(completionHandler: { (storeDescription, error) in
              if let error = error as NSError? {
                  fatalError("Unresolved error \(error), \(error.userInfo)")
              }
          })
          return container
    }()

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
