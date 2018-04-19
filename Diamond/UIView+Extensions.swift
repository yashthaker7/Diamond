//
//  UIView+Extensions.swift
//  Diamond
//
//  Created by Yash Thaker on 01/04/18.
//  Copyright © 2018 Yash Thaker. All rights reserved.
//

import UIKit

extension UIView {
    
    enum gradientType {
        case vertical
        case horizontal
        case cross
    }
    
    func applyGradient(colors:[UIColor], type: gradientType) {
        var endPoint: CGPoint!
        switch (type) {
        case .horizontal:
            endPoint = CGPoint(x: 1, y: 0)
        case .vertical:
            endPoint = CGPoint(x: 0, y: 1)
        case .cross:
            endPoint = CGPoint(x: 1, y: 1)
        }
        self.layoutIfNeeded()
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.colors = colors.map{ $0.cgColor}
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = endPoint
        
        self.layer.addSublayer(gradientLayer)
    }
}
