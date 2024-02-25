//
//  CustomSocialButton.swift
//  iOS-HW10 Rustem Usserov
//
//  Created by Rustem on 25.02.2024.
//

import UIKit

enum SocialButtonType {
    case facebook, twitter

    var backgroundColor: UIColor {
        switch self {
            case .facebook: return UIColor(red: 52/255, green: 156/255, blue: 239/255, alpha: 1)
            case .twitter: return UIColor(red: 80/255, green: 115/255, blue: 181/255, alpha: 1)
        }
    }
        var imageName: String {
            switch self {
                case .facebook: return "fblogo"
                case .twitter: return "xlogo"
            }
        }

        var title: String {
            switch self {
                case .facebook: return "Facebook"
                case .twitter: return "Twitter"
            }
        }
        
        var imagePadding: CGFloat {
            switch self {
                case .facebook: return 15
                case .twitter: return 20
            }
        }
    var contentInsents: NSDirectionalEdgeInsets {
        switch self {
            case .facebook: return NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10)
            case .twitter: return NSDirectionalEdgeInsets(top: 0, leading: -25, bottom: 0, trailing: 10)
        }
    }
}

class CustomSocialButton: UIView {

    internal var button: UIButton!
    private var shadowLayer: CALayer!

    init(type: SocialButtonType, frame: CGRect = .zero) {
        super.init(frame: frame)
        // Initialize button with properties
        button = UIButton()
        configureButton(type: type)
        // Setup shadow on the container view
        setupShadow()
        //Add button on view
        addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 17
        button.clipsToBounds = true

    }

    private func configureButton(type: SocialButtonType) {
        let image = UIImage(named: type.imageName) ?? UIImage()
        var buttonConfig = UIButton.Configuration.filled()
        buttonConfig.baseForegroundColor = .white
        buttonConfig.baseBackgroundColor = type.backgroundColor
        buttonConfig.image = image
        buttonConfig.imagePadding = type.imagePadding
        buttonConfig.contentInsets = type.contentInsents
        buttonConfig.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var outgoing = incoming
            outgoing.font = UIFont(name: "Blikner-Regular", size: 14)
            return outgoing
        }
        button.configuration = buttonConfig
        button.setTitle(type.title, for: .normal)

    }

    private func setupShadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.3
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = 10
        self.layer.masksToBounds = false
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
