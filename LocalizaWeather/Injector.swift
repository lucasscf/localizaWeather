//
//  Injector.swift
//  LocalizaWeather
//
//  Created by Lucas Franco on 23/04/20.
//  Copyright © 2020 Lucas Franco. All rights reserved.
//

import Foundation

public class Injector {
    
    public enum Instance {
        case SINGLETON, TRANSIENT
    }
    
    // MARK: - PROPERTIES
    
    /// Modules mapping
    private static var modulesMapping = [AnyHashable : AnyObject]()
    
    /// Singleton mapping
    private static var singletonModules = [AnyHashable : AnyObject]()
    
    // MARK: - OPERATIONS
    
    public static func bind(_ module: Any, _ moduleImpl: AnyClass, _ instance: Instance) {
        if (Instance.SINGLETON == instance) {
            bind(module, newInstance(moduleImpl)!)
        }
        else {
            if (modulesMapping[getModuleName(module)] == nil) {
                modulesMapping[getModuleName(module)] = moduleImpl
            }
        }
    }
    
    public static func bind(_ module: Any, _ moduleImpl: String, _ instance: Instance) {
        if (Instance.SINGLETON == instance) {
            bind(module, newInstance(moduleImpl))
        }
        else {
            if (modulesMapping[getModuleName(module)] == nil) {
                modulesMapping[getModuleName(module)] = moduleImpl as AnyObject
            }
        }
    }
    
    public static func bind(_ module: AnyObject, _ moduleImpl: AnyClass, _ instance: Instance) {
        if (Instance.SINGLETON == instance) {
            if (singletonModules[getModuleName(module)] == nil) {
                singletonModules[getModuleName(module)] = newInstance(moduleImpl)
            }
        }
        else {
            if (modulesMapping[getModuleName(module)] == nil) {
                modulesMapping[getModuleName(module)] = moduleImpl
            }
        }
    }
    
    public static func bind(_ module: Any, _ moduleInstance: AnyObject?) {
        if (singletonModules[getModuleName(module)] == nil) {
            singletonModules[getModuleName(module)] = moduleInstance
        }
    }
    
    public static func get<T>(_ module: Any) -> T? {
        let moduleName: String = getModuleName(module)
        var instance : T? = nil
        
        if (singletonModules[getModuleName(module)] != nil) {
            instance = singletonModules[moduleName] as? T
        } else if (modulesMapping[getModuleName(module)] != nil) {
            if let anyClass = modulesMapping[moduleName] as? AnyClass {
                instance = newInstance(anyClass) as? T
            } else if let anyString = modulesMapping[moduleName] as? String {
                instance = newInstance(anyString) as? T
            }
        }
        
        return instance
    }
    
    private static func getModuleName(_ module: Any) -> String {
        return String(reflecting: module)
    }

    private static func newInstance(_ module: AnyClass) -> NSObject? {
        let className: String = getModuleName(module)
        let cellClass: AnyClass! = NSClassFromString(className)
        let objectType : NSObject.Type! = cellClass as! NSObject.Type?
        let theObject: NSObject? = objectType.init() as NSObject
        
        return theObject
    }
    
    private static func newInstance(_ module: String) -> NSObject? {
        let className: String = module
        let cellClass: AnyClass! = NSClassFromString(className)
        let objectType : NSObject.Type! = cellClass as! NSObject.Type?
        var theObject: NSObject? = nil
        if objectType != nil {
            theObject = objectType.init() as NSObject
        }
        
        return theObject
    }
}

