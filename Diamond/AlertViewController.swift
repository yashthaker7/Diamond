//
//  AlertViewController.swift
//  Diamond
//
//  Created by Yash Thaker on 01/04/18.
//  Copyright © 2018 Yash Thaker. All rights reserved.
//

import UIKit

class AlertViewController: UIViewController {
    
    let loginSignUp = LoginSignUpController()
    
    var alertView: UIView!
    var alertLabel: UILabel!
    
    var message: String?
    
    var widthContraintOfAlertView: NSLayoutConstraint?
    var leftContraintOfAlertView: NSLayoutConstraint?
    var rightContraintOfAlertView: NSLayoutConstraint?
    
    convenience init(message: String) {
        self.init()
        self.message = message
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.applyGradient(colors: [.themePink, .themeBlue], type: .cross)
        
        setupGlareView()
        
        initializeViews()
        addSubViews()
        addContraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
            
            self.widthContraintOfAlertView?.isActive = false
            self.leftContraintOfAlertView?.isActive = true
            self.rightContraintOfAlertView?.isActive = true
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                
                self.alertView.layer.cornerRadius = 5
                self.view.layoutIfNeeded()
                self.alertLabel.alpha = 1
            })
        }
    }
    
    func initializeViews() {
        alertView = loginSignUp.createView()
        alertView.layer.cornerRadius = 100
        
        alertLabel = loginSignUp.createLabel(text: "❌  \(message ?? "")")
        alertLabel.numberOfLines = 0
        alertLabel.textAlignment = .center
        alertLabel.font = UIFont(name: "HelveticaNeue", size: 20)
        alertLabel.alpha = 0
    }
    
    func addSubViews() {
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
        
        view.addSubview(alertView)
        alertView.addSubview(alertLabel)
    }
    
    func addContraints() {
        alertView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        alertView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        alertView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        widthContraintOfAlertView = alertView.widthAnchor.constraint(equalToConstant: 200)
        widthContraintOfAlertView?.isActive = true
        
        leftContraintOfAlertView = alertView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16)
        rightContraintOfAlertView = alertView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16)
        
        alertLabel.leftAnchor.constraint(equalTo: alertView.leftAnchor, constant: 16).isActive = true
        alertLabel.rightAnchor.constraint(equalTo: alertView.rightAnchor, constant: -16).isActive = true
        alertLabel.centerYAnchor.constraint(equalTo: alertView.centerYAnchor).isActive = true
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
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
