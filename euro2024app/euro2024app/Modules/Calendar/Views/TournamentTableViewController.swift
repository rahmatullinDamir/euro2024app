//
//  TournamentTableViewController.swift
//  euro2024app
//
//  Created by Damir Rakhmatullin on 6.07.24.
//

import UIKit

class TournamentTableViewController: UIViewController {
    
    var networkManager = NetworkManager()
    var groupLable: Groups?
    @IBOutlet weak var tournamentView: UIView!
    @IBOutlet weak var tournamentTableView: UITableView!
    @IBOutlet weak var tournamentLable: UILabel!
    
    func config(groupLabel: Groups) {
        self.groupLable = groupLabel
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tournamentLable.text = groupLable?.roundNameLabel
        tournamentView.layer.cornerRadius = 25
        
        networkManager.getInfoFromJSON { [weak self] result in
            guard let self = self else { return }
            var filteredRounds: [Round]
            var matchesFiltred: [Match] = []
            let matchdays = ["Matchday 1", "Matchday 2", "Matchday 3"]
            filteredRounds = result.rounds.filter { matchdays.contains($0.name) }
            var filteredRounds2 = filteredRounds.map { round in
                
                for match in round.matches {
                    if match.group == self.groupLable?.roundName {
                        matchesFiltred.append(match)
                    }
                }
                return matchesFiltred
            }
            print("hyu")
            for i in filteredRounds
            
            
            
//            matches = filteredRounds.flatMap { $0.matches }
//            DispatchQueue.main.async {
//                    self.tableViewMatches.reloadData() // Обновление таблицы в главном потоке
//                }
        }
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
