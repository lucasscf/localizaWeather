//
//  ActivityIndicatorView.swift
//  LocalizaWeather
//
//  Created by Lucas Franco on 23/04/20.
//  Copyright © 2020 Lucas Franco. All rights reserved.
//

import Foundation
import UIKit

var viewLoading : UIView?
var beforeViewLoading : UIView?
var isRunLoading = false
var strLabel = UILabel()
var messageCallback : String?

extension UIViewController {
    
    // MARK: - OPERATIONS
    
    public func showLoading(onView : UIView) {
        
        beforeViewLoading = onView
        
        let loadingView = UIView.init(frame: onView.bounds)
        
        let eView = UIView()
        eView.frame = CGRect(x: view.frame.midX - 23, y: view.frame.midY - 23, width: 46, height: 46)
        eView.layer.cornerRadius = 10
        eView.layer.masksToBounds = true
        
        let activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 46, height: 46)
        activityIndicator.startAnimating()
        activityIndicator.color = .greenLocaliza
        
        DispatchQueue.main.async {
            let backgroundView = UIView.init(frame: onView.bounds)
            backgroundView.backgroundColor = .bgsystem
            backgroundView.alpha = 0.8
            loadingView.addSubview(backgroundView)
            
            eView.addSubview(activityIndicator)
            loadingView.addSubview(eView)
            
            beforeViewLoading!.addSubview(loadingView)
            beforeViewLoading!.isUserInteractionEnabled = false
            isRunLoading = true
        }
        
        viewLoading = loadingView
    }
    
    public func showLoading(onView : UIViewController, timeout : UInt32) {
        showLoading(onView: onView.view)
        DispatchQueue.global().async {
            sleep(timeout)
            onView.removeLoading()
        }
    }
    
    public func showLoading(onView : UIViewController, timeout : UInt32, completion: @escaping (_ message : String?) -> Void) {
        showLoading(onView: onView.view)
        DispatchQueue.global().async {
            sleep(timeout)
            DispatchQueue.main.async {
                completion(messageCallback)
            }
        }
    }
    
    public func removeLoading() {
        DispatchQueue.main.async {
            if beforeViewLoading != nil {
                beforeViewLoading!.isUserInteractionEnabled = true
                viewLoading?.removeFromSuperview()
                viewLoading = nil
                isRunLoading = false
            }
        }
    }
    
    public func updateMessageLoading(_ value : String) {
        strLabel.text = value
    }
    
    public func startMessageCallback(_ message : String?) {
        messageCallback = message
    }
    
    public func stopMessageCallback() {
        messageCallback = ""
    }
    
    public func isRunningLoading() -> Bool {
        return isRunLoading
    }
}

