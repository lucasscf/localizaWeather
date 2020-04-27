//
//  ConfigFooter.swift
//  LocalizaWeather
//
//  Created by Lucas Franco on 23/04/20.
//  Copyright © 2020 Lucas Franco. All rights reserved.
//

import UIKit
import RxSwift

final class ConfigFooter: UIView {
    
    // MARK: - PROPERTIES
    
    private let selectedTemplateTypeVariable = Variable("TemplateType")
    
    var selectedTemplateType: Observable<String> {
        return selectedTemplateTypeVariable.asObservable()
    }
    
    var model: ConfigFooterViewModel {
        didSet {
            setupModelView()
        }
    }
    
    // MARK: - INITIALIZERS
    
    init(frame: CGRect, model: ConfigFooterViewModel) {
        self.model = model
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder, model: ConfigFooterViewModel) {
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
    
    private lazy var switchComponet: UISwitch = {
        let view = UISwitch()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addTarget(self, action: #selector(switchChanged), for: UIControl.Event.valueChanged)
        return view
    }()
    
    private lazy var label: UILabel = {
       let view = UILabel()
       view.translatesAutoresizingMaskIntoConstraints = false
       view.textColor = .gray000
       return view
   }()
    
    // MARK: - OPERATIONS
    
    func commonInit() {
        setupModelView()
        setupSubviews()
        setupConstraints()
    }
    
    func setupModelView() {
        label.text = model.getSwitchMode()
    }
    
    @objc func switchChanged(mySwitch: UISwitch) {
        if mySwitch.isOn {
            TemplateSession.current = TemplateType.light
            selectedTemplateTypeVariable.value = TemplateType.light.rawValue
            
            view.backgroundColor = .gray000
            label.textColor = .bgcard
            label.text = model.getSwitchMode()
        } else {
            TemplateSession.current = TemplateType.dark
            selectedTemplateTypeVariable.value = TemplateType.dark.rawValue
            
            view.backgroundColor = .bgcard
            label.textColor = .gray000
            label.text = model.getSwitchMode()
        }
    }
    
    // MARK: - SETUP VIEW
    
    func setupSubviews() {
        addSubview(view)
        view.addSubview(switchComponet)
        view.addSubview(label)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            view.topAnchor.constraint(equalTo: self.topAnchor),
            view.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            switchComponet.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: GlobalConstants.margin),
            
            switchComponet.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
}
