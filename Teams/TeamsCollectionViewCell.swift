//
//  TeamsCollectionViewCell.swift
//  euro2024app
//
//  Created by дилара  on 10.07.2024.
//

import UIKit

class TeamsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var teamImageView: UIImageView!
    
    @IBOutlet weak var titleLbl: UILabel!
    
    func setup (with team: Teams){
        teamImageView.image = team.image
        titleLbl.text = team.title 
    }
}
