//
//  MatchesTableViewCell.swift
//  euro2024app
//
//  Created by Damir Rakhmatullin on 9.07.24.
//

import UIKit

class MatchesTableViewCell: UITableViewCell {

    @IBOutlet weak var imageFirstTeam: UIImageView!
    @IBOutlet weak var imageSecondTeam: UIImageView!
    @IBOutlet weak var scoreFirstTeam: UILabel!
    @IBOutlet weak var scoreSecondTeam: UILabel!
    @IBOutlet weak var dateOfMatch: UILabel!
    @IBOutlet weak var nameSecondTeam: UILabel!
    @IBOutlet weak var nameFirstTeam: UILabel!
    @IBOutlet weak var groupName: UILabel!
    @IBOutlet weak var goalsFirstTeam: UILabel!
    @IBOutlet weak var goalsSecondTeam: UILabel!
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.scoreFirstTeam.text = nil
        self.scoreSecondTeam.text = nil
        self.dateOfMatch.text = nil
        self.nameFirstTeam.text = nil
        self.nameSecondTeam.text = nil
        self.groupName.text = nil
        self.goalsFirstTeam.text = nil
        self.goalsSecondTeam.text = nil
      }
      
    func config(match: Match) {
        self.scoreFirstTeam.text = match.score.ft?.first?.description
        self.scoreSecondTeam.text = match.score.ft?.last?.description
        self.dateOfMatch.text = match.date
        self.nameFirstTeam.text = match.team1.name
        self.nameSecondTeam.text = match.team2.name
        self.groupName.text = match.group?.description
        self.goalsFirstTeam.text = match.goals1?.description
        self.goalsSecondTeam.text = match.goals2?.description
    }
    

}
