//
//  CustomTextField.swift
//  iOS-HW10 Rustem Usserov
//
//  Created by Rustem on 23.02.2024.
//

import UIKit

class CustomTextField: UITextField {

    enum CustomTextFieldType {
        case email
        case password
    }

    private let authFieldType: CustomTextFieldType

    init(fieldType: CustomTextFieldType) {
        self.authFieldType = fieldType
        super.init(frame: .zero)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 27

        textColor = .label
        tintColor = .label
        font = UIFont(name: "Blinker-Regular", size: 15)
        backgroundColor = .tertiarySystemBackground
        adjustsFontSizeToFitWidth = false
        autocorrectionType = .no
        textAlignment = .left

        switch authFieldType {
            case .email:
                self.placeholder = "Email"
                self.keyboardType = .emailAddress
                self.textContentType = .emailAddress
            case .password:
                self.placeholder = "Password"
                self.textContentType = .oneTimeCode
                self.isSecureTextEntry = true
        }
    }
}

extension UITextField {
    func setLeftIcon(_ image: UIImage) {
        let iconView = UIImageView(frame: CGRect(x: 50, y: 5, width: 20, height: 20))
        iconView.image = image
        let iconContainerView: UIView = UIView(frame: CGRect(x: 20, y: 0, width: 100, height: 30))
        iconContainerView.addSubview(iconView)
        leftView = iconContainerView
        leftViewMode = .always
    }

    func setRightIcon(_ image: UIImage) {
        let iconView = UIImageView(frame: CGRect(x: 10, y: 5, width: 20, height: 20))
        iconView.image = image
        let iconContainerView: UIView = UIView(frame: CGRect(x: 20, y: 0, width: 50, height: 30))
        iconContainerView.addSubview(iconView)
        rightView = iconContainerView
        rightViewMode = .always
    }
}



