//
//  CustomButton.swift
//  iOS-HW10 Rustem Usserov
//
//  Created by Rustem on 24.02.2024.
//

import UIKit

class CustomButton: UIButton {

//Initialize button with properties
    init(title: String, hasBackground: Bool = false) {
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.clipsToBounds = false
        self.backgroundColor = hasBackground ? UIColor(red: 106/255, green: 116/255, blue: 207/255, alpha: 1) : .clear
        self.titleLabel?.font = UIFont(name: "Blinker-Regular", size: 15)
        self.layer.cornerRadius = hasBackground ? 20 : 0
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.3
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = 10
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
