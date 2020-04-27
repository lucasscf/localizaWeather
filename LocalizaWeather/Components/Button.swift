//
//  Button.swift
//  LocalizaWeather
//
//  Created by Lucas Franco on 23/04/20.
//  Copyright © 2020 Lucas Franco. All rights reserved.
//

import Foundation
import UIKit

public protocol ButtonDelegate : class {
    func onClick()
}

class Button : UIButton {
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.setTitleColor(.gray000, for: .normal)
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 26.0)
        self.titleLabel?.textAlignment = .center
        self.backgroundColor = .greenLocaliza
        self.layer.cornerRadius = 8
        self.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
