//
//  HomePageViewModel.swift
//  TodoApp
//
//  Created by Aleyna Aktaş on 14.08.2023.
//

import Foundation
import RxSwift

class HomePageVM {
    var krepo = TodosDaoRepository()
    var todoList = BehaviorSubject<[Todo]>(value: [Todo]())
    
    init() {
        copyDatabase()
        todoList = krepo.todoList
    }
    
    func delete(todo_id:Int) {
        krepo.delete(todo_id: todo_id)
        uploadTodos()
    }
    func deleteAllTodo() {
        krepo.deleteAllTodo()
        uploadTodos()
    }
    func search(searchText:String) {
        krepo.search(searchText: searchText)
    }
    
    func uploadTodos() {
        krepo.uploadTodos()
    }
    
    func completeTodo(todo_id:Int,isCompleted: Bool) {
        krepo.completeTodo(todo_id: todo_id, isCompleted: isCompleted)
        uploadTodos()
    }
    
    func copyDatabase() {
        let bundlePath = Bundle.main.path(forResource: "todo", ofType: ".sqlite")
        
        let filePath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let databaseURL = URL(fileURLWithPath: filePath).appendingPathComponent("todo.sqlite")
        
        let fm = FileManager.default
        
        if fm.fileExists(atPath: databaseURL.path()) {
            print("Database already exist")
        }else {
            do {
                try fm.copyItem(atPath: bundlePath!, toPath: databaseURL.path)
            } catch{
                print(error.localizedDescription)
            }
        }
        
        
    }
}
