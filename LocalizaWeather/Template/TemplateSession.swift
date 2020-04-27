//
//  TemplateSession.swift
//  LocalizaWeather
//
//  Created by Lucas Franco on 23/04/20.
//  Copyright © 2020 Lucas Franco. All rights reserved.
//

import Foundation

public class TemplateSession {
    
    // MARK: - PROPERTIES
    
    private static var _current: TemplateType = .dark
    
    public static var current : TemplateType {
        set {
            TemplateSession._current = newValue
        }
        get {
            return TemplateSession._current
        }
    }
}
