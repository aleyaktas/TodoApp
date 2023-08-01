//
//  HomePage.swift
//  TodoApp
//
//  Created by Aleyna Aktaş on 1.08.2023.
//

import UIKit

class HomePageVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func detailButtonAct(_ sender: Any) {
        let todo = Todo(todo_id: 1, todo_name: "Study lesson")
        performSegue(withIdentifier: "toDetail", sender: todo)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            if let todo = sender as? Todo {
                let goToVC = segue.destination as! DetailTodoVC
                goToVC.todo = todo
            }
        }
    }
}

