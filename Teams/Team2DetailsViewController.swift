//
//  Team2DetailsViewController.swift
//  euro2024app
//
//  Created by дилара  on 11.07.2024.
//

import UIKit



class Team2DetailsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!

    struct Player {
        let num: Int
        let name: String
        let age: Int
    }

    let players = [
    Player(num: 1, name: "Джордан Пикфорд", age: 30),
    Player(num: 13, name: "Эрон Рамздейл", age: 26),
    Player(num: 23, name: "Дин Хендерсон", age: 27),
    Player(num: 2, name: "Кайл Уокер", age: 34),
    Player(num: 3, name: "Люк Шоу", age: 28),
    Player(num:5, name: "Джон Стоунз", age: 30),
    Player(num: 6, name: "Марк Гехи", age: 23),
    Player(num: 12, name: "Киран Триппьер", age: 33),
    Player(num: 14, name: "Эзри Конса", age: 26),
    Player(num: 15, name: "Льюис Данк", age: 32),
    Player(num: 22, name: "Джо Гомес", age: 27),
    Player(num: 4, name: "Деклан Райс", age: 25),
    Player(num: 8, name: "Трент Александр-Арнольд", age: 25),
    Player(num: 10, name: "Джуд Беллингем", age: 20),
    Player(num: 16, name: "Конор Галлахер", age: 24),
    Player(num: 25, name: "Адам Уортон", age: 20),
    Player(num: 26, name: "Кобби Мейну", age: 19),
    Player(num: 7, name: "Букайо Сака", age: 22),
    Player(num: 9, name: "Гарри Кейн (к)", age: 30),
    Player(num: 11, name: "Фил Фоден", age: 24),
    Player(num: 17, name: "Айван Тоуни", age: 28),
    Player(num: 18, name: "Энтони Гордон", age: 23),
    Player(num: 19, name: "Олли Уоткинс", age: 28),
    Player(num: 20, name: "Джаррод Боуэн", age: 27),
    Player(num: 21, name: "Эберечи Эзе", age: 25),
    Player(num: 24, name: "Коул Палмер", age: 22),
  
    ]
    override func viewDidLoad() {
            super.viewDidLoad()

            tableView.dataSource = self
            tableView.delegate = self
        }

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return players.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell2", for: indexPath) as! PlayerTableViewCell2

            let player = players[indexPath.row]
            cell.configure(with: player)

            return cell
        }
}
