//
//  LoginCenterViewModel.swift
//  LocalizaWeather
//
//  Created by Lucas Franco on 25/04/20.
//  Copyright © 2020 Lucas Franco. All rights reserved.
//

import Foundation
import UIKit

struct LoginCenterViewModel {
    
    // MARK: - PROPERTIES
    
    private(set) var imagePhoto : UIImageView = UIImageView()
    private(set) var placeholderName = ""
    private(set) var placeholderDestination = ""
    private(set) var textButton = ""
    
    init() {
        
    }

    // MARK: - OPERATIONS
    
    func getImagePhoto() -> UIImageView {
        return imagePhoto
    }
    
    mutating func setImagePhoto(imagePhoto: UIImageView) {
        self.imagePhoto = imagePhoto
    }
    
    func getPlaceholderName() -> String {
        return placeholderName
    }
    
    mutating func setPlaceholderName(placeholderName: String) {
        self.placeholderName = placeholderName
    }
    
    func getPlaceholderDestination() -> String {
        return placeholderDestination
    }
    
    mutating func setPlaceholderDestination(placeholderDestination: String) {
        self.placeholderDestination = placeholderDestination
    }
    
    func getTextButton() -> String {
        return textButton
    }
    
    mutating func setTextButton(textButton: String) {
        self.textButton = textButton
    }
}
