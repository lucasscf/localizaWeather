//
//  MapCenter.swift
//  LocalizaWeather
//
//  Created by Lucas Franco on 27/04/20.
//  Copyright © 2020 Lucas Franco. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class CustomPin: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(pinTitle:String, pinSubTitle:String, location:CLLocationCoordinate2D) {
        self.title = pinTitle
        self.subtitle = pinSubTitle
        self.coordinate = location
    }
}

final class MapCenter: UIView, MKMapViewDelegate {
    
    // MARK: - PROPERTIES
    
    weak var mkMapViewDelegate : MKMapViewDelegate?
    
    var model: MapCenterViewModel {
        didSet {
            setupMapModelView()
        }
    }
    
    // MARK: - INITIALIZERS
    
    init(frame: CGRect, model: MapCenterViewModel) {
        self.model = model
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder, model: MapCenterViewModel) {
        self.model = model
        super.init(coder: aDecoder)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - UI
    
    private lazy var view: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .bgcard
        view.layer.cornerRadius = 8
        return view
    }()
    
    private lazy var mkMapView: MKMapView = {
        let view = MKMapView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.mapType = MKMapType.standard
        view.isZoomEnabled = true
        view.isScrollEnabled = true
        view.layer.cornerRadius = 8
        return view
    }()
    
    // MARK: - OPERATIONS
    
    func commonInit() {
        setupMapModelView()
        setupSubviews()
        setupConstraints()
    }
    
    func setupMapModelView() {
        
        let sourceLocation = CLLocationCoordinate2D(latitude:model.getLatitudeOrign() , longitude: model.getLongitudeOrign())
        let destinationLocation = CLLocationCoordinate2D(latitude:model.getLatitudeDestin() , longitude: model.getLongitudeDestin())
        
        print(model.getLatitudeDestin())
        print(model.getLongitudeDestin())
        
        let sourcePin = CustomPin(pinTitle: model.getCityCoutryOrign(), pinSubTitle: "", location: sourceLocation)
        let destinationPin = CustomPin(pinTitle: model.getCityCoutryDestin(), pinSubTitle: "", location: destinationLocation)
        
        print(model.getCityCoutryDestin())
        
        mkMapView.addAnnotation(sourcePin)
        mkMapView.addAnnotation(destinationPin)
            
        let sourcePlaceMark = MKPlacemark(coordinate: sourceLocation)
        let destinationPlaceMark = MKPlacemark(coordinate: destinationLocation)
        
        let directionRequest = MKDirections.Request()
        directionRequest.source = MKMapItem(placemark: sourcePlaceMark)
        directionRequest.destination = MKMapItem(placemark: destinationPlaceMark)
        directionRequest.transportType = .automobile
        
        let directions = MKDirections(request: directionRequest)
        directions.calculate { (response, error) in
            guard let directionResonse = response else {
                if let error = error {
                    print("we have error getting directions==\(error.localizedDescription)")
                }
                return
            }
            
            let route = directionResonse.routes[0]
            self.mkMapView.addOverlay(route.polyline, level: .aboveRoads)
            
            let rect = route.polyline.boundingMapRect
            self.mkMapView.setRegion(MKCoordinateRegion(rect), animated: true)
            
        }
        
        self.mkMapView.delegate = mkMapViewDelegate
    }
    
    func update(model: MapCenterViewModel) {
        self.model = model
    }
    
    func setDelegate(delegate: MKMapViewDelegate) {
        mkMapViewDelegate = delegate
    }
    
    func setDarkLightMode() {
        switch TemplateSession.current {
            case TemplateType.dark:
                view.backgroundColor = .bgcard
                break
            case TemplateType.light:
                view.backgroundColor = .gray000
                break
            default:
                break
        }
    }
    
    // MARK: - SETUP VIEW
    
    func setupSubviews() {
        addSubview(view)
        view.addSubview(mkMapView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            view.topAnchor.constraint(equalTo: self.topAnchor),
            view.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
        
        NSLayoutConstraint.activate([
            
            mkMapView.topAnchor.constraint(equalTo: view.topAnchor),
            mkMapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mkMapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mkMapView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}
