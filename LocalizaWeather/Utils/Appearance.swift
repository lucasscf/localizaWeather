//
//  Appearance.swift
//  LocalizaWeather
//
//  Created by Lucas Franco on 23/04/20.
//  Copyright © 2020 Lucas Franco. All rights reserved.
//

import Foundation
import UIKit

public class Appearance {
    
    // MARK: - PROPERTIES
    
    private static var oldBarTintColor : UIColor?
    private static var oldTintColor : UIColor?
    private static var oldIsTranslucent : Bool?
    private static var currentContext : UIViewController?
    
    // MARK: - OPERATIONS
    
    public static func applyNavigationBarDarkAppearance(_ context : UIViewController) {
        Appearance.currentContext = context
        setNavigationBarDarkAppearance(true)
    }
    
    public static func applyNavigationBarLightAppearance(_ context : UIViewController) {
        Appearance.currentContext = context
        setNavigationBarLightAppearance(true)
    }
    
    public static func removeNavigationBarAppearance() {
        setNavigationBarDarkAppearance(false)
        setNavigationBarLightAppearance(false)
    }
    
    private static func checkOldAppearance() {
        if Appearance.oldBarTintColor == nil && Appearance.oldIsTranslucent == nil {
            Appearance.oldBarTintColor = self.currentContext?.navigationController?.navigationBar.barTintColor
            Appearance.oldTintColor = self.currentContext?.navigationController?.navigationBar.tintColor
            Appearance.oldIsTranslucent = self.currentContext?.navigationController?.navigationBar.isTranslucent
        }
    }
    
    private static func setNavigationBarDarkAppearance(_ setup : Bool) {
        
        checkOldAppearance()
        
        // Navigation Controller
        Appearance.currentContext?.navigationController?.setNavigationBarHidden(!setup, animated: false)
        Appearance.currentContext?.navigationController?.navigationBar.isTranslucent = !setup
        Appearance.currentContext?.navigationController?.navigationBar.barTintColor = setup ? .bgsystem : Appearance.oldBarTintColor
        Appearance.currentContext?.navigationController?.navigationBar.tintColor = UIColor.greenLocaliza
        Appearance.currentContext?.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.greenLocaliza]
        
        Appearance.currentContext?.navigationController?.navigationBar.barStyle = .black
    }
    
    private static func setNavigationBarLightAppearance(_ setup : Bool) {
        
        checkOldAppearance()
        
        // Navigation Controller
        Appearance.currentContext?.navigationController?.setNavigationBarHidden(!setup, animated: false)
        Appearance.currentContext?.navigationController?.navigationBar.isTranslucent = !setup
        Appearance.currentContext?.navigationController?.navigationBar.barTintColor = setup ? .gray150 : Appearance.oldBarTintColor
        Appearance.currentContext?.navigationController?.navigationBar.tintColor = UIColor.bgsystem
        Appearance.currentContext?.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.bgsystem]
        
        Appearance.currentContext?.navigationController?.navigationBar.barStyle = .default
    }
}
