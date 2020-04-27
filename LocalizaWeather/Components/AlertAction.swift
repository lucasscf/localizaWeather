//
//  AlertAction.swift
//  LocalizaWeather
//
//  Created by Lucas Franco on 23/04/20.
//  Copyright © 2020 Lucas Franco. All rights reserved.
//

import UIKit

public class AlertAction {
    
    // MARK: - PROPERTIES
    
    private static var alert : UIAlertController?
    
    // MARK: - OPERATIONS
    
    public static func showAlert(_ context : UIViewController?, _ title : String, _ message : String) {
        showAlert(context, title, message, nil, nil)
    }
    
    public static func showAlert(_ context : UIViewController?, _ title : String, _ message : String, _ buttonText : String?) {
        showAlert(context, title, message, buttonText, nil)
    }
    
    public static func showAlert(_ context : UIViewController?, _ title : String, _ message : String, _ firstButtonText : String?, _ secondButtonText : String?) {
        
        // create the alert
        alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        // add the actions (buttons)
        if firstButtonText != nil {
            alert?.addAction(UIAlertAction(title: firstButtonText, style: UIAlertAction.Style.default, handler: nil))
            
            if secondButtonText != nil {
                alert?.addAction(UIAlertAction(title: secondButtonText, style: UIAlertAction.Style.cancel, handler: nil))
            }
        }
        
        let attributedTitle = NSAttributedString(string: title, attributes: [
            NSAttributedString.Key.foregroundColor : UIColor.white
        ])
        
        let attributedMessage = NSAttributedString(string: message, attributes: [
            NSAttributedString.Key.foregroundColor : UIColor.white
        ])
        
        // set colors
        alert?.view.tintColor = .white
        alert?.setValue(attributedTitle, forKey: "attributedTitle")
        alert?.setValue(attributedMessage, forKey: "attributedMessage")
        let subview = (alert?.view.subviews.first?.subviews.first?.subviews.first)
        subview?.backgroundColor = .black
        
        // show the alert
        context?.present(alert!, animated: true, completion: nil)
    }
}
