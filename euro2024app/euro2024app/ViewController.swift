//
//  ViewController.swift
//  euro2024app
//
//  Created by Damir Rakhmatullin on 5.07.24.
//

import UIKit

class UnderlineLayer: CALayer {
    
    var inputHeight: CGFloat
    var inputWidth: CGFloat
    
    init(inputElem: UIStackView) {
        self.inputHeight = inputElem.frame.height - 1
        self.inputWidth = inputElem.frame.width - 1
        super.init()
    }
    
    func getCALayer() -> CALayer {
        var outputCALayer = CALayer()
        outputCALayer.frame = CGRect(x: 0, y: inputHeight, width: inputWidth, height: 1)
        outputCALayer.backgroundColor = UIColor.gray.cgColor
        
        return outputCALayer
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


class ViewController: UIViewController {

    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var groupCompetition: UIStackView!
    @IBOutlet weak var final: UIStackView!
    @IBOutlet weak var halfFinal: UIStackView!
    @IBOutlet weak var quaterFinal: UIStackView!
    @IBOutlet weak var odnavosmayaFinal: UIStackView!
    @IBOutlet weak var matchesView: UIView!
    @IBOutlet weak var competitionTableView: UIView!  
    
    @IBOutlet weak var tournamentTableView: UITableView!
    var dataSource: [String] = ["Группа A", "Группа B", "Группа C", "Группа D", "Группа E", "Группа F"]
    var groupLable: String?
    var matchesLableText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        matchesView.layer.cornerRadius = 25
        
        
        var ur1 = UnderlineLayer(inputElem: final)
        final.layer.addSublayer(ur1.getCALayer())
        var ur2 = UnderlineLayer(inputElem: halfFinal)
        halfFinal.layer.addSublayer(ur2.getCALayer())
        var ur3 = UnderlineLayer(inputElem: quaterFinal)
        quaterFinal.layer.addSublayer(ur3.getCALayer())
        var ur4 = UnderlineLayer(inputElem: odnavosmayaFinal)
        odnavosmayaFinal.layer.addSublayer(ur4.getCALayer())
        var ur5 = UnderlineLayer(inputElem: groupCompetition)
        groupCompetition.layer.addSublayer(ur5.getCALayer())
      
        
        competitionTableView.layer.cornerRadius = 25
        tournamentTableView.backgroundColor = UIColor .clear
       
        tournamentTableView.dataSource = self
        tournamentTableView.delegate = self
        
        
        
        // Do any additional setup after loading the view.
        
    }
    
    @objc func stackViewTapped() {
        print("UIStackView был нажат")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "tournament" {
            if let destVC = segue.destination as? TournamentTableViewController {
                destVC.groupLable = groupLable
            }
        }
        if segue.identifier == "matches" {
            if let destVC = segue.destination as? MatchesViewController {
                destVC.matchesLableText = matchesLableText
            }
        }
    }


}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as? TableViewCell else {return TableViewCell()}
        
        cell.config(nameOfLable: dataSource[indexPath.row])
        cell.backgroundColor = UIColor .clear
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        groupLable = dataSource[indexPath.row]
        performSegue(withIdentifier: "tournament", sender: self)
        
    }
    
    
}

