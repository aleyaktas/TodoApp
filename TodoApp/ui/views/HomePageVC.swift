//
//  HomePage.swift
//  TodoApp
//
//  Created by Aleyna Aktaş on 1.08.2023.
//

import UIKit

class HomePageVC: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var todoTableView: UITableView!
    
    var todoList = [Todo]()
    var viewModel = HomePageVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        todoTableView.delegate = self
        todoTableView.dataSource = self
        
        _ = viewModel.todoList.subscribe(onNext: {list in
            self.todoList = list
            self.todoTableView.reloadData()
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.uploadTodos()
    }
    
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            if let todo = sender as? Todo {
                let goToVC = segue.destination as! DetailTodoVC
                goToVC.todo = todo
            }
        }
    }
    
    @IBAction func deleteAllTodos(_ sender: UIButton) {
        let alert = UIAlertController(title: "Delete All Todo", message: "Do you want delete all todos?", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(cancelAction)

        let okeyAction = UIAlertAction(title: "Delete", style: .destructive) {
            action in
            self.viewModel.deleteAllTodo()
        }
        alert.addAction(okeyAction)
        present(alert, animated: true, completion: nil)
    }
    
}


extension HomePageVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.search(searchText: searchText)
    }
}

extension HomePageVC: UITableViewDelegate, UITableViewDataSource, CompleteDelegate {
    
    func completeButton(indexPath: IndexPath) {
        let todo = todoList[indexPath.row]
        viewModel.completeTodo(todo_id: todo.todo_id, isCompleted: !todo.isCompleted)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let todo = todoList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell") as! TodoCell
        cell.indexPath = indexPath
        cell.cellProtocol = self

        if todo.isCompleted {
            cell.completeButton.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
            cell.todoText.textColor = .gray
            let attributedString = NSAttributedString(string: todo.todo_name, attributes: [
                  NSAttributedString.Key.strikethroughStyle: NSUnderlineStyle.single.rawValue,
                  NSAttributedString.Key.strikethroughColor: UIColor.black
              ])
                  
            cell.todoText.attributedText = attributedString
        } else {
            cell.completeButton.setImage(UIImage(systemName: "square"), for: .normal)
            cell.todoText.textColor = .black
            cell.todoText.attributedText = nil 
            cell.todoText.text = todo.todo_name

        }
        print(todo.isCompleted)
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
                self.viewModel.delete(todo_id: todo.todo_id)
            }
            alert.addAction(okeyAction)
            self.present(alert, animated: true)
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
}
