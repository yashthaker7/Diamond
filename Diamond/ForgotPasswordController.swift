//
//  ForgotPasswordViewController.swift
//  Diamond
//
//  Created by Yash Thaker on 01/04/18.
//  Copyright © 2018 Yash Thaker. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: UIViewController {
    
    var emailLabel: UILabel!
    var emailTextField: UITextField!
    var demoView: UIView! // set createBtn cntr between textfield and view's bottom
    var resetBtn: UIButton!
    var forgotView: UIView!
    
    lazy var cancleBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(#imageLiteral(resourceName: "cross"), for: .normal)
        let darkGray = UIColor.black.withAlphaComponent(0.65)
        btn.tintColor = darkGray
        btn.addTarget(self, action: #selector(handleDismiss(_:)), for: .touchUpInside)
        return btn
    }()
    
    let loginSignUp = LoginSignUpController()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.applyGradient(colors: [#colorLiteral(red: 0.262745098, green: 0.262745098, blue: 0.262745098, alpha: 1),#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)], type: .vertical)
        
        setupGlareView()
        
        setupView()
    }
    
    func setupView() {
        emailLabel = loginSignUp.createLabel(text: "EMAIL")
        emailTextField = loginSignUp.createTextField()
        emailTextField.layer.borderColor = UIColor.darkGray.cgColor
        emailTextField.keyboardType = .emailAddress
        emailTextField.addTarget(self, action: #selector(forgotViewEditingChanged(_:)), for: .editingChanged)
        
        demoView = loginSignUp.createView()
        demoView.backgroundColor = .clear
        
        resetBtn = loginSignUp.createButton(title: "RESET")
        resetBtn.setTitleColor(.darkGray, for: .normal)
        resetBtn.titleLabel?.font = UIFont(name: "HelveticaNeue-Medium", size: 22)
        resetBtn.addTarget(self, action: #selector(handleReset(_:)), for: .touchUpInside)
        
        forgotView = loginSignUp.createView()
        
        forgotView.addSubview(cancleBtn)
        forgotView.addSubview(emailLabel)
        forgotView.addSubview(emailTextField)
        forgotView.addSubview(demoView)
        forgotView.addSubview(resetBtn)
        view.addSubview(forgotView)
        
        cancleBtn.rightAnchor.constraint(equalTo: forgotView.rightAnchor, constant: -8).isActive = true
        cancleBtn.topAnchor.constraint(equalTo: forgotView.topAnchor, constant: 8).isActive = true
        cancleBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        cancleBtn.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        emailLabel.leftAnchor.constraint(equalTo: forgotView.leftAnchor, constant:21).isActive = true
        emailLabel.topAnchor.constraint(equalTo: forgotView.topAnchor, constant: (self.view.frame.size.width * 0.16)).isActive = true

        emailTextField.leftAnchor.constraint(equalTo: forgotView.leftAnchor, constant:16).isActive = true
        emailTextField.rightAnchor.constraint(equalTo: forgotView.rightAnchor, constant: -16).isActive = true
        emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 8).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true

        // demoView set signInBtn center between password textfield and view's bottom
        demoView.topAnchor.constraint(equalTo: emailTextField.bottomAnchor).isActive = true
        demoView.bottomAnchor.constraint(equalTo: forgotView.bottomAnchor).isActive = true

        resetBtn.centerXAnchor.constraint(equalTo: forgotView.centerXAnchor).isActive = true
        resetBtn.centerYAnchor.constraint(equalTo: demoView.centerYAnchor).isActive = true
        resetBtn.heightAnchor.constraint(equalTo: forgotView.heightAnchor, multiplier: 0.16).isActive = true
        resetBtn.transform = CGAffineTransform(scaleX: 0, y: 0)
        
        forgotView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -30).isActive = true
        forgotView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        forgotView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        forgotView.heightAnchor.constraint(equalToConstant: view.frame.size.width * 0.75).isActive = true
        
        
    }
    
    @objc func handleReset(_ sender: UIButton) {
        view.endEditing(true)
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func forgotViewEditingChanged(_ textField: UITextField) {
        guard let email = emailTextField.text, !email.isEmpty else {
            self.resetBtn.transform = CGAffineTransform(scaleX: 0, y: 0)
            return
        }
        
        UIView.animate(withDuration: 0.5, delay: 0.2, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.resetBtn.transform = .identity
        })
    }
    
    @objc func handleDismiss(_ sender: UIButton) {
        view.endEditing(true)
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
