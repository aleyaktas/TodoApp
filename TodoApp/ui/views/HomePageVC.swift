//
//  HomePage.swift
//  TodoApp
//
//  Created by Aleyna Aktaş on 1.08.2023.
//

import UIKit

class HomePageVC: UIViewController {
    
    var todoList = [Todo]()

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var todoTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        todoTableView.delegate = self
        todoTableView.dataSource = self
        
        let todo1 = Todo(todo_id: 1, todo_name: "Do homework")
        let todo2 = Todo(todo_id: 2, todo_name: "Attend lesson at 8:00")
        let todo3 = Todo(todo_id: 3, todo_name: "Read a book")
        
        todoList.append(todo1)
        todoList.append(todo2)
        todoList.append(todo3)
        
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


extension HomePageVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Todo name: \(searchText)")
    }
}

extension HomePageVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let todo = todoList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell") as! TodoCell
        cell.todoText.text = todo.todo_name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let todo = todoList[indexPath.row]
        performSegue(withIdentifier: "toDetail", sender: todo)
        tableView.deselectRow(at: indexPath, animated: true) // it is deleselection when back to page
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") {_,_,_ in
            let todo = self.todoList[indexPath.row]
            let alert = UIAlertController(title: "Delete Todo", message: "Delete \(todo.todo_name) todo?", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
            alert.addAction(cancelAction)

            let okeyAction = UIAlertAction(title: "Delete", style: .destructive) {
                action in
                print("Delete todo: \(todo.todo_name)")
            }
            alert.addAction(okeyAction)
            self.present(alert, animated: true)
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
}
