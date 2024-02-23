//
//  CustomButton.swift
//  iOS-HW10 Rustem Usserov
//
//  Created by Rustem on 24.02.2024.
//

import UIKit

class CustomButton: UIButton {


    init(title: String, hasBackground: Bool = false) {
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true

        self.backgroundColor = hasBackground ? UIColor(red: 106/255, green: 116/255, blue: 207/255, alpha: 1) : .clear
        self.titleLabel?.font = UIFont(name: "Blinker-Regular", size: 15)
        self.layer.cornerRadius = hasBackground ? 27 : 0
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
