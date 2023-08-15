//
//  TodosDaoRepository.swift
//  TodoApp
//
//  Created by Aleyna Aktaş on 14.08.2023.
//

import Foundation
import RxSwift

class TodosDaoRepository {
    var todoList = BehaviorSubject<[Todo]>(value: [Todo]())
    
    let db:FMDatabase?
    
    init() {
        let filePath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let databaseURL = URL(fileURLWithPath: filePath).appendingPathComponent("todo.sqlite")
        db = FMDatabase(path: databaseURL.path)
    }
    
    func save(todo_name:String) {
        db?.open()
        do {
            try db!.executeUpdate("INSERT INTO todos (name) VALUES (?)", values: [todo_name])
        } catch  {
            print(error.localizedDescription)
        }
        db?.close()
        print("Save Todo: \(todo_name)")
    }
    
    func update(todo_id:Int,todo_name:String) {
        db?.open()
        do {
            try db!.executeUpdate("UPDATE todos SET name = ? WHERE id = ?", values: [todo_name, todo_id])
        } catch  {
            print(error.localizedDescription)
        }
        db?.close()
        print("Update Todo \(todo_id) \(todo_name)")
    }
    
    func completeTodo(todo_id:Int,isCompleted: Bool) {
        db?.open()
        do {
            try db!.executeUpdate("UPDATE todos SET isCompleted = ? WHERE id = ?", values: [isCompleted, todo_id])
        } catch  {
            print(error.localizedDescription)
        }
        db?.close()
        print("Update Todo \(todo_id) \(isCompleted)")
    }
    
    func delete(todo_id:Int) {
        db?.open()
        do {
            try db!.executeUpdate("DELETE FROM todos WHERE id = ?", values: [todo_id])
        } catch  {
            print(error.localizedDescription)
        }
        db?.close()
        print("Delete todo: \(todo_id)")
    }
    
    func deleteAllTodo() {
        db?.open()
        do {
            try db!.executeUpdate("DELETE FROM todos", values: nil)
        } catch  {
            print(error.localizedDescription)
        }
        db?.close()
        print("Deleted all todos")
    }
    
    func search(searchText:String) {
        db?.open()
        var list = [Todo]()
        
        do{
            let result = try db!.executeQuery("SELECT * FROM todos WHERE name like '%\(searchText)%'", values: nil)
            while result.next() {
                let id = Int(result.string(forColumn: "id"))!
                let name = result.string(forColumn: "name")!
                let isCompleted = result.int(forColumn: "isCompleted") == 0 ? false : true

                let todo = Todo(todo_id: id, todo_name: name, isCompleted: isCompleted)
                list.append(todo)
            }
            todoList.onNext(list) //tetikleme

        }catch {
            print(error.localizedDescription)
        }

        db?.close()
        print("Todo name: \(searchText)")
    }
    
    func uploadTodos() {
        db?.open()
        var list = [Todo]()
        
        do{
            let result = try db!.executeQuery("SELECT * FROM todos", values: nil)
            while result.next() {
                let id = Int(result.string(forColumn: "id"))!
                let name = result.string(forColumn: "name")!
                let isCompleted = result.int(forColumn: "isCompleted") == 0 ? false : true
                
                let todo = Todo(todo_id: id, todo_name: name, isCompleted: isCompleted)
                list.append(todo)
            }
            todoList.onNext(list) //tetikleme

        }catch {
            print(error.localizedDescription)
        }

        db?.close()
    }
}
