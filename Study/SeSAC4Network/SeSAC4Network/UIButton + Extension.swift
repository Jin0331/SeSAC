//
//  UIButton + Extension.swift
//  SeSAC4Network
//
//  Created by JinwooLee on 1/23/24.
//

import Foundation
import UIKit

extension UIButton.Configuration {
    
    static func sesacStyle() -> UIButton.Configuration {
        var config = UIButton.Configuration.gray()
        config.title = "여기가 버튼 타이틀이에요"
        config.subtitle = "이곳은 서브타이틀"
        config.titleAlignment = .trailing
        
        config.baseBackgroundColor = .systemGreen
        config.baseForegroundColor = .systemRed
        
        config.image = UIImage(systemName: "star.fill")
        config.imagePlacement = .trailing
        config.imagePadding = 8
        
        config.cornerStyle = .capsule
        
        return config
    }
}
