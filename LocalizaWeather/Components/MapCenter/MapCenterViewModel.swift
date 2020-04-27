//
//  MapCenterViewModel.swift
//  LocalizaWeather
//
//  Created by Lucas Franco on 27/04/20.
//  Copyright © 2020 Lucas Franco. All rights reserved.
//

import Foundation
import UIKit

class MapCenterViewModel {
    
    // MARK: - PROPERTIES
    
    private(set) var cityCoutryOrign = ""
    private(set) var latitudeOrign = 0.0
    private(set) var longitudeOrign = 0.0
    private(set) var cityCoutryDestin = ""
    private(set) var latitudeDestin = 0.0
    private(set) var longitudeDestin = 0.0
    
    
    init() {
        
    }

    // MARK: - OPERATIONS
    
    func getCityCoutryOrign() -> String {
        return cityCoutryOrign
    }
    
    func setCityCoutryOrign(cityCoutryOrign: String) {
        self.cityCoutryOrign = cityCoutryOrign
    }
    
    func getLatitudeOrign() -> Double {
        return latitudeOrign
    }
    
    func setLatitudeOrign(latitudeOrign: Double) {
        self.latitudeOrign = latitudeOrign
    }
    
    func getLongitudeOrign() -> Double {
        return longitudeOrign
    }
    
    func setLongitudeOrign(longitudeOrign: Double) {
        self.longitudeOrign = longitudeOrign
    }
    
    func getCityCoutryDestin() -> String {
        return cityCoutryDestin
    }
    
    func setCityCoutryDestin(cityCoutryDestin: String) {
        self.cityCoutryDestin = cityCoutryDestin
    }
    
    func getLatitudeDestin() -> Double {
        return latitudeDestin
    }
    
    func setLatitudeDestin(latitudeDestin: Double) {
        self.latitudeDestin = latitudeDestin
    }
    
    func getLongitudeDestin() -> Double {
        return longitudeDestin
    }
    
    func setLongitudeDestin(longitudeDestin: Double) {
        self.longitudeDestin = longitudeDestin
    }
}
