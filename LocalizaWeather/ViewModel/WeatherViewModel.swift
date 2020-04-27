//
//  WeatherViewModel.swift
//  LocalizaWeather
//
//  Created by Lucas Franco on 24/04/20.
//  Copyright © 2020 Lucas Franco. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class WeatherViewModel {
    
    // MARK: - PROPERTIES
    
    private(set) var image : UIImageView = UIImageView()
    private(set) var nameCountry = ""
    private(set) var temperature = ""
    private(set) var description = ""
    private(set) var feelsLike = ""
    private(set) var pressure = ""
    private(set) var humidity = ""
    
    // MARK: - INITIALIZERS
    
    public init(currentWeather: CurrentWeather) {
        
        nameCountry = currentWeather.name + ", " + currentWeather.sys.country
        description = currentWeather.weather[0].description
        
        if let value = currentWeather.main.temp as? Double {
            temperature = String(format: "%.0f", value)
        }
        
        if let value = currentWeather.main.feels_like as? Double {
            feelsLike = String(format: "%.0f", value)
        }
        
        if let value = currentWeather.main.pressure as? Int {
            pressure = String(value)
        }
        
        if let value = currentWeather.main.humidity as? Int {
            humidity = String(value)
        }
    }

    // MARK: - OPERATIONS
    
    func getImage() -> UIImageView {
        return image
    }
    
    func setImage(image: UIImageView) {
        self.image = image
    }
    
    func getNameCountry() -> String {
        return nameCountry
    }
    
    func setNameCountry(nameCountry: String) {
        self.nameCountry = nameCountry
    }
    
    func getTemperature() -> String {
        return temperature + "°C"
    }
    
    func setTemperature(temperature: String) {
        self.temperature = temperature
    }
    
    func getDescription() -> String {
        return description
    }
    
    func setDescription(description: String) {
        self.description = description
    }
    
    func getFeelsLike() -> String {
        return "Sensação: " + feelsLike + "°C"
    }
    
    func setFeelsLike(feelsLike: String) {
        self.feelsLike = feelsLike
    }
    
    func getPressure() -> String {
        return "Pressão: " + pressure + " hpa"
    }
    
    func setPressure(pressure: String) {
        self.pressure = pressure
    }
    
    func getHumidity() -> String {
        return "Umidade: " + humidity + " %"
    }
    
    func setHumidity(humidity: String) {
        self.humidity = humidity
    }
}
