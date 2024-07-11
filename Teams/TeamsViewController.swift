//
//  TeamsViewController.swift
//  euro2024app
//
//  Created by дилара  on 10.07.2024.
//

import UIKit

class TeamsViewController: UIViewController {

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
    }
}

extension TeamsViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return teams.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TeamsCollectionViewCell ", for: indexPath ) as! TeamsCollectionViewCell
        cell.setup(with: teams[indexPath.row] )
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "showTeamDetails" {
                if let indexPath = collectionView.indexPathsForSelectedItems?.first,
                   let teamDetailsVC = segue.destination as? TeamDetailsViewController {
                    teamDetailsVC.team = teams[indexPath.row]
                }
            }
        }
}

extension TeamsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView( collectrionView:UICollectionView, layout CollectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 200)
    }
}

extension TeamsViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(teams[indexPath.row].title)
    }
}
