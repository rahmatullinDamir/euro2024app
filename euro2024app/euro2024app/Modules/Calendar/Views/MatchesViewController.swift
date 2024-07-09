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
    
    
    let networkManager = NetworkManager()
    var matchesLableText: String?
    var groupMatches:[Round] = []
    var odnaVosmayaFinalMatches:[Round] = []
    var quaterFinalMatches:[Round] = []
    var semiFinalMatches:[Round] = []
    var finalMatch:[Round] = []

    @IBOutlet weak var tableViewMatches: UITableView!
    
    func config(matchesLableText: String) {
        self.matchesLableText = matchesLableText
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        matchesView.layer.cornerRadius = 25
        matchesLable.text = matchesLableText
        networkManager.getInfoFromJSON { result in
            for round in result.rounds {
                if round.name.contains("Matchday") { // лежат объекты класса round а должны как-то стать объектами Match
                    self.groupMatches.append(round)
                }
                else if round.name.contains("Round of 16") {
                    self.odnaVosmayaFinalMatches.append(round)
                }
                else if round.name.contains("Quarter-finals") {
                    self.quaterFinalMatches.append(round)
                }
                else if round.name.contains("Semi-finals") {
                    self.semiFinalMatches.append(round)
                }
                else if round.name.contains("Final") {
                    self.finalMatch.append(round)
                }
            }
        }
        tableViewMatches.dataSource = self
        tableViewMatches.delegate = self
        print(self.groupMatches)
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

extension MatchesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MatchesTableViewCell") as? MatchesTableViewCell else {return UITableViewCell()}
        cell.config(match: self.groupMatches[indexPath.row])
        return cell
    }
    
    
}
