//
//  TodoCell.swift
//  TodoApp
//
//  Created by Aleyna Aktaş on 4.08.2023.
//

import UIKit

protocol CompleteDelegate {
    func completeButton(indexPath: IndexPath)
}


class TodoCell: UITableViewCell {

    @IBOutlet weak var todoText: UILabel!
    @IBOutlet weak var completeButton: UIButton!
    
    var indexPath:IndexPath?
    var cellProtocol: CompleteDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func completeButtonAct(_ sender: Any) {
        cellProtocol?.completeButton(indexPath: indexPath!)
    }
    
}
