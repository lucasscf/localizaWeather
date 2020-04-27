//
//  SharedSession.swift
//  LocalizaWeather
//
//  Created by Lucas Franco on 26/04/20.
//  Copyright © 2020 Lucas Franco. All rights reserved.
//

import Foundation

public class SharedSession {
    
    // MARK: - PROPERTIES
    
    private static var _name: String = ""
    
    public static var name : String {
        set {
            SharedSession._name = newValue
        }
        get {
            return SharedSession._name
        }
    }
    
    private static var _destination: String = ""
    
    public static var destination : String {
        set {
            SharedSession._destination = newValue
        }
        get {
            return SharedSession._destination
        }
    }
}
