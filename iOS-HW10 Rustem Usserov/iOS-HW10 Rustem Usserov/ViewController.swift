//
//  ViewController.swift
//  iOS-HW10 Rustem Usserov
//
//  Created by Rustem on 22.02.2024.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    //MARK: - UIElements
    private let backgroundImage: UIImageView = {
        let backgroundImage = UIImageView()
        backgroundImage.image = UIImage(named: "background")
        backgroundImage.contentMode = .scaleAspectFill
        return backgroundImage
    }()

    private let secondBackgroundImage: UIImageView = {
        let secondBackground = UIImageView()
        secondBackground.image = UIImage(named: "background2")
        secondBackground.contentMode = .scaleAspectFill
        return secondBackground
    }()

    private let loginLabel: UILabel = {
        let loginLabel = UILabel()
        loginLabel.text = "Login"
        loginLabel.textColor = .white
        loginLabel.font = UIFont(name: "Blinker-SemiBold", size: 24)
        return loginLabel
    }()

    private let loginButton = CustomButton(title: "Login", hasBackground: true)
    private let forgotPassword = CustomButton(title: "Forgot your password?", hasBackground: false)

    private let emailField = CustomTextField(fieldType: .email)
    private let passwordField = CustomTextField(fieldType: .password)

    private let signUpButton: UIButton = {
        let signUpButton = UIButton()
        signUpButton.setTitle("Sign up", for: .normal)
        signUpButton.setTitleColor(UIColor(red: 106/255, green: 116/255, blue: 207/255, alpha: 1), for: .normal)
        signUpButton.titleLabel?.font = UIFont(name: "Blinker-Regular", size: 15)
        return signUpButton
    }()
    
    private let dontHaveAccountLabel: UILabel = {
        let dontHaveAccount = UILabel()
        dontHaveAccount.text = "Don't have account?"
        dontHaveAccount.textColor = UIColor(red: 122/255, green: 122/255, blue: 122/255, alpha: 1)
        dontHaveAccount.font = UIFont(name: "Blinker-SemiBold", size: 15)
        return dontHaveAccount
    }()

    private let facebookButton: UIButton = {
        var buttonConfig = UIButton.Configuration.filled()
        buttonConfig.baseForegroundColor = .white
        buttonConfig.baseBackgroundColor = UIColor(red: 52/255, green: 156/255, blue: 239/255, alpha: 1)
        buttonConfig.image = UIImage(named: "fblogo")
        buttonConfig.imagePadding = 10
        buttonConfig.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer{ incoming in
            var outgoing = incoming
            outgoing.font = UIFont(name: "Blinker-Regular", size: 14)
            return outgoing
        }

        let facebookButton = UIButton(configuration: buttonConfig, primaryAction: nil)
        facebookButton.setTitle("Facebook", for: .normal)

        facebookButton.layer.cornerRadius = 17
        facebookButton.clipsToBounds = true
        return facebookButton
    }()

    private let twitterButton: UIButton = {
        var buttonConfig = UIButton.Configuration.filled()
        buttonConfig.baseForegroundColor = .white
        buttonConfig.baseBackgroundColor = UIColor(red: 80/255, green: 115/255, blue: 181/255, alpha: 1)
        buttonConfig.image = UIImage(named: "xlogo")
        buttonConfig.imagePadding = 10
        buttonConfig.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer{ incoming in
            var outgoing = incoming
            outgoing.font = UIFont(name: "Blinker-Regular", size: 14)
            return outgoing
        }

        let twitterButton = UIButton(configuration: buttonConfig, primaryAction: nil)
        twitterButton.setTitle("Twitter", for: .normal)

        twitterButton.layer.cornerRadius = 17
        twitterButton.clipsToBounds = true
        return twitterButton
    }()
//MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        setupConstraints()
        setupEmailField()
        setupPasswordField()
    }
//MARK: - Setup Views
    private func setupViews() {
        view.addSubview(loginLabel)
        view.addSubview(emailField)
        view.addSubview(passwordField)
        view.addSubview(loginButton)
        view.addSubview(backgroundImage)
        view.sendSubviewToBack(backgroundImage)
        view.addSubview(secondBackgroundImage)
        view.sendSubviewToBack(secondBackgroundImage)
        view.addSubview(forgotPassword)
        view.addSubview(signUpButton)
        view.addSubview(dontHaveAccountLabel)
        view.addSubview(facebookButton)
        view.addSubview(twitterButton)
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        dontHaveAccountLabel.translatesAutoresizingMaskIntoConstraints = false
        facebookButton.translatesAutoresizingMaskIntoConstraints = false
        twitterButton.translatesAutoresizingMaskIntoConstraints = false
    }
//MARK: - Setup Constraints
    private func setupConstraints() {
        backgroundImage.snp.makeConstraints { make in
            make.height.equalToSuperview().multipliedBy(0.65)
        }

        secondBackgroundImage.snp.makeConstraints { make in
            make.bottom.equalTo(backgroundImage.snp.bottom).offset(-8)
            make.width.equalToSuperview()
        }
        loginLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(130)
        }

        emailField.snp.makeConstraints { make in
            make.centerX.equalTo(loginLabel)
            make.top.equalTo(loginLabel.snp.bottom).offset(40)
            make.width.equalToSuperview().multipliedBy(0.70)
            make.height.equalTo(55)
        }

        passwordField.snp.makeConstraints { make in
            make.centerX.equalTo(emailField)
            make.top.equalTo(emailField.snp.bottom).offset(20)
            make.width.equalTo(emailField.snp.width)
            make.height.equalTo(55)
        }

        loginButton.snp.makeConstraints { make in
            make.centerX.equalTo(passwordField)
            make.top.equalTo(passwordField.snp.bottom).offset(40)
            make.width.equalTo(emailField.snp.width)
            make.height.equalTo(50)
        }

        forgotPassword.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(20)
            make.centerX.equalTo(loginButton)
        }

        dontHaveAccountLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(100)
            make.bottom.equalToSuperview().offset(-70)
        }

        signUpButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-64)
            make.leading.equalTo(dontHaveAccountLabel.snp.trailing).offset(10)
        }

        facebookButton.snp.makeConstraints { make in
            make.bottom.equalTo(dontHaveAccountLabel.snp.top).offset(-40)
            make.leading.equalToSuperview().offset(30)
            make.height.equalTo(37)
        }

        twitterButton.snp.makeConstraints { make in
            make.bottom.equalTo(facebookButton.snp.bottom)
            make.leading.equalTo(facebookButton.snp.trailing).offset(20)
            make.trailing.equalToSuperview().offset(-30)
            make.width.equalTo(facebookButton.snp.width)
            make.height.equalTo(facebookButton.snp.height)
        }
    }

    private func setupEmailField() {
        if let emailIcon = UIImage(named: "person") {
            emailField.setLeftIcon(emailIcon)
        }
        if let checkIcon = UIImage(named: "check") {
            emailField.setRightIcon(checkIcon)
        }
    }

    private func setupPasswordField() {
        if let lockIcon = UIImage(named: "lock") {
            passwordField.setLeftIcon(lockIcon)
        }
    }
}

