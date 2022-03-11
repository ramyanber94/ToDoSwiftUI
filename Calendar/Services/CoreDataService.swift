//
//  CoreDataService.swift
//  Calendar
//
//  Created by ramy on 2022-03-06.
//

import Foundation
import CoreData

class CoreDataService : ObservableObject {
    @Published var member = Member()
    
    func addUser(email: String, name : String, password : String){
        let user = User(context: persistentContainer.viewContext)
        user.name = name
        user.email = email
        user.password = password
        saveContext()
    }
    
    func getUser(email: String , password: String)-> Bool{
        let fetch : NSFetchRequest<User> = User.fetchRequest()
        fetch.predicate = NSPredicate(format: "(email == %@) AND (password == %@)", argumentArray: [email , password])
        do{
            let result = try persistentContainer.viewContext.fetch(fetch) as [User]?
            if result?.count == 0 {
                member.credintials?["email"] = result?[0].email
                member.credintials?["name"] = result?[0].name
                member.credintials?["password"] = result?[0].password
                if let todos = result?[0].todo{
                    var tasks = TaskWithStatus()
                    for case let t as Todo in todos  {
                        tasks.task![t.task!] = t.status
                        member.todo?.section![t.section!] = tasks
                    }
                }
                return true
            }else{
                return false
            }
        }catch{}
        return false
    }
    
    func addToDo(section: String, task : String, status : String, email: String, password: String){
        let todo = Todo(context: persistentContainer.viewContext)
        todo.task = task
        todo.status = status
        todo.section = section
        let fetch : NSFetchRequest<User> = User.fetchRequest()
        fetch.predicate = NSPredicate(format: "(email == %@) AND (password == %@)", argumentArray: [email , password])
        do{
            let result = try persistentContainer.viewContext.fetch(fetch) as [User]?
            if result?.count == 0 {
                result?[0].addToTodo(todo)
            }
        }catch{}
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
