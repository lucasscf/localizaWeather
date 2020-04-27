//
//  LogiCenter.swift
//  LocalizaWeather
//
//  Created by Lucas Franco on 23/04/20.
//  Copyright © 2020 Lucas Franco. All rights reserved.
//

import Foundation
import UIKit

final class LoginCenter: UIView {
    
    // MARK: - PROPERTIES
    
    weak var buttonDelegate : ButtonDelegate?
    
    var model: LoginCenterViewModel {
        didSet {
            setupModelView()
        }
    }
    
    // MARK: - INITIALIZERS
    
    init(frame: CGRect, model: LoginCenterViewModel) {
        self.model = model
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder, model: LoginCenterViewModel) {
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
    
    private lazy var imagePhoto: UIImageView = {
        let view = ImagePhoto(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var textFieldName: UITextField = {
        let view = TextField(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var textFieldDestination: UITextField = {
        let view = TextField(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var button: UIButton = {
        let view = Button(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addTarget(self, action: #selector(click), for: .touchDown)
        return view
    }()
    
    // MARK: - OPERATIONS
    
    func commonInit() {
        setupModelView()
        setupSubviews()
        setupConstraints()
    }
    
    func setupModelView() {
        imagePhoto.image = model.getImagePhoto().image
        textFieldName.attributedPlaceholder = NSAttributedString(string: model.getPlaceholderName(), attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray300])
        textFieldDestination.attributedPlaceholder = NSAttributedString(string: model.getPlaceholderDestination(), attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray300])
        button.setTitle(model.getTextButton(), for: .normal)
    }
    
    func setDarkLightMode() {
        switch TemplateSession.current {
            case TemplateType.dark:
                view.backgroundColor = .bgcard
                textFieldName.textColor = .greenLocaliza
                textFieldName.backgroundColor = .gray400
                textFieldName.attributedPlaceholder = NSAttributedString(string: model.getPlaceholderName(), attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray300])
                textFieldDestination.textColor = .greenLocaliza
                textFieldDestination.backgroundColor = .gray400
                textFieldDestination.attributedPlaceholder = NSAttributedString(string: model.getPlaceholderDestination(), attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray300])
                break
            case TemplateType.light:
                view.backgroundColor = .gray000
                textFieldName.textColor = .gray400
                textFieldName.backgroundColor = .gray200
                textFieldName.attributedPlaceholder = NSAttributedString(string: model.getPlaceholderName(), attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray300])
                textFieldDestination.textColor = .gray400
                textFieldDestination.backgroundColor = .gray200
                textFieldDestination.attributedPlaceholder = NSAttributedString(string: model.getPlaceholderDestination(), attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray300])
                break
            default:
                break
        }
    }
    
    func setDelegate(delegate: ButtonDelegate) {
        buttonDelegate = delegate
    }
    
    func isValid() -> Bool {
        return textFieldName.text != "" ? true : false
    }
    
    @objc func click() {
        SharedSession.name = textFieldName.text!
        SharedSession.destination = textFieldDestination.text!
        self.buttonDelegate?.onClick()
    }
    
    // MARK: - SETUP VIEW
    
    func setupSubviews() {
        addSubview(view)
        view.addSubview(imagePhoto)
        view.addSubview(textFieldName)
        view.addSubview(textFieldDestination)
        view.addSubview(button)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            view.topAnchor.constraint(equalTo: self.topAnchor),
            view.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
        
        NSLayoutConstraint.activate([
            
            imagePhoto.topAnchor.constraint(equalTo: view.topAnchor, constant: GlobalConstants.margin),
            imagePhoto.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            textFieldName.topAnchor.constraint(equalTo: imagePhoto.bottomAnchor, constant: GlobalConstants.margin),
            textFieldName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: GlobalConstants.margin),
            textFieldName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -GlobalConstants.margin),
            
            textFieldDestination.topAnchor.constraint(equalTo: textFieldName.bottomAnchor, constant: GlobalConstants.margin),
            textFieldDestination.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: GlobalConstants.margin),
            textFieldDestination.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -GlobalConstants.margin),
            
            button.topAnchor.constraint(equalTo: textFieldDestination.bottomAnchor, constant: GlobalConstants.margin),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: GlobalConstants.margin),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -GlobalConstants.margin),
        ])
    }
}
