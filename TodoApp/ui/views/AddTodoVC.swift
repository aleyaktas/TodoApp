//
//  AddTodoVC.swift
//  TodoApp
//
//  Created by Aleyna Aktaş on 1.08.2023.
//

import UIKit

class AddTodoVC: UIViewController {
    
    @IBOutlet weak var todoTextField: UITextField!
    
    var viewModel = AddTodoVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = .systemOrange
    }
    
    @IBAction func saveButtonAct(_ sender: UIButton) {
        if let todo = todoTextField.text {
            viewModel.save(todo_name: todo)
        }
    }
}
