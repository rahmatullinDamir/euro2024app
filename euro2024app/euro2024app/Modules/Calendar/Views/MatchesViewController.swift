//
//  MatchesViewController.swift
//  euro2024app
//
//  Created by Damir Rakhmatullin on 7.07.24.
//

import UIKit


class MatchesViewController: UIViewController {
    
    @IBOutlet weak var matchesView: UIView!
    @IBOutlet weak var matchesLable: UILabel!
    @IBOutlet weak var tableViewMatches: UITableView!
    let networkManager = NetworkManager()
    var matchesLabelText: MatchStage?
    var matches: [Match] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        matchesView.layer.cornerRadius = 25
        matchesLable.text = matchesLabelText?.roundNameLabel
        
        guard let matchStage = matchesLabelText else {
            print("No match type specified")
            return
        }
        
        networkManager.getInfoFromJSON { [weak self] result in
            guard let self = self else { return }
            var filteredRounds: [Round]
            
            if matchStage == .groupStage {
                let matchdays = ["Matchday 1", "Matchday 2", "Matchday 3"]
                filteredRounds = result.rounds.filter { matchdays.contains($0.name) }
            } else {
                filteredRounds = result.rounds.filter { $0.name == matchStage.roundName }
            }
            
            matches = filteredRounds.flatMap { $0.matches }
            DispatchQueue.main.async {
                    self.tableViewMatches.reloadData() // Обновление таблицы в главном потоке
                }
                tableViewMatches.delegate = self
                tableViewMatches.dataSource = self
        }
    }
    
//    func displayMatches(matches: [Match]) {
//        
//        for match in matches {
//            
//            print("Match \(match.num): \(match.team1.name) vs \(match.team2.name)")
//            print("date: \(match.date)")
//            print(match.group)
//        }
}
extension MatchesViewController:  UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return matches.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MatchesTableViewCell") as? MatchesTableViewCell else {
            return UITableViewCell()
        }
        cell.config(match: matches[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 205
    }
    
    
}
