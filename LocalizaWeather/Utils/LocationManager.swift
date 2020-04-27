//
//  LocationManager.swift
//  LocalizaWeather
//
//  Created by Lucas Franco on 23/04/20.
//  Copyright © 2020 Lucas Franco. All rights reserved.
//

import CoreLocation
import UIKit

public protocol LocationManagerInterface: class {
    func checkAuthorizationStatus(_ status: CLAuthorizationStatus)
    func getCurrentLocation() -> CLLocation?
    func getDistanceFrom() -> Double?
    func updateLocation()
    var delegate: LocationManagerDistanceDelegate? { get set }
    var unitLength: UnitLength { get set }
    var destination: CLLocation? { get set }
}

public protocol LocationManagerDistanceDelegate: class {
    func didDistanceUpdate(_ distance: Double?)
}

public class LocationManager: NSObject {
    var locationManager: CLLocationManager
    public var delegate: LocationManagerDistanceDelegate?
    public var destination: CLLocation?
    public var unitLength: UnitLength = .kilometers
    
    var updatedUserLocation: CLLocation?
    
    public override init() {
        locationManager = CLLocationManager()
        super.init()
        locationManager.delegate = self
    }
}

extension LocationManager: CLLocationManagerDelegate {
    public func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkAuthorizationStatus(status)
    }
}

extension LocationManager: LocationManagerInterface {
    public func checkAuthorizationStatus(_ status: CLAuthorizationStatus) {
        if !CLLocationManager.locationServicesEnabled() {
            return
        }
        
        switch status {
        case .notDetermined:
            locationManager.requestAlwaysAuthorization()
        case .authorizedAlways,
             .authorizedWhenInUse,
             .restricted:
            setupLocationConfiguration()
        default:
            break
        }
    }
    
    public func getDistanceFrom() -> Double? {
        guard let updatedUserLocation = self.updatedUserLocation,
            let destination = destination
        else {
            return nil
        }
        
        let distanceLocation = updatedUserLocation.distance(from: destination)
        return Measurement(value: distanceLocation, unit: unitLength).converted(to: unitLength).value
    }
    
    func setupLocationConfiguration() {
        locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.headingFilter = kCLHeadingFilterNone
        locationManager.pausesLocationUpdatesAutomatically = true
        locationManager.activityType = .automotiveNavigation
        
        if #available(iOS 11.0, *) {
            locationManager.showsBackgroundLocationIndicator = true
        }
        
        locationManager.startUpdatingLocation()
    }
    
    public func getCurrentLocation() -> CLLocation? {
        return locationManager.location
    }
    
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        updatedUserLocation = locations.last
        
        guard
            destination != nil,
            let distance = getDistanceFrom()
        else { return }
        delegate?.didDistanceUpdate(distance)
    }
    
    public func updateLocation() {
        setupLocationConfiguration()
    }
}

