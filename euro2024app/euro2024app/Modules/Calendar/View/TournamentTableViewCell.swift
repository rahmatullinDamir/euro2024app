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
 
    
    @IBOutlet weak var flag: UILabel!
    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var numberOfPoints: UILabel!
    @IBOutlet weak var loseGames: UILabel!
    @IBOutlet weak var drawGames: UILabel!
    @IBOutlet weak var winGames: UILabel!
    
    func config(match: Dictionary<String, Int>.Element) {
        var drawGamesNum: Int
        var toFlag: String
        self.teamName.text = match.key
        self.numberOfPoints.text = match.value.description
        var winGames = match.value / 3
        if (winGames != 0) {
             drawGamesNum = match.value % (winGames * 3)
        }
        else {
            drawGamesNum = match.value % 3
        }
      
        var looseGames = 3 - winGames - drawGamesNum
        if looseGames < 0 {
            looseGames = 0
        }
        self.winGames.text = winGames.description
        self.drawGames.text = drawGamesNum.description
        self.loseGames.text = looseGames.description
        self.numberOfGames.text = 3.description
        if match.key == "Czech Republic" {
            toFlag = "CzechRepublic"
        }
        else {
            toFlag = match.key
        }
        self.flag.text = FlagsEmoji(rawValue: toFlag)?.getFlag
    }

}
