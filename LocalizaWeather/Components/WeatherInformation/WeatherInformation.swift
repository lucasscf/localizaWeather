//
//  WeatherInformation.swift
//  LocalizaWeather
//
//  Created by Lucas Franco on 26/04/20.
//  Copyright © 2020 Lucas Franco. All rights reserved.
//

import Foundation
import UIKit

final class WeatherInformation: UIView {
    
    // MARK: - PROPERTIES
    
    var model: WeatherInformationViewModel {
        didSet {
            setupModelView()
        }
    }
    
    // MARK: - INITIALIZERS
    
    init(frame: CGRect, model: WeatherInformationViewModel) {
        self.model = model
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder, model: WeatherInformationViewModel) {
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
    
    private lazy var viewOrignDest: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .greenLocaliza
        view.layer.cornerRadius = 4
        view.heightAnchor.constraint(equalToConstant: 20).isActive = true
        view.widthAnchor.constraint(equalToConstant: 80).isActive = true
        return view
    }()
    
    private lazy var textOrignDest: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont.boldSystemFont(ofSize: 14.0)
        view.textColor = .gray000
        return view
    }()
    
    private lazy var viewImage: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .gray200
        view.layer.cornerRadius = 8
        view.heightAnchor.constraint(equalToConstant: 80).isActive = true
        view.widthAnchor.constraint(equalToConstant: 80).isActive = true
        return view
    }()
    
    private lazy var image: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 80).isActive = true
        view.widthAnchor.constraint(equalToConstant: 80).isActive = true
        return view
    }()
    
    private lazy var textTitle: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont.boldSystemFont(ofSize: 26.0)
        view.textColor = .gray000
        return view
    }()
    
    private lazy var textTemperature: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont.boldSystemFont(ofSize: 38.0)
        view.textColor = .greenLocaliza
        return view
    }()
    
    private lazy var textDescription: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont.boldSystemFont(ofSize: 16.0)
        view.textColor = .gray000
        return view
    }()
    
    private lazy var textFeelsLike: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont.boldSystemFont(ofSize: 12.0)
        view.textColor = .gray200
        return view
    }()
    
    private lazy var textPressure: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont.boldSystemFont(ofSize: 12.0)
        view.textColor = .gray200
        return view
    }()
    
    private lazy var textHumidity: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont.boldSystemFont(ofSize: 12.0)
        view.textColor = .gray200
        return view
    }()
    
    // MARK: - OPERATIONS
    
    func commonInit() {
        setupModelView()
        setupSubviews()
        setupConstraints()
    }
    
    func setupModelView() {
        
        image.image = model.getImage()?.image
        textOrignDest.text = model.getTextOrignDest()
        textTitle.text = model.getNameCountry()
        textTemperature.text = model.getTemperature()
        textDescription.text = model.getDescription()
        textFeelsLike.text = model.getFeelsLike()
        textPressure.text = model.getPressure()
        textHumidity.text = model.getHumidity()
    }
    
    func update(model: WeatherInformationViewModel) {
        self.model = model
    }
    
    func setDarkLightMode() {
        switch TemplateSession.current {
            case TemplateType.dark:
                view.backgroundColor = .bgcard
                textTitle.textColor = .gray000
                textDescription.textColor = .gray000
                textFeelsLike.textColor = .gray200
                textPressure.textColor = .gray200
                textHumidity.textColor = .gray200
                break
            case TemplateType.light:
                view.backgroundColor = .gray000
                textTitle.textColor = .bgcard
                textDescription.textColor = .bgcard
                textFeelsLike.textColor = .gray400
                textPressure.textColor = .gray400
                textHumidity.textColor = .gray400
                break
            default:
                break
        }
    }
    
    // MARK: - SETUP VIEW
    
    func setupSubviews() {
        addSubview(view)
        view.addSubview(viewImage)
        viewImage.addSubview(image)
        view.addSubview(viewOrignDest)
        viewOrignDest.addSubview(textOrignDest)
        view.addSubview(textTitle)
        view.addSubview(textTemperature)
        view.addSubview(textDescription)
        view.addSubview(textFeelsLike)
        view.addSubview(textPressure)
        view.addSubview(textHumidity)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            view.topAnchor.constraint(equalTo: self.topAnchor),
            view.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
        
        NSLayoutConstraint.activate([
            
            viewOrignDest.topAnchor.constraint(equalTo: view.topAnchor, constant: GlobalConstants.margin),
            viewOrignDest.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: GlobalConstants.margin),
            
            textOrignDest.centerYAnchor.constraint(equalTo: viewOrignDest.centerYAnchor),
            textOrignDest.centerXAnchor.constraint(equalTo: viewOrignDest.centerXAnchor),
            
            viewImage.topAnchor.constraint(equalTo: viewOrignDest.bottomAnchor, constant: 8),
            viewImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: GlobalConstants.margin),
            
            image.centerYAnchor.constraint(equalTo: viewImage.centerYAnchor),
            image.centerXAnchor.constraint(equalTo: viewImage.centerXAnchor),
            
            textTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: GlobalConstants.margin),
            textTitle.leadingAnchor.constraint(equalTo: viewImage.trailingAnchor, constant: GlobalConstants.margin),
            
            textTemperature.topAnchor.constraint(equalTo: textTitle.bottomAnchor),
            textTemperature.leadingAnchor.constraint(equalTo: viewImage.trailingAnchor, constant: GlobalConstants.margin),
            
            textDescription.topAnchor.constraint(equalTo: textTemperature.bottomAnchor),
            textDescription.leadingAnchor.constraint(equalTo: viewImage.trailingAnchor, constant: GlobalConstants.margin),
            
            textFeelsLike.topAnchor.constraint(equalTo: textTitle.bottomAnchor, constant: 8),
            textFeelsLike.leadingAnchor.constraint(equalTo: textTemperature.trailingAnchor, constant: 52),
            
            textPressure.topAnchor.constraint(equalTo: textFeelsLike.bottomAnchor, constant: 8),
            textPressure.leadingAnchor.constraint(equalTo: textTemperature.trailingAnchor, constant: 52),
            
            textHumidity.topAnchor.constraint(equalTo: textPressure.bottomAnchor, constant: 8),
            textHumidity.leadingAnchor.constraint(equalTo: textTemperature.trailingAnchor, constant: 52),
        ])
    }
}
