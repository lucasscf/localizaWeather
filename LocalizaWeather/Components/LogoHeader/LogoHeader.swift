//
//  MenuHeader.swift
//  LocalizaWeather
//
//  Created by Lucas Franco on 23/04/20.
//  Copyright © 2020 Lucas Franco. All rights reserved.
//

import UIKit

final class LogoHeader: UIView {
    
    // MARK: - PROPERTIES
    
    var model: LogoHeaderViewModel {
        didSet {
            setupModelView()
        }
    }
    
    // MARK: - INITIALIZERS
    
    init(frame: CGRect, model: LogoHeaderViewModel) {
        self.model = model
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder, model: LogoHeaderViewModel) {
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
    
    private lazy var imgViewHeader: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .bgcard
        view.layer.cornerRadius = 8
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        return view
    }()
    
    // MARK: - OPERATIONS
    
    func commonInit() {
        setupModelView()
        setupSubviews()
        setupConstraints()
    }

    func setupModelView() {
        imgViewHeader.image = model.getImageLogo().image
    }
    
    func setDarkLightMode() {
        switch TemplateSession.current {
            case TemplateType.dark:
                view.backgroundColor = .bgcard
                imgViewHeader.backgroundColor = .bgcard
                break
            case TemplateType.light:
                view.backgroundColor = .gray000
                imgViewHeader.backgroundColor = .gray000
                break
            default:
                break
        }
    }
    
    // MARK: - SETUP VIEW
    
    func setupSubviews() {
        addSubview(view)
        view.addSubview(imgViewHeader)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            view.topAnchor.constraint(equalTo: self.topAnchor),
            view.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            imgViewHeader.topAnchor.constraint(equalTo: view.topAnchor, constant: GlobalConstants.margin),
            imgViewHeader.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imgViewHeader.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            imgViewHeader.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -GlobalConstants.margin)
        ])
    }
}
