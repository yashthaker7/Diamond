//
//  UIColor+Extesions.swift
//  Diamond
//
//  Created by Yash Thaker on 01/04/18.
//  Copyright © 2018 Yash Thaker. All rights reserved.
//

import UIKit

extension UIColor {
    
    static let themePink = #colorLiteral(red: 0.7843137255, green: 0.4274509804, blue: 0.8431372549, alpha: 0.7)
    static let themeBlue = #colorLiteral(red: 0.1882352941, green: 0.137254902, blue: 0.6823529412, alpha: 0.7)
    
    convenience public init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: a)
    }
    
    convenience public init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r, green: g, blue: b, alpha: 1)
    }
    
}
