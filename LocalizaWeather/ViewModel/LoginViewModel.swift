//
//  LoginViewModel.swift
//  LocalizaWeather
//
//  Created by Lucas Franco on 23/04/20.
//  Copyright © 2020 Lucas Franco. All rights reserved.
//

import Foundation
import UIKit

struct LoginViewModel {
    
    // MARK: - PROPERTIES
    
    private(set) var titlePage = ""
    private(set) var placeholderName = ""
    private(set) var placeholderDestination = ""
    private(set) var textButton = ""
    private(set) var switchMode = ""
    private(set) var imageLogo : UIImageView
    private(set) var imagePhoto : UIImageView
    
    // MARK: - INITIALIZERS
    
    init() {
        
        titlePage = NSLocalizedString("titlePage", comment: "")
        placeholderName = NSLocalizedString("placeholderName", comment: "")
        placeholderDestination = NSLocalizedString("placeholderDestination", comment: "")
        textButton = NSLocalizedString("textButton", comment: "")
        switchMode = NSLocalizedString("switchLightMode", comment: "")
        imageLogo = UIImageView(image: #imageLiteral(resourceName: "logo"))
        imagePhoto = UIImageView(image: #imageLiteral(resourceName: "photo"))
    }

    // MARK: - OPERATIONS
    
    func getTitlePage() -> String {
        return titlePage
    }
    
    func getPlaceholderName() -> String {
        return placeholderName
    }
    
    func getPlaceholderDestination() -> String {
        return placeholderDestination
    }
    
    func getTextButton() -> String {
        return textButton
    }
    
    func getSwitchMode() -> String {
        return switchMode
    }
    
    mutating func setSwitchMode(switchMode: String) {
        self.switchMode = switchMode
    }
    
    func getImageLogo() -> UIImageView {
        return imageLogo
    }
    
    func getImagePhoto() -> UIImageView {
        return imagePhoto
    }
}
