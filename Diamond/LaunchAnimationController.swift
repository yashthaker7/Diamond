//
//  LaunchAnimationController.swift
//  Diamond
//
//  Created by Yash Thaker on 01/04/18.
//  Copyright © 2018 Yash Thaker. All rights reserved.
//

import UIKit

class LaunchAnimationController: UIViewController {
    
    let logoImageView: UIImageView = {
        let imgView = UIImageView(image: #imageLiteral(resourceName: "Logo"))
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.contentMode = .scaleAspectFit
        imgView.layer.masksToBounds = true
        return imgView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.applyGradient(colors: [.themePink, .themeBlue], type: .cross)
        
        setupGlareView()
        
        self.view.addSubview(logoImageView)
        
        logoImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        logoImageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.animateView()
        }
        
    }
    
    func animateView() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            
            self.logoImageView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            
        }) { (_) in
            
            UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: {
                
                self.logoImageView.transform = CGAffineTransform(scaleX: 5, y: 5)
                self.logoImageView.alpha = 0
            
            }) { (_) in
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    self.navigateToLoginController()
                }
            }
        }
        
    }
    
    func navigateToLoginController() {
        let loginSignUp = LoginSignUpController()
        loginSignUp.modalTransitionStyle = .crossDissolve
        loginSignUp.modalPresentationStyle = .fullScreen
        
        self.present(loginSignUp, animated: true, completion: nil)
    }
    
    func setupGlareView() {
        let glareView = GlareView()
        self.view.addSubview(glareView)
        glareView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        glareView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        glareView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        glareView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}

