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
    
    var matchesLableText: String?
    
    func config(matchesLableText: String) {
        self.matchesLableText = matchesLableText
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        matchesView.layer.cornerRadius = 25
        matchesLable.text = matchesLableText
        
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
