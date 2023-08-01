//
//  TodoDetailVC.swift
//  TodoApp
//
//  Created by Aleyna Aktaş on 1.08.2023.
//

import UIKit

class DetailTodoVC: UIViewController {
    
    var todo:Todo?

    @IBOutlet weak var todoTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let todo {
            todoTextField.text = todo.todo_name
        }
    }

    
    @IBAction func updateButtonAct(_ sender: UIButton) {
        if let todoName = todoTextField.text,
           let todo {
            update(todo_id: todo.todo_id, todo_name: todoName)
        }
    }
    
    func update(todo_id:Int,todo_name:String) {
        print("Update Todo \(todo_id) \(todo_name)")
    }

}
