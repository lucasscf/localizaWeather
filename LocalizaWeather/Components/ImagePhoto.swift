//
//  ImagePhoto.swift
//  LocalizaWeather
//
//  Created by Lucas Franco on 25/04/20.
//  Copyright © 2020 Lucas Franco. All rights reserved.
//

import Foundation
import UIKit

class ImagePhoto : UIImageView {
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.layer.borderWidth = 1
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.gray300.cgColor
        self.clipsToBounds = true
        self.layer.cornerRadius = 0.5 * self.widthAnchor.constraint(equalToConstant: 150).constant
        self.heightAnchor.constraint(equalToConstant: 150).isActive = true
        self.widthAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
