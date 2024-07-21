//
//  WeatherViewController.swift
//  VKWeather
//
//  Created by Danil on 18.07.2024.
//

import UIKit

protocol WeatherViewControllerProtocol: AnyObject {
    func displayWeather(type: String)
}

class WeatherViewController: UIViewController, WeatherViewControllerProtocol {
    
    var presenter: WeatherPresenter?
    
    lazy var weatherView: WeatherEffectView = {
        let view = WeatherEffectView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var weatherCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.layer.cornerRadius = 20
        collection.showsHorizontalScrollIndicator = false
        collection.contentInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        collection.backgroundColor = .green
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        weatherCollectionView.delegate = self
        weatherCollectionView.dataSource = self
        weatherCollectionView.register(WeatherCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        setupViews()
        setupConstraints()
        view.layoutIfNeeded()
        presenter?.randomWeather()
    }
    
    func setupViews() {
        view.addSubview(weatherCollectionView)
        view.addSubview(weatherView)
        view.bringSubviewToFront(weatherCollectionView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            weatherCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            weatherCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            weatherCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            weatherCollectionView.heightAnchor.constraint(equalToConstant: 100),
            
            weatherView.topAnchor.constraint(equalTo: view.topAnchor),
            weatherView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            weatherView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            weatherView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func displayWeather(type: String) {
        weatherView.showWeather(type: type)
    }
}
extension WeatherViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.numberOfRowsInSection() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = weatherCollectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! WeatherCollectionViewCell
        cell.label.text = presenter?.dataOfRowsInSection(index: indexPath.item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? WeatherCollectionViewCell {
            cell.contentView.backgroundColor = .orange
        }
        presenter?.changeWeather(index: indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? WeatherCollectionViewCell {
            cell.contentView.backgroundColor = .lightGray
        }
    }
}
