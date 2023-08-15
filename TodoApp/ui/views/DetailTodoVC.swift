//
//  TodoDetailVC.swift
//  TodoApp
//
//  Created by Aleyna Aktaş on 1.08.2023.
//

import UIKit

class DetailTodoVC: UIViewController {

    @IBOutlet weak var todoTextField: UITextField!
    
    var todo:Todo?
    var viewModel = DetailTodoVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let todo {
            todoTextField.text = todo.todo_name
        }
        navigationController?.navigationBar.tintColor = .systemOrange
    }

    
    @IBAction func updateButtonAct(_ sender: UIButton) {
        if let todoName = todoTextField.text,
           let todo {
            viewModel.update(todo_id: todo.todo_id, todo_name: todoName)
            let alertController = UIAlertController(title: "Success",
                message: "Updated todo: \(todoName)",
                preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Okey", style: .default, handler: nil)
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
            }
        }
    
    


}
