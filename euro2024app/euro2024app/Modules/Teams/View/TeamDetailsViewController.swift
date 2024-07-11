//
//  TeamDetailsViewController.swift
//  euro2024app
//
//  Created by дилара  on 10.07.2024.
//

import UIKit

struct Player {
    let num: Int
    let name: String
    let age: Int
}

class TeamDetailsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var tableView: UITableView!
    
    let players = [
        Player(num: 1, name: "Давид Райя", age: 28),
        Player(num: 13, name: "Алекс Ремиро", age: 29),
        Player(num: 23, name: "Унаи Симон", age: 27),
        Player(num: 2, name: "Дани Карвахаль", age: 32),
        Player(num: 3, name: "Робен Ле Норман", age: 27),
        Player(num: 4, name: "Начо Фернандес", age: 34),
        Player(num: 5, name: "Дани Вивиан", age: 24),
        Player(num: 12, name: "Александро Гримальдо", age: 28),
        Player(num: 14, name: "Эмерик Ляпорт", age: 30),
        Player(num: 22, name: "Хесус Навас", age: 38),
        Player(num: 24, name: "Марк Кукурелья", age: 25),
        Player(num: 6, name: "Микель Мерино", age: 27),
        Player(num: 8, name: "Фабиан Руис", age: 28),
        Player(num: 15, name: "Алекс Баэна", age: 22),
        Player(num: 16, name: "Родри", age: 27),
        Player(num: 18, name: "Мартин Субименди", age: 25),
        Player(num: 20, name: "Педри", age: 21),
        Player(num: 25, name: "Фермин Лопес", age: 21),
        Player(num: 7, name: "Альваро Мораката (к)", age: 31),
        Player(num: 9, name: "Хоселу", age: 34),
        Player(num: 10, name: "Дани Ольмо", age: 26),
        Player(num: 11, name: "Ферран Торрес", age: 24),
        Player(num: 17, name: "Нико Уильямс", age: 21),
        Player(num: 19, name: "Ламин Ямал", age: 16),
        Player(num: 21, name: "Миекль Оярсабаль", age: 27),
        Player(num: 26, name: "Айосе Перес", age: 30),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        tableView = UITableView(frame: view.bounds)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "PlayerCell")
        view.addSubview(tableView)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell", for: indexPath)
        let player = players[indexPath.row]
        cell.textLabel?.text = "\(player.num) - \(player.name), \(player.age)"
        return cell
    }
}
