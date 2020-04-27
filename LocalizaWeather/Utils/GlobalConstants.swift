//
//  GlobalConstants.swift
//  LocalizaWeather
//
//  Created by Lucas Franco on 23/04/20.
//  Copyright © 2020 Lucas Franco. All rights reserved.
//

import Foundation
import UIKit

public struct GlobalConstants {
    
    public static let margin_large : CGFloat = 32
    public static let margin : CGFloat = 16
    public static let margin_medium : CGFloat = 8
    public static let margin_little : CGFloat = 4
    public static let corner_radius : CGFloat = 8
    
    public static let isSmallScreen : Bool = (UIScreen.main.nativeBounds.height < 1137)
    public static let isBigScreen : Bool = (UIScreen.main.nativeBounds.height > 2208)
    public static let isIphone : Bool =  (UIDevice.current.userInterfaceIdiom == .phone)
    
}
