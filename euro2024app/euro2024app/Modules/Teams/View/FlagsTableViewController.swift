//
//  FlagsTableViewController.swift
//  euro2024app
//
//  Created by дилара  on 10.07.2024.
//

import UIKit

class FlagsTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var tableView: UITableView!
    
    let flags: [FlagsEmoji] = [
        .Germany, .Hungary, .Scotland, .Switzerland, .Spain,
        .Italy, .Croatia, .Albania, .Slovenia, .Serbia,
        .Denmark, .England, .Poland, .Austria, .Netherlands,
        .France, .Romania, .Belgium, .Ukraine, .Turkey,
        .Portugal, .Georgia, .CzechRepublic, .Slovakia
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Сборные"

        tableView = UITableView(frame: view.bounds)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "FlagCell")
        
        view.addSubview(tableView)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flags.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FlagCell", for: indexPath)
        let flag = flags[indexPath.row]
        cell.textLabel?.text = "\(flag.getFlag) \(flag.getRussianName)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let flag = flags[indexPath.row]
        if flag == .Spain {
            let teamDetailsVC = TeamDetailsViewController()
            teamDetailsVC.title = FlagsEmoji.Spain.getRussianName
            navigationController?.pushViewController(teamDetailsVC, animated: true)
        }
    }
}
