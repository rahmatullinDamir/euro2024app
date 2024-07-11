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
    var resulters: [Dictionary<String, Int>.Element]?
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
        tournamentTableView.dataSource = self
        tournamentTableView.delegate = self
        
        networkManager.getInfoFromJSON { [weak self] result in
            guard let self = self else { return }
            var filteredRounds: [Round]
            var matchesFiltred: [Match] = []
            let matchdays = ["Matchday 1", "Matchday 2", "Matchday 3"]
            filteredRounds = result.rounds.filter { matchdays.contains($0.name) }
            var cnt = 0
            for round in filteredRounds {
                for match in round.matches {
                    if match.group == self.groupLable?.roundName {
                        for i in matchesFiltred {
                            if i.num == match.num {
                                cnt += 1
                            }
                        }
                        if cnt == 0 {
                            matchesFiltred.append(match)
                        }
                        cnt = 0
                    }
                }
            }
            
            var teams:[String] = []
            var teamsOutput:[String:Int] = [:]
            for team in matchesFiltred {
                if teams.contains(team.team1.name) == false {
                    teams.append(team.team1.name)
                }
            }
            
//            print(teams)
            var scoreOfTeam: Int = 0
            for i in teams {
                for j in matchesFiltred {
                    if j.team1.name == i  {
                        if j.score.ft?.first ?? 0 > j.score.ft?.last ?? 0{
                            scoreOfTeam += 3
                        }
                        else if j.score.ft?.first == j.score.ft?.last {
                            scoreOfTeam += 1
                        }
                    }
                    if j.team2.name == i  {
                        if j.score.ft?.first ?? 0 < j.score.ft?.last ?? 0{
                                scoreOfTeam += 3
                        }
                        else if j.score.ft?.first == j.score.ft?.last {
                                scoreOfTeam += 1
                        }
                            
                    }
                }
                teamsOutput.updateValue(scoreOfTeam, forKey: i)
                scoreOfTeam = 0
            }
            self.resulters = teamsOutput.sorted { $0.value > $1.value }
            DispatchQueue.main.async {
                self.tournamentTableView.reloadData() // Обновление таблицы в главном потоке
            }
        }
    }
}
        
        
        // Do any additional setup after loading the view.
//    }

extension TournamentTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resulters?.count ?? 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TournamentTableViewCell") as? TournamentTableViewCell else {
            return UITableViewCell()
        }
        guard let ou = resulters?[indexPath.row] as? Dictionary<String, Int>.Element  else {return UITableViewCell()}
        
        cell.config(match: ou)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 205
    }
}
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

