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
    
    func addUser(email: String, name : String, password : String) -> Member?{
        let user = User(context: persistentContainer.viewContext)
        user.name = name
        user.email = email
        user.password = password
        saveContext()
        var member = Member()
        member.email = email
        member.password = password
        member.name = name
        return member
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
                if let emails = result?[0].email {
                    if let passwords = result?[0].password{
                        member.email = emails
                        member.name = result?[0].name
                        member.password = passwords
                        if let todos = result?[0].todo{
                            for case let t as Todo in todos  {
                                let tasks = ToDo(task: t.task!, status: t.status!, date: t.date!, section: t.section!, notes: t.note ?? "", color: [t.color1 ?? "", t.color2 ?? ""])
                                member.todos.append(tasks)
                            }
                            return member
                        }else{
                            print("No todos")
                        }
                        return member
                    }else{
                        print("incorrect password")
                    }
                }else {
                    print("incorrect email")
                }
            }
        }catch{}
        return nil
    }

    func addToDo(section: String, task : String, status : String, email: String, date: Date, note: String , color1: String, color2: String)-> Todo?{
        let todo = Todo(context: persistentContainer.viewContext)
        todo.task = task
        todo.status = status
        todo.section = section
        todo.date = date
        todo.note = note
        todo.color1 = color1
        todo.color2 = color2
        let fetch : NSFetchRequest<User> = User.fetchRequest()
        fetch.predicate = NSPredicate(format: "(email == %@)", argumentArray: [email])
        do{
            let result = try persistentContainer.viewContext.fetch(fetch) as [User]?
            if result?.count == 0 {
                return nil
            }else{
                result?[0].addToTodo(todo)
                saveContext()
                print("saved")
                return todo
            }
        }catch{}
        return nil
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
