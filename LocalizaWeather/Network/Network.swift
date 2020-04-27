//
//  Network.swift
//  LocalizaWeather
//
//  Created by Lucas Franco on 23/04/20.
//  Copyright © 2020 Lucas Franco. All rights reserved.
//

import Foundation
import Alamofire

class Network {
    
    public static func requestOrign(lat: String, lon: String, completion: @escaping (CurrentWeather?) -> Void) {
        
        var parameters: [String: String] = [:]
        
        parameters["lat"] = lat
        parameters["lon"] = lon
        parameters["units"] = NetworkParams.units.rawValue
        parameters["lang"] = NetworkParams.lang.rawValue
        parameters["appid"] = NetworkParams.apiKey.rawValue
        
        var currentWeather : CurrentWeather?
        
        AF.request(NetworkParams.url.rawValue, parameters: parameters)
            .validate()
            .responseDecodable(of: CurrentWeather.self) { response in
                
                if let weather = response.value {
                    currentWeather = weather
                    completion(currentWeather)
                } else {
                    completion(nil)
                }
            }
    }
    
    public static func requestDestin(q: String, completion: @escaping (CurrentWeather?) -> Void) {
        
        var parameters: [String: String] = [:]
        
        parameters["q"] = q
        parameters["units"] = NetworkParams.units.rawValue
        parameters["lang"] = NetworkParams.lang.rawValue
        parameters["appid"] = NetworkParams.apiKey.rawValue
        
        var currentWeather : CurrentWeather?
        
        AF.request(NetworkParams.url.rawValue, parameters: parameters)
            .validate()
            .responseDecodable(of: CurrentWeather.self) { response in
                
                if let weather = response.value {
                    currentWeather = weather
                    completion(currentWeather)
                } else {
                    completion(nil)
                }
            }
    }
}
