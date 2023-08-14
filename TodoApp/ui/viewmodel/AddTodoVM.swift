//
//  AddTodoVM.swift
//  TodoApp
//
//  Created by Aleyna Aktaş on 14.08.2023.
//

import Foundation

class AddTodoVM {
    var krepo = TodosDaoRepository()
    
    func save(todo_name:String) {
        krepo.save(todo_name: todo_name)
    }
}
