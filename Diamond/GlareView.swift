//
//  GlareView.swift
//  Diamond
//
//  Created by Yash Thaker on 01/04/18.
//  Copyright © 2018 Yash Thaker. All rights reserved.
//

import UIKit

class GlareView: UIView {
    
    var glareImageView: UIImageView!
    var glareImageView2: UIImageView!
    var glareImageView3: UIImageView!
    
    let offset: CGFloat = 50

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        glareImageView = createImgView(image: #imageLiteral(resourceName: "glare"), alpha: 0.3)
        glareImageView2 = createImgView(image: #imageLiteral(resourceName: "layerMask"), alpha: 0.3)
        glareImageView3 = createImgView(image: #imageLiteral(resourceName: "layerMask2"), alpha: 0.3)
        
        self.addSubview(glareImageView)
        self.addSubview(glareImageView2)
        self.addSubview(glareImageView3)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        glareImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        glareImageView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        
        glareImageView2.bottomAnchor.constraint(equalTo: self.centerYAnchor, constant: -offset).isActive = true
        glareImageView2.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        
        glareImageView3.topAnchor.constraint(equalTo: self.centerYAnchor, constant: offset).isActive = true
        glareImageView3.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }

    func createImgView(image: UIImage, alpha: CGFloat) -> UIImageView {
        let imgView = UIImageView(image: image)
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.contentMode = .scaleAspectFit
        imgView.layer.masksToBounds = true
        imgView.alpha = alpha
        return imgView
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
