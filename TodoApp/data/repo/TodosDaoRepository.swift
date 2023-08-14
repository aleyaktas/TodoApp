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
    
    func save(todo_name:String) {
        print("Save Todo: \(todo_name)")
    }
    
    func update(todo_id:Int,todo_name:String) {
        print("Update Todo \(todo_id) \(todo_name)")
    }
    
    func delete(todo_id:Int) {
        print("Delete todo: \(todo_id)")
    }
    
    func search(searchText:String) {
        print("Todo name: \(searchText)")
    }
    
    func uploadTodos() {
        var list = [Todo]()
        
        let todo1 = Todo(todo_id: 1, todo_name: "Do homework")
        let todo2 = Todo(todo_id: 2, todo_name: "Attend lesson at 8:00")
        let todo3 = Todo(todo_id: 3, todo_name: "Read a book")
        
        list.append(todo1)
        list.append(todo2)
        list.append(todo3)
        
        todoList.onNext(list)
    }
}
