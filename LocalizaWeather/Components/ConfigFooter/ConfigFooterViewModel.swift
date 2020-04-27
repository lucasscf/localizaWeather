//
//  ConfigFooterViewModel.swift
//  LocalizaWeather
//
//  Created by Lucas Franco on 24/04/20.
//  Copyright © 2020 Lucas Franco. All rights reserved.
//

import Foundation

class ConfigFooterViewModel {
    
    // MARK: - PROPERTIES
    
    private(set) var switchMode = ""
    
    init() {
        
    }

    // MARK: - OPERATIONS
    
    func getSwitchMode() -> String {
        return switchMode
    }
    
    func setSwitchMode(switchMode: String) {
        self.switchMode = switchMode
    }
}
