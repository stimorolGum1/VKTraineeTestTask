//
//  WeatherPresenter.swift
//  VKWeather
//
//  Created by Danil on 18.07.2024.
//

import Foundation

protocol WeatherPresenterProtocol: AnyObject {
    func numberOfRowsInSection() -> Int
    func dataOfRowsInSection(index: Int) -> String
    func changeWeather(index: Int)
    func randomWeather()
}

class WeatherPresenter: WeatherPresenterProtocol {
    
    weak var view: WeatherViewControllerProtocol?
    var model: WeatherModel
    
    init(view: WeatherViewControllerProtocol, model: WeatherModel) {
        self.view = view
        self.model = model
    }
    
    func numberOfRowsInSection() -> Int {
        return model.weatherTypes.count
    }
    
    func dataOfRowsInSection(index: Int) -> String {
        return model.weatherTypes[index].name
    }
    
    func changeWeather(index: Int) {
        let weatherType = model.weatherTypes[index].code
        view?.displayWeather(type: weatherType)
    }
    
    func randomWeather() {
        let randomIndex = Int.random(in: 0..<model.weatherTypes.count)
        let weatherType = model.weatherTypes[randomIndex].code
        view?.displayWeather(type: weatherType)
    }
}
