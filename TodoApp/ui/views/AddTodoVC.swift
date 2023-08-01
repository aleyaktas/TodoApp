//
//  AddTodoVC.swift
//  TodoApp
//
//  Created by Aleyna Aktaş on 1.08.2023.
//

import UIKit

class AddTodoVC: UIViewController {

    
    @IBOutlet weak var todoTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func saveButtonAct(_ sender: UIButton) {
        if let todo = todoTextField.text {
            save(todo_name:todo)
        }
    }
    func save(todo_name:String) {
        print("Save Todo: \(todo_name)")
    }
}
