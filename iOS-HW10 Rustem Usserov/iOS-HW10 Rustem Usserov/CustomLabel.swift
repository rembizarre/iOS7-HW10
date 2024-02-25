//
//  CustomLabel.swift
//  iOS-HW10 Rustem Usserov
//
//  Created by Rustem on 24.02.2024.
//

import UIKit

class CustomLabel: UILabel {

    enum TittleType {
        case big, small

        var fontSize: CGFloat {
            switch self {
                case .big: return 24
                case .small: return 12
            }
        }

        var textColor: UIColor {
            switch self {
                case .big: return .white
                case .small: return .gray
            }
        }

        var fontType: UIFont {
            var fontName: String
            switch self {
                case .big: fontName = "Blinker-SemiBold"
                case .small: fontName = "Blinker-Regular"
            }
            return UIFont(name: fontName, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
        }
    }
    
    init(text: String, tittleType: TittleType) {
        super.init(frame: .zero)
        self.text = text
        self.textColor = tittleType.textColor
        self.font = tittleType.fontType
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

