//
//  ForgotPasswordViewController.swift
//  Diamond
//
//  Created by Yash Thaker on 01/04/18.
//  Copyright © 2018 Yash Thaker. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.applyGradient(colors: [#colorLiteral(red: 0.262745098, green: 0.262745098, blue: 0.262745098, alpha: 1),#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)], type: .vertical)
        
        setupGlareView()
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
    }
    
    @objc func handleTap() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func setupGlareView() {
        let glareView = GlareView()
        self.view.addSubview(glareView)
        glareView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        glareView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        glareView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        glareView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
