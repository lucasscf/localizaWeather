//
//  LogoHeaderViewModel.swift
//  LocalizaWeather
//
//  Created by Lucas Franco on 24/04/20.
//  Copyright © 2020 Lucas Franco. All rights reserved.
//

import Foundation
import UIKit

struct LogoHeaderViewModel {
    
    // MARK: - PROPERTIES
    
    private(set) var imageLogo : UIImageView = UIImageView()
    
    init() {
        
    }

    // MARK: - OPERATIONS
    
    func getImageLogo() -> UIImageView {
        return imageLogo
    }
    
    mutating func setImageLogo(imageLogo: UIImageView) {
        self.imageLogo = imageLogo
    }
}
