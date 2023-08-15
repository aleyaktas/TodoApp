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
            let alertController = UIAlertController(title: "Success",
                message: "Add new todo: \(todo)",
                preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Okey", style: .default, handler: nil)
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
            todoTextField.text = ""
        }
    }
}
