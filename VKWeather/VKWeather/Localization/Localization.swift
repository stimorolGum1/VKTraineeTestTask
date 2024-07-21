//
//  Localization.swift
//  VKWeather
//
//  Created by Danil on 21.07.2024.
//

import Foundation

enum Localization {
    static let weatherClear = Bundle.main.localizedString(forKey: "weatherClear", value: "", table: "Localization")
    static let weatherRain = Bundle.main.localizedString(forKey: "weatherRain", value: "", table: "Localization")
    static let weatherThunder = Bundle.main.localizedString(forKey: "weatherThunder", value: "", table: "Localization")
    static let weatherFog = Bundle.main.localizedString(forKey: "weatherFog", value: "", table: "Localization")
    static let weatherSnow = Bundle.main.localizedString(forKey: "weatherSnow", value: "", table: "Localization")
    static let weatherCloudy = Bundle.main.localizedString(forKey: "weatherCloudy", value: "", table: "Localization")
}
