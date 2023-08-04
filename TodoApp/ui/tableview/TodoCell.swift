//
//  TodoCell.swift
//  TodoApp
//
//  Created by Aleyna Aktaş on 4.08.2023.
//

import UIKit

class TodoCell: UITableViewCell {

    @IBOutlet weak var todoText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
