//
//  ViewController.swift
//  euro2024app
//
//  Created by Хамидуллин Марат Романович on 11.07.2024.
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
    
    var dataSource: [Groups] = [.GroupA, .GroupB, .GroupC, .GroupD, .GroupE, .GroupF]
    var groupLabel: Groups?
    var matchesLabelText: MatchStage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        matchesView.layer.cornerRadius = 25
        
        // Underline layers setup
        let underlines = [final, halfFinal, quaterFinal, odnavosmayaFinal, groupCompetition]
        underlines.forEach { underline in
            if let underline = underline {
                let ur = UnderlineLayer(inputElem: underline)
                underline.layer.addSublayer(ur.getCALayer())
            }
        }
        
        competitionTableView.layer.cornerRadius = 25
        tournamentTableView.backgroundColor = .clear
        tournamentTableView.dataSource = self
        tournamentTableView.delegate = self
    }
    
    @IBAction func groupMatchesButton(_ sender: Any) {
        goToNextViewFromMatches(matchesType: .groupStage)
    }
    
    @IBAction func odnaVosmayaButton(_ sender: Any) {
        goToNextViewFromMatches(matchesType: .roundOf16)
    }
    
    @IBAction func quaterFinalButton(_ sender: Any) {
        goToNextViewFromMatches(matchesType: .quarterFinals)
    }
    
    @IBAction func halfFinalButton(_ sender: Any) {
        goToNextViewFromMatches(matchesType: .semiFinals)
    }
    
    @IBAction func finalButton(_ sender: Any) {
        goToNextViewFromMatches(matchesType: .finals)
    }
    
    private func goToNextViewFromMatches(matchesType: MatchStage) {
        matchesLabelText = matchesType
        performSegue(withIdentifier: "matches", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "tournament", let destVC = segue.destination as? TournamentTableViewController {
            destVC.groupLable = groupLabel
        }
        if segue.identifier == "matches", let destVC = segue.destination as? MatchesViewController {
            destVC.matchesLabelText = matchesLabelText
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as? TableViewCell else {
            return TableViewCell()
        }
        cell.config(nameOfLable: dataSource[indexPath.row].roundNameLabel)
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        groupLabel = dataSource[indexPath.row]
        performSegue(withIdentifier: "tournament", sender: self)
    }
}
