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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func showWeather(type: String) {
        self.subviews.forEach { $0.removeFromSuperview() }
        self.layer.sublayers?.forEach { $0.removeFromSuperlayer() }
        
        switch type {
        case "Clear":
            showClearWeather()
        case "Rain":
            showRainWeather()
        case "Thunderstorm":
            showThunderStormWeather()
        case "Fog":
            showFogWeather()
        case "Snow":
            showSnowWeather()
        case "Cloudy":
            showCloudyWeather()
        default:
            break
        }
    }
    
    func showClearWeather() {
        self.backgroundColor = .blue
        let sun = UIView()
        sun.backgroundColor = .yellow
        sun.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        sun.layer.cornerRadius = 50
        sun.center = self.center
        self.addSubview(sun)
        let rotation = CABasicAnimation(keyPath: "transform.rotation")
        rotation.fromValue = 0
        rotation.toValue = Double.pi * 2
        rotation.duration = 20
        rotation.repeatCount = .infinity
        sun.layer.add(rotation, forKey: "rotation")
    }
    
    func showRainWeather() {
        self.backgroundColor = .gray
        for _ in 0..<100 {
            let drop = UIView()
            drop.backgroundColor = .blue
            drop.frame = CGRect(x: CGFloat.random(in: 0..<self.bounds.width), y: CGFloat.random(in: -100..<self.bounds.height), width: 2, height: 10)
            self.addSubview(drop)
            
            UIView.animate(withDuration: Double.random(in: 0.5...1.0), delay: 0, options: [.repeat, .curveLinear], animations: {
                drop.frame.origin.y = self.bounds.height
            }, completion: { _ in
                drop.frame.origin.y = CGFloat.random(in: -100..<0)
            })
        }
    }
    
    func showThunderStormWeather() {
        self.backgroundColor = .darkGray
        let lightning = UIView()
        lightning.backgroundColor = .white
        lightning.frame = CGRect(x: self.bounds.width / 2 - 1, y: 0, width: 2, height: self.bounds.height)
        self.addSubview(lightning)
        
        UIView.animate(withDuration: 0.1, delay: Double.random(in: 1...3), options: [.repeat, .autoreverse], animations: {
            lightning.alpha = 0
        }, completion: nil)
    }
    
    func showFogWeather() {
        self.backgroundColor = .lightGray
        let fogLayer = CAGradientLayer()
        fogLayer.frame = self.bounds
        fogLayer.colors = [UIColor.clear.cgColor, UIColor.white.withAlphaComponent(0.8).cgColor, UIColor.clear.cgColor]
        fogLayer.locations = [0.0, 0.5, 1.0]
        self.layer.addSublayer(fogLayer)
        
        let fogAnimation = CABasicAnimation(keyPath: "position")
        fogAnimation.fromValue = NSValue(cgPoint: CGPoint(x: self.bounds.width / 2, y: self.bounds.height))
        fogAnimation.toValue = NSValue(cgPoint: CGPoint(x: self.bounds.width / 2, y: 0))
        fogAnimation.duration = 5
        fogAnimation.repeatCount = .infinity
        fogLayer.add(fogAnimation, forKey: "position")
    }
    
    func showSnowWeather() {
        self.backgroundColor = .gray
        for _ in 0..<100 {
            let flake = UIView()
            flake.backgroundColor = .white
            flake.frame = CGRect(x: CGFloat.random(in: 0..<self.bounds.width), y: CGFloat.random(in: -100..<self.bounds.height), width: 5, height: 5)
            flake.layer.cornerRadius = 2.5
            self.addSubview(flake)
            
            UIView.animate(withDuration: Double.random(in: 3...5), delay: 0, options: [.repeat, .curveLinear], animations: {
                flake.frame.origin.y = self.bounds.height
            }, completion: { _ in
                flake.frame.origin.y = CGFloat.random(in: -100..<0)
            })
        }
    }
    
    func showCloudyWeather() {
        self.backgroundColor = .lightGray
        for _ in 0..<5 {
            let cloud = UIView()
            cloud.backgroundColor = .white
            cloud.frame = CGRect(x: CGFloat.random(in: -100..<self.bounds.width), y: CGFloat.random(in: 50..<self.bounds.height / 2), width: 200, height: 100)
            cloud.layer.cornerRadius = 50
            self.addSubview(cloud)
            
            UIView.animate(withDuration: Double.random(in: 10...20), delay: 0, options: [.repeat, .curveLinear], animations: {
                cloud.frame.origin.x = self.bounds.width / 2
            }, completion: { _ in
                cloud.frame.origin.x = CGFloat.random(in: -200..<0)
            })
        }
    }
}
