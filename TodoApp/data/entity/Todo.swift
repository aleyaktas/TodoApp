//
//  Todo.swift
//  TodoApp
//
//  Created by Aleyna Aktaş on 1.08.2023.
//

import Foundation

class Todo {
    var todo_id:Int
    var todo_name: String
    var isCompleted: Bool
    
    init(todo_id: Int, todo_name: String, isCompleted: Bool) {
        self.todo_id = todo_id
        self.todo_name = todo_name
        self.isCompleted = isCompleted
    }
}
