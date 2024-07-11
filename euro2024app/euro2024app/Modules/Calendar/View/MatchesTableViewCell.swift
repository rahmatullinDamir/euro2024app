//
//  MatchesTableViewCell.swift
//  euro2024app
//
//  Created by Damir Rakhmatullin on 10.07.24.
//

import UIKit

class MatchesTableViewCell: UITableViewCell {
    
    

    @IBOutlet weak var secondTeamGoals: UILabel!
    @IBOutlet weak var firstTeamGoals: UILabel!
    @IBOutlet weak var groupName: UILabel!
    @IBOutlet weak var secondTeamName: UILabel!
    @IBOutlet weak var firstTeamName: UILabel!
    @IBOutlet weak var dateOfMatch: UILabel!
    @IBOutlet weak var secondTeamScore: UILabel!
    
    @IBOutlet weak var secodTeamFlag: UILabel!
    @IBOutlet weak var firstTeamFlag: UILabel!
    @IBOutlet weak var firstTeamScore: UILabel!
    
    override func prepareForReuse() {
         super.prepareForReuse()
    }
    
    func config(match: Match) {
//        guard let goalDetailsStrings = match.goals1?.map({ goal in
//            "\(goal.name): \(goal.minute)"
//        }).joined(separator: ", ") else {return}
//        print(goalDetailsStrings)
        // Соединение всех строк в одну, разделенную запятыми
        var toFlagFirst: String
        var toFlagSecond: String
        toFlagFirst = match.team1.name.description
        toFlagSecond = match.team2.name.description
        if toFlagFirst == "Czech Republic" {
            toFlagFirst = "CzechRepublic"
        }
        else if toFlagSecond == "Czech Republic" {
            toFlagSecond = "CzechRepublic"
        }
        firstTeamFlag.text = FlagsEmoji(rawValue: toFlagFirst)?.getFlag
        secodTeamFlag.text = FlagsEmoji(rawValue: toFlagSecond)?.getFlag
        
        firstTeamGoals.text = match.goals1?.map({ goal in
            "\(goal.name): \(goal.minute)"
        }).joined(separator: ", ")
        secondTeamGoals.text = match.goals2?.map({ goal in
            "\(goal.name): \(goal.minute)"
        }).joined(separator: ", ")
        groupName.text = match.group?.description
        firstTeamName.text = match.team1.name.description
        secondTeamName.text = match.team2.name.description
        dateOfMatch.text = match.date.description
        firstTeamScore.text = match.score.ft?.first?.description
        secondTeamScore.text = match.score.ft?.last?.description
    }
    
    
}
