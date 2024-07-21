//
//  WeatherModel.swift
//  VKWeather
//
//  Created by Danil on 18.07.2024.
//

import Foundation

struct WeatherModel {
    let weatherTypes: [WeatherType] = [
        WeatherType(name: Localization.weatherClear, code: "Clear"),
        WeatherType(name: Localization.weatherRain, code: "Rain"),
        WeatherType(name: Localization.weatherThunder, code: "Thunderstorm"),
        WeatherType(name: Localization.weatherFog, code: "Fog"),
        WeatherType(name: Localization.weatherSnow, code: "Snow"),
        WeatherType(name: Localization.weatherCloudy, code: "Cloudy")
    ]
}

struct WeatherType {
    let name: String
    let code: String
}
