//
//  TournamentTableViewCell.swift
//  euro2024app
//
//  Created by Damir Rakhmatullin on 10.07.24.
//

import UIKit

class TournamentTableViewCell: UITableViewCell {

    override func prepareForReuse() {
         super.prepareForReuse()
    }
    
    @IBOutlet weak var numberOfGames: UILabel!
    @IBOutlet weak var teamName: UILabel!
    
    @IBOutlet weak var numberOfPoints: UILabel!
    @IBOutlet weak var loseGames: UILabel!
    @IBOutlet weak var drawGames: UILabel!
    @IBOutlet weak var winGames: UILabel!
    
    func config(match: Match) {
            
    }

}
