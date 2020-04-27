//
//  WeatherViewController.swift
//  LocalizaWeather
//
//  Created by Lucas Franco on 23/04/20.
//  Copyright © 2020 Lucas Franco. All rights reserved.
//

import UIKit
import RxSwift
import MapKit

class WeatherViewController: UIViewController {
    
    // MARK: - PROPERTIES
    
    private(set) var loginViewModel: LoginViewModel = LoginViewModel()
    private(set) var weatherOrignViewModel: WeatherViewModel?
    private(set) var weatherDestinViewModel: WeatherViewModel?
    
    private(set) var logoHeaderViewModel: LogoHeaderViewModel = LogoHeaderViewModel()
    private(set) var mapCenterViewModel: MapCenterViewModel = MapCenterViewModel()
    private(set) var weatherOrignInformationViewModel: WeatherInformationViewModel = WeatherInformationViewModel()
    private(set) var weatherDestinInformationViewModel: WeatherInformationViewModel = WeatherInformationViewModel()
    
    // MARK: - LIFECYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setViewModels()
        setupView()
        setTemplate()
        
        callAllNetworkAPI()
        
        // udate = 5 minutes
        var timer = Timer.scheduledTimer(timeInterval: 300, target: self, selector: #selector(updateLocation), userInfo: nil, repeats: true)
    }
    
