//
//  DetailTodoVM.swift
//  TodoApp
//
//  Created by Aleyna Aktaş on 14.08.2023.
//

import Foundation

class DetailTodoVM {
    var krepo = TodosDaoRepository()
    
    func update(todo_id:Int,todo_name:String) {
        krepo.update(todo_id: todo_id, todo_name: todo_name)
    }
}
