//
//  WeatherEffectView.swift
//  VKWeather
//
//  Created by Danil on 20.07.2024.
//

import UIKit

protocol WeatherEffectViewProtocol: AnyObject {
    func showWeather(type: String)
}

class WeatherEffectView: UIView, WeatherEffectViewProtocol {
    
    var currentWeatherView: UIView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func showWeather(type: String) {
        let newView = createWeatherView(type: type)
        newView.alpha = 0
        addSubview(newView)
        
        UIView.animate(withDuration: 1.0, animations: {
            newView.alpha = 1
            self.currentWeatherView?.alpha = 0
        }, completion: { _ in
            self.currentWeatherView?.removeFromSuperview()
            self.currentWeatherView = newView
        })
    }
    
    func createWeatherView(type: String) -> UIView {
        let weatherView = UIView(frame: self.bounds)
        
        switch type {
        case "Clear":
            showClearWeather(in: weatherView)
        case "Rain":
            showRainWeather(in: weatherView)
        case "Thunderstorm":
            showThunderStormWeather(in: weatherView)
        case "Fog":
            showFogWeather(in: weatherView)
        case "Snow":
            showSnowWeather(in: weatherView)
        case "Cloudy":
            showCloudyWeather(in: weatherView)
        default:
            break
        }
        
        return weatherView
    }
    
    func showClearWeather(in view: UIView) {
        view.backgroundColor = .blue
        let sun = UIView()
        sun.backgroundColor = .yellow
        sun.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        sun.layer.cornerRadius = 50
        sun.center = view.center
        view.addSubview(sun)
        let rotation = CABasicAnimation(keyPath: "transform.rotation")
        rotation.fromValue = 0
        rotation.toValue = Double.pi * 2
        rotation.duration = 20
        rotation.repeatCount = .infinity
        sun.layer.add(rotation, forKey: "rotation")
    }
    
    func showRainWeather(in view: UIView) {
        view.backgroundColor = .gray
        for _ in 0..<100 {
            let drop = UIView()
            drop.backgroundColor = .blue
            drop.frame = CGRect(x: CGFloat.random(in: 0..<view.bounds.width), y: CGFloat.random(in: -100..<view.bounds.height), width: 2, height: 10)
            view.addSubview(drop)
            
            UIView.animate(withDuration: Double.random(in: 0.5...1.0), delay: 0, options: [.repeat, .curveLinear], animations: {
                drop.frame.origin.y = view.bounds.height
            }, completion: { _ in
                drop.frame.origin.y = CGFloat.random(in: -100..<0)
            })
        }
    }
    
    func showThunderStormWeather(in view: UIView) {
        view.backgroundColor = .darkGray
        let lightning = UIView()
        lightning.backgroundColor = .white
        lightning.frame = CGRect(x: view.bounds.width / 2 - 1, y: 0, width: 2, height: view.bounds.height)
        view.addSubview(lightning)
        
        UIView.animate(withDuration: 0.1, delay: Double.random(in: 1...3), options: [.repeat, .autoreverse], animations: {
            lightning.alpha = 0
        }, completion: nil)
    }
    
    func showFogWeather(in view: UIView) {
        view.backgroundColor = .lightGray
        let fogLayer = CAGradientLayer()
        fogLayer.frame = view.bounds
        fogLayer.colors = [UIColor.clear.cgColor, UIColor.white.withAlphaComponent(0.8).cgColor, UIColor.clear.cgColor]
        fogLayer.locations = [0.0, 0.5, 1.0]
        view.layer.addSublayer(fogLayer)
        
        let fogAnimation = CABasicAnimation(keyPath: "position")
        fogAnimation.fromValue = NSValue(cgPoint: CGPoint(x: view.bounds.width / 2, y: view.bounds.height))
        fogAnimation.toValue = NSValue(cgPoint: CGPoint(x: view.bounds.width / 2, y: 0))
        fogAnimation.duration = 5
        fogAnimation.repeatCount = .infinity
        fogLayer.add(fogAnimation, forKey: "position")
    }
    
    func showSnowWeather(in view: UIView) {
        view.backgroundColor = .gray
        for _ in 0..<100 {
            let flake = UIView()
            flake.backgroundColor = .white
            flake.frame = CGRect(x: CGFloat.random(in: 0..<view.bounds.width), y: CGFloat.random(in: -100..<view.bounds.height), width: 5, height: 5)
            flake.layer.cornerRadius = 2.5
            view.addSubview(flake)
            
            UIView.animate(withDuration: Double.random(in: 3...5), delay: 0, options: [.repeat, .curveLinear], animations: {
                flake.frame.origin.y = view.bounds.height
            }, completion: { _ in
                flake.frame.origin.y = CGFloat.random(in: -100..<0)
            })
        }
    }
    
    func showCloudyWeather(in view: UIView) {
        view.backgroundColor = .lightGray
        for _ in 0..<5 {
            let cloud = UIView()
            cloud.backgroundColor = .white
            cloud.frame = CGRect(x: CGFloat.random(in: -100..<view.bounds.width), y: CGFloat.random(in: 50..<view.bounds.height / 2), width: 200, height: 100)
            cloud.layer.cornerRadius = 50
            view.addSubview(cloud)
            
            UIView.animate(withDuration: Double.random(in: 10...20), delay: 0, options: [.repeat, .curveLinear], animations: {
                cloud.frame.origin.x = view.bounds.width / 2
            }, completion: { _ in
                cloud.frame.origin.x = CGFloat.random(in: -200..<0)
            })
        }
    }
}

