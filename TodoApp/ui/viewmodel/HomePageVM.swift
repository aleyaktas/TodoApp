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
        todoList = krepo.todoList
    }
    
    func delete(todo_id:Int) {
        krepo.delete(todo_id: todo_id)
        uploadTodos()
    }
    func search(searchText:String) {
        krepo.search(searchText: searchText)
    }
    
    func uploadTodos() {
        krepo.uploadTodos()
    }
}
