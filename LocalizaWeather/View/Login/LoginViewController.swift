//
//  ViewController.swift
//  LocalizaWeather
//
//  Created by Lucas Franco on 23/04/20.
//  Copyright © 2020 Lucas Franco. All rights reserved.
//

import UIKit
import RxSwift

class LoginViewController: UIViewController {
    
    // MARK: - PROPERTIES
    
    private(set) var loginViewModel: LoginViewModel = LoginViewModel()
    
    private(set) var logoHeaderViewModel: LogoHeaderViewModel = LogoHeaderViewModel()
    private(set) var loginCenterViewModel: LoginCenterViewModel = LoginCenterViewModel()
    private(set) var configFooterViewModel: ConfigFooterViewModel = ConfigFooterViewModel()
    
    // MARK: - LIFECYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setViewModels()
        setupView()
        setTemplate()
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
    
    private lazy var logiCenterCardView: LoginCenter = {
        let view = LoginCenter(frame: .zero, model: loginCenterViewModel)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setDelegate(delegate: self)
        return view
    }()
    
    private lazy var configFooterCardView: ConfigFooter = {
        let view = ConfigFooter(frame: .zero, model: configFooterViewModel)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 84).isActive = true
        
        // Subscribe reactive notification
        view.selectedTemplateType.subscribe(onNext: { [weak self] mode in
            self?.setTemplate()
        })
        return view
    }()
    
    // MARK: - SET VIEW MODELS
    
    func setViewModels() {
        setLogoHeaderViewModel()
        setLoginCenterViewModel()
        setConfigFooterViewModel()
    }
    
    func setLogoHeaderViewModel() {
        logoHeaderViewModel.setImageLogo(imageLogo: loginViewModel.getImageLogo())
    }
    
    func setLoginCenterViewModel() {
        loginCenterViewModel.setImagePhoto(imagePhoto: loginViewModel.getImagePhoto())
        loginCenterViewModel.setTextButton(textButton: loginViewModel.getTextButton())
        loginCenterViewModel.setPlaceholderName(placeholderName: loginViewModel.getPlaceholderName())
        loginCenterViewModel.setPlaceholderDestination(placeholderDestination: loginViewModel.getPlaceholderDestination())
    }
    
    func setConfigFooterViewModel() {
        configFooterViewModel.setSwitchMode(switchMode: loginViewModel.getSwitchMode())
    }
    
    // MARK: - SETUP
    
    func setupView() {
        self.view.backgroundColor = .bgsystem
        Appearance.applyNavigationBarDarkAppearance(self)
        self.navigationController?.navigationBar.topItem?.title = loginViewModel.getTitlePage()
        
        setupSubviews()
        setupConstraints()
    }
    
    func setupSubviews() {
        view.addSubview(scrollView)
        view.addSubview(configFooterCardView)
        scrollView.addSubview(contentView)
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(logoHeaderCardView)
        stackView.addArrangedSubview(logiCenterCardView)
        
    }
    
    func setupConstraints() {

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -GlobalConstants.margin),
            scrollView.bottomAnchor.constraint(equalTo: configFooterCardView.topAnchor, constant: -GlobalConstants.margin),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            configFooterCardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            configFooterCardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            configFooterCardView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -GlobalConstants.margin),
        ])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            logoHeaderCardView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            logoHeaderCardView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            
            logiCenterCardView.topAnchor.constraint(equalTo: logoHeaderCardView.bottomAnchor, constant: GlobalConstants.margin),
            logiCenterCardView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            logiCenterCardView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            logiCenterCardView.bottomAnchor.constraint(equalTo: stackView.bottomAnchor),
            
            contentView.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, constant: -116 )
        ])
    }
    
    // MARK: - TEMPLATE
    
    func setTemplate() {
        
        switch TemplateSession.current {
            case TemplateType.dark:
                self.view.backgroundColor = .bgsystem
                Appearance.applyNavigationBarDarkAppearance(self)
                configFooterViewModel.setSwitchMode(switchMode: NSLocalizedString("switchLightMode", comment: ""))
                break
            case TemplateType.light:
                self.view.backgroundColor = .gray150
                Appearance.applyNavigationBarLightAppearance(self)
                configFooterViewModel.setSwitchMode(switchMode: NSLocalizedString("switchDarkMode", comment: ""))
                break
            default:
                break
        }
        
        self.logoHeaderCardView.setDarkLightMode()
        self.logiCenterCardView.setDarkLightMode()
    }
}

extension LoginViewController : ButtonDelegate {
    
    // MARK: - ACTIONS
    
    func onClick() {
        
        if logiCenterCardView.isValid() {
            let storyboard = UIStoryboard(name: "Weather", bundle: Bundle.main)
            
            let viewController: WeatherViewController = storyboard.instantiateViewController(withIdentifier: "WeatherViewController") as! WeatherViewController
            self.navigationController?.pushViewController(viewController, animated: true)

        } else {
            AlertAction.showAlert(self, NSLocalizedString("titleMessageError", comment: ""), NSLocalizedString("messageErrorName", comment: ""), "OK")
        }
        
    }
}

