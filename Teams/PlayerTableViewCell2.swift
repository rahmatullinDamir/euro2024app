//
//  PlayerTableViewCell2TableViewCell.swift
//  euro2024app
//
//  Created by дилара  on 11.07.2024.
//

import UIKit

class PlayerTableViewCell2: UITableViewCell {

    @IBOutlet weak var numLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    func configure(with player: Player) {
        numLabel.text = String(player.num)
        nameLabel.text = player.name
        ageLabel.text = String(player.age)
    }

}
