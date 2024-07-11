//
//  TableViewCell.swift
//  euro2024app
//
//  Created by Damir Rakhmatullin on 5.07.24.
//

import UIKit

class TableViewCell: UITableViewCell {
    

    
    

    @IBOutlet weak var tableViewCellLAble: UILabel!
    override func prepareForReuse() {
         super.prepareForReuse()
    }
    
    func config(nameOfLable: String) {
        tableViewCellLAble.text = nameOfLable    
    }
    

}
