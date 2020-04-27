//
//  WeatherInformationViewModel.swift
//  LocalizaWeather
//
//  Created by Lucas Franco on 26/04/20.
//  Copyright © 2020 Lucas Franco. All rights reserved.
//

import Foundation
import UIKit

class WeatherInformationViewModel {
    
    // MARK: - PROPERTIES
    
    private(set) var image : UIImageView? = UIImageView(image: #imageLiteral(resourceName: "unknown"))
    private(set) var textOrignDest = ""
    private(set) var nameCountry = ""
    private(set) var temperature = "- -"
    private(set) var description = NSLocalizedString("textErrorDestination", comment: "")
    private(set) var feelsLike = ""
    private(set) var pressure = ""
    private(set) var humidity = ""
    
    init() {
        
    }

    // MARK: - OPERATIONS
    
    func getImage() -> UIImageView? {
        return image
    }
    
    func setImage(image: UIImageView) {
        self.image = image
    }
    
    func getTextOrignDest() -> String {
        return textOrignDest
    }
    
    func setTextOrignDest(textOrignDest: String) {
        self.textOrignDest = textOrignDest
    }
    
    func getNameCountry() -> String {
        return nameCountry
    }
    
    func setNameCountry(nameCountry: String) {
        self.nameCountry = nameCountry
    }
    
    func getTemperature() -> String {
        return temperature
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
        return feelsLike
    }
    
    func setFeelsLike(feelsLike: String) {
        self.feelsLike = feelsLike
    }
    
    func getPressure() -> String {
        return pressure
    }
    
    func setPressure(pressure: String) {
        self.pressure = pressure
    }
    
    func getHumidity() -> String {
        return humidity
    }
    
    func setHumidity(humidity: String) {
        self.humidity = humidity
    }
}
