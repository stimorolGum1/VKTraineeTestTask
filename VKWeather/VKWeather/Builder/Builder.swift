//
//  Builder.swift
//  VKWeather
//
//  Created by Danil on 18.07.2024.
//

import Foundation
import UIKit

class Builder {
    func makeNewsScreen() -> UIViewController {
        let model = WeatherModel()
        let view = WeatherViewController()
        let presenter = WeatherPresenter(view: view, model: model)
        view.presenter = presenter
        return view
    }
}
