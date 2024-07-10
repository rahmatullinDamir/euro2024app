//
//  TournamentTableViewController.swift
//  euro2024app
//
//  Created by Damir Rakhmatullin on 6.07.24.
//

import UIKit

class TournamentTableViewController: UIViewController {
    
    var groupLable: String?
    @IBOutlet weak var tournamentView: UIView!
    
    @IBOutlet weak var tournamentLable: UILabel!
    
    func config(groupLabel: String) {
        self.groupLable = groupLabel
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tournamentLable.text = groupLable
        tournamentView.layer.cornerRadius = 25
        

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