    // MARK: - UI
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: .zero)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        stackView.alignment = .top
        stackView.axis = .vertical
        stackView.spacing = GlobalConstants.margin
        return stackView
    }()
    
    private lazy var logoHeaderCardView: LogoHeader = {
        let view = LogoHeader(frame: .zero, model: logoHeaderViewModel)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 84).isActive = true
        return view
    }()
    
    private lazy var nameDescription: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = .greenLocaliza
        view.font = UIFont.boldSystemFont(ofSize: 26.0)
        return view
    }()
    
    private lazy var mapCenterCardView: MapCenter = {
        let view = MapCenter(frame: .zero, model: mapCenterViewModel)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 250).isActive = true
        view.layer.cornerRadius = 8
        view.setDelegate(delegate: self)
        return view
    }()
    
    private lazy var weatherOrignInformationCardView: WeatherInformation = {
        let view = WeatherInformation(frame: .zero, model: weatherOrignInformationViewModel)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 140).isActive = true
        return view
    }()
    
    private lazy var weatherDestinInformationCardView: WeatherInformation = {
        let view = WeatherInformation(frame: .zero, model: weatherDestinInformationViewModel)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 140).isActive = true
        return view
    }()
    
    private lazy var button: UIButton = {
        let view = Button(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addTarget(self, action: #selector(click), for: .touchDown)
        return view
    }()
    
    // MARK: - SET VIEW MODELS
    
    func setViewModels() {
        setLogoHeaderViewModel()
        setWeatherInformationViewModel()
    }
    
    func setLogoHeaderViewModel() {
        logoHeaderViewModel.setImageLogo(imageLogo: loginViewModel.getImageLogo())
    }
    
    func setWeatherInformationViewModel() {
        
        if let weatherOrignViewModel = weatherOrignViewModel {
            
            weatherOrignInformationViewModel.setImage(image: weatherOrignViewModel.getImage())
            weatherOrignInformationViewModel.setTextOrignDest(textOrignDest: NSLocalizedString("textOrign", comment: ""))
            weatherOrignInformationViewModel.setNameCountry(nameCountry: weatherOrignViewModel.getNameCountry())
            weatherOrignInformationViewModel.setTemperature(temperature: weatherOrignViewModel.getTemperature())
            weatherOrignInformationViewModel.setDescription(description: weatherOrignViewModel.getDescription())
            weatherOrignInformationViewModel.setFeelsLike(feelsLike: weatherOrignViewModel.getFeelsLike())
            weatherOrignInformationViewModel.setHumidity(humidity: weatherOrignViewModel.getHumidity())
            weatherOrignInformationViewModel.setPressure(pressure: weatherOrignViewModel.getPressure())
            
            weatherOrignInformationCardView.update(model: weatherOrignInformationViewModel)
        }
        
        if let weatherDestinViewModel = weatherDestinViewModel {
            
            weatherDestinInformationViewModel.setImage(image: weatherDestinViewModel.getImage())
            weatherDestinInformationViewModel.setTextOrignDest(textOrignDest: NSLocalizedString("textDestin", comment: ""))
            weatherDestinInformationViewModel.setNameCountry(nameCountry: weatherDestinViewModel.getNameCountry())
            weatherDestinInformationViewModel.setTemperature(temperature: weatherDestinViewModel.getTemperature())
            weatherDestinInformationViewModel.setDescription(description: weatherDestinViewModel.getDescription())
            weatherDestinInformationViewModel.setFeelsLike(feelsLike: weatherDestinViewModel.getFeelsLike())
            weatherDestinInformationViewModel.setHumidity(humidity: weatherDestinViewModel.getHumidity())
            weatherDestinInformationViewModel.setPressure(pressure: weatherDestinViewModel.getPressure())
            
            weatherDestinInformationCardView.update(model: weatherDestinInformationViewModel)
        }
        
        mapCenterCardView.update(model: mapCenterViewModel)
    }
    
    // MARK: - SETUP
    
    func setupView() {
        self.navigationController?.navigationBar.topItem?.title = loginViewModel.getTitlePage()
        
        nameDescription.text = NSLocalizedString("salutation", comment: "") + ", " + SharedSession.name + "!"
        button.setTitle(NSLocalizedString("textButtonUpdate", comment: ""), for: .normal)
        
        setupSubviews()
        setupConstraints()
    }
    
    func setupSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(logoHeaderCardView)
        stackView.addArrangedSubview(nameDescription)
        stackView.addArrangedSubview(mapCenterCardView)
        stackView.addArrangedSubview(weatherOrignInformationCardView)
        stackView.addArrangedSubview(weatherDestinInformationCardView)
        stackView.addArrangedSubview(button)
    }
    
    func setupConstraints() {

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -GlobalConstants.margin),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -GlobalConstants.margin),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
        ])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            logoHeaderCardView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            logoHeaderCardView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            
            nameDescription.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            nameDescription.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            
            mapCenterCardView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            mapCenterCardView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            
            weatherOrignInformationCardView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            weatherOrignInformationCardView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            
            weatherDestinInformationCardView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            weatherDestinInformationCardView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            
            button.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            
        ])
    }
    
    // MARK: - TEMPLATE
    
    func setTemplate() {
        
        switch TemplateSession.current {
            case TemplateType.dark:
                self.view.backgroundColor = .bgsystem
                Appearance.applyNavigationBarDarkAppearance(self)
                if #available(iOS 13.0, *) {
                    self.overrideUserInterfaceStyle = .dark
                }
                break
            case TemplateType.light:
                self.view.backgroundColor = .gray150
                Appearance.applyNavigationBarLightAppearance(self)
                if #available(iOS 13.0, *) {
                    self.overrideUserInterfaceStyle = .light
                }
                break
            default:
                break
        }
        
        self.logoHeaderCardView.setDarkLightMode()
        self.weatherOrignInformationCardView.setDarkLightMode()
        self.weatherDestinInformationCardView.setDarkLightMode()
    }
    
    // MARK: - OPERATIONS
    
    @objc func updateLocation() {
        
        let location : LocationManagerInterface = Injector.get(LocationManagerInterface.self)!
        location.updateLocation()
        callAllNetworkAPI()
    }
    
    func callAllNetworkAPI() {
        
        // Starting Loading
        self.showLoading(onView: self, timeout: 5)
        
        callOrignNetworkAPI()
    }
    
    func callOrignNetworkAPI() {
        
        // Get LocationManager
        let location : LocationManagerInterface = Injector.get(LocationManagerInterface.self)!
        let currentLocation = location.getCurrentLocation()
        
        if let currentLocation = currentLocation {
            
            let latitude = String(format:"%f", currentLocation.coordinate.latitude as! CVarArg)
            let longitude = String(format:"%f", currentLocation.coordinate.longitude as! CVarArg)
            
            
            // Call Network API
            Network.requestOrign(lat: latitude, lon: longitude, completion: {
                result in self.returnCallOrignNetworkAPI(result: result)
            })
        }
    }
    
    func callDestinNetworkAPI() {
        
        let query = SharedSession.destination
            
        // Call Network API
        Network.requestDestin(q: query, completion: {
            result in self.returnCallDestinNetworkAPI(result: result)
        })
    }
    
    func returnCallOrignNetworkAPI(result: CurrentWeather?) {
        
        if let result = result {
            
            self.weatherOrignViewModel = WeatherViewModel.init(currentWeather: result)
            setImageResultIntoViewModel(result: result, weatherViewModel: self.weatherOrignViewModel!, completion: {
                
                self.mapCenterViewModel.setLatitudeOrign(latitudeOrign: (result.coord.lat))
                self.mapCenterViewModel.setLongitudeOrign(longitudeOrign: (result.coord.lon))
                self.mapCenterViewModel.setCityCoutryOrign(cityCoutryOrign: (self.weatherOrignViewModel?.getNameCountry())!)
                
                self.callDestinNetworkAPI()
            })
        } else {
            
            self.removeLoading()
        }
    }
    
    func returnCallDestinNetworkAPI(result: CurrentWeather?) {
        
        if let result = result {
            
            self.weatherDestinViewModel = WeatherViewModel.init(currentWeather: result)
            setImageResultIntoViewModel(result: result, weatherViewModel: self.weatherDestinViewModel!, completion: {
                
                self.mapCenterViewModel.setLatitudeDestin(latitudeDestin: (result.coord.lat))
                self.mapCenterViewModel.setLongitudeDestin(longitudeDestin: (result.coord.lon))
                self.mapCenterViewModel.setCityCoutryDestin(cityCoutryDestin: (self.weatherDestinViewModel?.getNameCountry())!)
                
                self.setViewModels()
                self.setupView()
                self.removeLoading()
            })
        } else {
            
            AlertAction.showAlert(self, NSLocalizedString("titleMessageError", comment: ""), NSLocalizedString("messageErrorDestination", comment: ""), "OK")
            
            self.setViewModels()
            self.setupView()
            self.removeLoading()
        }
    }
    
    func setImageResultIntoViewModel(result: CurrentWeather?, weatherViewModel: WeatherViewModel, completion: @escaping () -> Void) {
        
        let icon = result?.weather[0].icon
        if let icon = icon {
            let urlString = NetworkParams.urlImage.rawValue + icon + "@2x.png"
            let url = URL(string: urlString)!
            if url != nil {
                var imageView = UIImageView()
                imageView.kf.indicatorType = .activity
                imageView.kf.setImage(with: url, options: [.transition(.fade(0.2))])
                
                imageView.kf.setImage(with: url, placeholder: nil, options: nil, progressBlock: nil, completionHandler: { (image, error, cacheType, URL) in
                    weatherViewModel.setImage(image: imageView)
                    completion()
                })
            }
        }
    }
    
    @objc func click() {
        callAllNetworkAPI()
    }
}

extension WeatherViewController : MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = UIColor.greenLocaliza
        renderer.lineWidth = 4.0
        return renderer
    }
}
