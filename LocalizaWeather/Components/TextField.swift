//
//  TextField.swift
//  LocalizaWeather
//
//  Created by Lucas Franco on 23/04/20.
//  Copyright © 2020 Lucas Franco. All rights reserved.
//

import Foundation
import UIKit

class TextField : UITextField {
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.textColor = .greenLocaliza
        self.backgroundColor = .gray400
        self.font = UIFont.boldSystemFont(ofSize: 26.0)
        self.setLeftPaddingPoints(10)
        self.setRightPaddingPoints(10)
        self.layer.cornerRadius = 8
        self.textAlignment = .center
        self.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
