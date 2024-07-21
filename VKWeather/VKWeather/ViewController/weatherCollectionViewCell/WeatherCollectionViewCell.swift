//
//  WeatherCollectionViewCell.swift
//  VKWeather
//
//  Created by Danil on 19.07.2024.
//

import UIKit

class WeatherCollectionViewCell: UICollectionViewCell {
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .lightGray
        contentView.layer.cornerRadius = 15
        contentView.layer.masksToBounds = true
        setupViews()
        setupCostraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        contentView.addSubview(label)
    }
    
    func setupCostraints() {
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            label.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
            label.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            label.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10)
        ])
    }
}
