//
//  CountryCollectionViewCell.swift
//  euro2024app
//
//  Created by дилара  on 10.07.2024.
//

import UIKit

class CountryCollectionViewCell: UICollectionViewCell {
    let flagLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 50)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let countryLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(flagLabel)
        contentView.addSubview(countryLabel)
        
        NSLayoutConstraint.activate([
            flagLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            flagLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            flagLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            flagLabel.heightAnchor.constraint(equalToConstant: 60),

            countryLabel.topAnchor.constraint(equalTo: flagLabel.bottomAnchor),
            countryLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            countryLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            countryLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(flag: String, name: String) {
        flagLabel.text = flag
        countryLabel.text = name
    }
}
