//
//  LoginSignUpController.swift
//  Diamond
//
//  Created by Yash Thaker on 01/04/18.
//  Copyright © 2018 Yash Thaker. All rights reserved.
//

import UIKit

class LoginSignUpController: UIViewController {
    
    // create account view's elements
    var navigateCreateAccountBtn: UIButton!
    var emailLabel: UILabel!
    var emailTextField: UITextField!
    var passwordLabel: UILabel!
    var passwordTextField: UITextField!
    var repeatPasswordLabel: UILabel!
    var repeatPasswordTextField: UITextField!
    var demoView: UIView! // set createBtn cntr between password textfield and view's bottom
    var createAcntBtn: UIButton!
    var createAccountView: UIView!
    
    // sign in view's elements
    var navigateSignInBtn: UIButton!
    var emailLabel2: UILabel!
    var emailTextField2: UITextField!
    var passwordLabel2: UILabel!
    var passwordTextField2: UITextField!
    var forgotPasswordBtn: UIButton!
    var demoView2: UIView! // set signInBtn cntr between password textfield and view's bottom
    var signInButton: UIButton!
    var signInView: UIView!
    
    
    // animation
    var leftContraintOfCreateView: NSLayoutConstraint?
    var rightContraintOfCreateView: NSLayoutConstraint?
    var centerYContraintOfCreateView: NSLayoutConstraint?
    
    var leftContraintOfsignInView: NSLayoutConstraint?
    var rightContraintOfsignInView: NSLayoutConstraint?
    var centerYContraintOfsignInView: NSLayoutConstraint?
    
    var topContraintOfNavigateCreateAccountBtn: NSLayoutConstraint?
    var bottomContraintOfNavigateCreateAccountBtn: NSLayoutConstraint?
    
    let backgroundViewConstant: CGFloat = 32
    let frontViewConstant: CGFloat = 16
    let centerYOffset: CGFloat = 30
    
    var isCreateViewFront: Bool = false
    
    var loadingView: UIView!
    
    lazy var showPasswordBtn: UIButton = {
       let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.tintColor = .themeBlue
        let image = UIImage(named: "lock")?.withRenderingMode(.alwaysTemplate)
        btn.setImage(image, for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
//        btn.setTitle(" SHOW", for: .normal)
//        btn.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 11)
        btn.addTarget(self, action: #selector(handleShowPasswordBtn(_:)), for: .touchUpInside)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.applyGradient(colors: [.themePink, .themeBlue], type: .cross)
        
        setupGlareView()
        
        initializeViews()
        
        addsubViews()
        addContraints()
    }
    
    func initializeViews() {
        // create account view's elements
        navigateCreateAccountBtn = createButton(title: "CREATE NEW")
        navigateCreateAccountBtn.addTarget(self, action: #selector(handleNavigateCreateAccount(_:)), for: .touchUpInside)
        
        emailLabel = createLabel(text: "EMAIL")
        emailTextField = createTextField()
        emailTextField.keyboardType = .emailAddress
        emailTextField.addTarget(self, action: #selector(createAccountViewEditingChanged(_:)), for: .editingChanged)
        
        passwordLabel = createLabel(text: "PASSWORD")
        passwordTextField = createTextField()
        passwordTextField.isSecureTextEntry = true
        passwordTextField.addTarget(self, action: #selector(createAccountViewEditingChanged(_:)), for: .editingChanged)
        
        repeatPasswordLabel = createLabel(text: "RE-ENTER PASSWORD")
        repeatPasswordTextField = createTextField()
        repeatPasswordTextField.isSecureTextEntry = true
        repeatPasswordTextField.addTarget(self, action: #selector(createAccountViewEditingChanged(_:)), for: .editingChanged)
        
        demoView = createView()
        demoView.backgroundColor = .clear
        
        createAcntBtn = createButton(title: "CREATE NEW")
        createAcntBtn.setTitleColor(.themeBlue, for: .normal)
        createAcntBtn.titleLabel?.font = UIFont(name: "HelveticaNeue-Medium", size: 22)
        createAcntBtn.addTarget(self, action: #selector(handleCreateAccount(_:)), for: .touchUpInside)
        
        createAccountView = createView()
        
        // sign in view's elements
        navigateSignInBtn = createButton(title: "SIGN IN")
        navigateSignInBtn.titleLabel?.font = UIFont(name: "HelveticaNeue-Medium", size: 22)
        navigateSignInBtn.contentHorizontalAlignment = .left
        navigateSignInBtn.addTarget(self, action: #selector(handleNavigateSignIn(_:)), for: .touchUpInside)
        
        emailLabel2 = createLabel(text: "EMAIL")
        emailTextField2 = createTextField()
        emailTextField2.keyboardType = .emailAddress
        emailTextField2.addTarget(self, action: #selector(signViewEditingChanged(_:)), for: .editingChanged)
        
        passwordLabel2 = createLabel(text: "PASSWORD")
        passwordTextField2 = createTextField()
        passwordTextField2.isSecureTextEntry = true
        passwordTextField2.addTarget(self, action: #selector(signViewEditingChanged(_:)), for: .editingChanged)
        
        forgotPasswordBtn = createButton(title: "FORGOT PASSWORD?")
        forgotPasswordBtn.setTitleColor(.themeBlue, for: .normal)
        forgotPasswordBtn.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 11)
        forgotPasswordBtn.addTarget(self, action: #selector(handleForgotPassword(_:)), for: .touchUpInside)
        
        demoView2 = createView()
        demoView2.backgroundColor = .clear
        
        signInButton = createButton(title: "SIGN IN")
        signInButton.setTitleColor(.themeBlue, for: .normal)
        signInButton.titleLabel?.font = UIFont(name: "HelveticaNeue-Medium", size: 22)
        signInButton.addTarget(self, action: #selector(handleSignIn(_:)), for: .touchUpInside)
        
        signInView = createView()
        
        loadingView = createView()
        loadingView.isHidden = true
        loadingView.layer.cornerRadius = 100
    }
    
    func addsubViews() {
        // create account view's elements
        createAccountView.addSubview(navigateCreateAccountBtn)
        createAccountView.addSubview(emailLabel)
        createAccountView.addSubview(emailTextField)
        createAccountView.addSubview(passwordLabel)
        createAccountView.addSubview(passwordTextField)
        createAccountView.addSubview(repeatPasswordLabel)
        createAccountView.addSubview(repeatPasswordTextField)
        createAccountView.addSubview(demoView)
        createAccountView.addSubview(createAcntBtn)
        view.addSubview(createAccountView)
       
        // sign in view's elements
        signInView.addSubview(navigateSignInBtn)
        signInView.addSubview(emailLabel2)
        signInView.addSubview(emailTextField2)
        signInView.addSubview(passwordLabel2)
        signInView.addSubview(passwordTextField2)
        signInView.addSubview(showPasswordBtn)
        signInView.addSubview(forgotPasswordBtn)
        signInView.addSubview(demoView2)
        signInView.addSubview(signInButton)
        view.addSubview(signInView)
        
        // other
        view.addSubview(loadingView)
    }
    
    func addContraints() {
        // create account view's elements
        navigateCreateAccountBtn.leftAnchor.constraint(equalTo: createAccountView.leftAnchor, constant: 16).isActive = true
        navigateCreateAccountBtn.rightAnchor.constraint(equalTo: createAccountView.rightAnchor, constant: -16).isActive = true
        bottomContraintOfNavigateCreateAccountBtn =  navigateCreateAccountBtn.bottomAnchor.constraint(equalTo: createAccountView.bottomAnchor)
        bottomContraintOfNavigateCreateAccountBtn?.isActive = true
        topContraintOfNavigateCreateAccountBtn = navigateCreateAccountBtn.topAnchor.constraint(equalTo: createAccountView.topAnchor)
        navigateCreateAccountBtn.heightAnchor.constraint(equalTo: createAccountView.heightAnchor, multiplier: 0.16).isActive = true
        
        emailLabel.leftAnchor.constraint(equalTo: createAccountView.leftAnchor, constant:21).isActive = true
        emailLabel.topAnchor.constraint(equalTo: createAccountView.topAnchor, constant: (self.view.frame.size.width * 0.16)).isActive = true
        
        emailTextField.leftAnchor.constraint(equalTo: createAccountView.leftAnchor, constant:16).isActive = true
        emailTextField.rightAnchor.constraint(equalTo: createAccountView.rightAnchor, constant: -16).isActive = true
        emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 8).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        passwordLabel.leftAnchor.constraint(equalTo: createAccountView.leftAnchor, constant:21).isActive = true
        passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 16).isActive = true
        
        passwordTextField.leftAnchor.constraint(equalTo: createAccountView.leftAnchor, constant:16).isActive = true
        passwordTextField.rightAnchor.constraint(equalTo: createAccountView.rightAnchor, constant: -16).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 8).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        repeatPasswordLabel.leftAnchor.constraint(equalTo: createAccountView.leftAnchor, constant:21).isActive = true
        repeatPasswordLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16).isActive = true
        
        repeatPasswordTextField.leftAnchor.constraint(equalTo: createAccountView.leftAnchor, constant:16).isActive = true
        repeatPasswordTextField.rightAnchor.constraint(equalTo: createAccountView.rightAnchor, constant: -16).isActive = true
        repeatPasswordTextField.topAnchor.constraint(equalTo: repeatPasswordLabel.bottomAnchor, constant: 8).isActive = true
        repeatPasswordTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        // demoView set signInBtn center between password textfield and view's bottom
        demoView.topAnchor.constraint(equalTo: repeatPasswordTextField.bottomAnchor).isActive = true
        demoView.bottomAnchor.constraint(equalTo: createAccountView.bottomAnchor).isActive = true
        
        createAcntBtn.centerXAnchor.constraint(equalTo: createAccountView.centerXAnchor).isActive = true
        createAcntBtn.centerYAnchor.constraint(equalTo: demoView.centerYAnchor).isActive = true
        createAcntBtn.heightAnchor.constraint(equalTo: createAccountView.heightAnchor, multiplier: 0.16).isActive = true
        createAcntBtn.transform = CGAffineTransform(scaleX: 0, y: 0)
        
        centerYContraintOfCreateView = createAccountView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: centerYOffset)
        centerYContraintOfCreateView?.isActive = true
        leftContraintOfCreateView = createAccountView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: backgroundViewConstant)
        leftContraintOfCreateView?.isActive = true
        rightContraintOfCreateView = createAccountView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -backgroundViewConstant)
        rightContraintOfCreateView?.isActive = true
        createAccountView.heightAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
        // sign in view's elements
        navigateSignInBtn.leftAnchor.constraint(equalTo: signInView.leftAnchor, constant:16).isActive = true
        navigateSignInBtn.rightAnchor.constraint(equalTo: signInView.rightAnchor).isActive = true
        navigateSignInBtn.topAnchor.constraint(equalTo: signInView.topAnchor).isActive = true
        navigateSignInBtn.heightAnchor.constraint(equalTo: createAccountView.heightAnchor, multiplier: 0.16).isActive = true
     
        emailLabel2.leftAnchor.constraint(equalTo: signInView.leftAnchor, constant:21).isActive = true
        emailLabel2.topAnchor.constraint(equalTo: navigateSignInBtn.bottomAnchor, constant: 16).isActive = true
       
        emailTextField2.leftAnchor.constraint(equalTo: signInView.leftAnchor, constant:16).isActive = true
        emailTextField2.rightAnchor.constraint(equalTo: signInView.rightAnchor, constant: -16).isActive = true
        emailTextField2.topAnchor.constraint(equalTo: emailLabel2.bottomAnchor, constant: 8).isActive = true
        emailTextField2.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        passwordLabel2.leftAnchor.constraint(equalTo: signInView.leftAnchor, constant:21).isActive = true
        passwordLabel2.topAnchor.constraint(equalTo: emailTextField2.bottomAnchor, constant: 32).isActive = true
        
        passwordTextField2.leftAnchor.constraint(equalTo: signInView.leftAnchor, constant:16).isActive = true
        passwordTextField2.rightAnchor.constraint(equalTo: signInView.rightAnchor, constant: -16).isActive = true
        passwordTextField2.topAnchor.constraint(equalTo: passwordLabel2.bottomAnchor, constant: 8).isActive = true
        passwordTextField2.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        showPasswordBtn.centerYAnchor.constraint(equalTo: passwordTextField2.centerYAnchor).isActive = true
        showPasswordBtn.rightAnchor.constraint(equalTo: passwordTextField2.rightAnchor, constant: 8).isActive = true
        showPasswordBtn.heightAnchor.constraint(equalTo: passwordTextField2.heightAnchor).isActive = true
        
        forgotPasswordBtn.rightAnchor.constraint(equalTo: passwordTextField2.rightAnchor).isActive = true
        forgotPasswordBtn.topAnchor.constraint(equalTo: passwordTextField2.bottomAnchor, constant: 8).isActive = true
        
        // demoView2 set signInBtn center between password textfield and view's bottom
        demoView2.topAnchor.constraint(equalTo: forgotPasswordBtn.bottomAnchor).isActive = true
        demoView2.bottomAnchor.constraint(equalTo: signInView.bottomAnchor).isActive = true
        
        signInButton.centerXAnchor.constraint(equalTo: signInView.centerXAnchor).isActive = true
        signInButton.centerYAnchor.constraint(equalTo: demoView2.centerYAnchor).isActive = true
        signInButton.heightAnchor.constraint(equalTo: signInView.heightAnchor, multiplier: 0.16).isActive = true
        signInButton.transform = CGAffineTransform(scaleX: 0, y: 0)
        
        centerYContraintOfsignInView = signInView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -centerYOffset)
        centerYContraintOfsignInView?.isActive = true
        leftContraintOfsignInView = signInView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: frontViewConstant)
        leftContraintOfsignInView?.isActive = true
        rightContraintOfsignInView = signInView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -frontViewConstant)
        rightContraintOfsignInView?.isActive = true
        signInView.heightAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
        // other
        loadingView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loadingView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        loadingView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        loadingView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    @objc func handleCreateAccount(_ sender: UIButton) {
        view.endEditing(true)
        loading(start: true)
        
        guard let email = emailTextField.text, let password = passwordTextField.text, let repeatPassword = repeatPasswordTextField.text else { return }
        
        if password != repeatPassword {
            alertWithMessage(message: "Password does not match the repeat password.")
            return
        }
    }
    
    @objc func handleSignIn(_ sender: UIButton) {
        view.endEditing(true)
        loading(start: true)
        
        guard let email = emailTextField2.text, let password = passwordTextField2.text else { return }
        
        self.signInSuccesfully()
    }
    
    @objc func handleForgotPassword(_ sender: UIButton) {
        view.endEditing(true)
        let forgotPassword = ForgotPasswordViewController()
        forgotPassword.modalTransitionStyle = .flipHorizontal
        forgotPassword.modalPresentationStyle = .fullScreen
        
        self.present(forgotPassword, animated: true, completion: {
            self.loading(start: false)
        })
    }
    
    @objc func handleShowPasswordBtn(_ sender: UIButton) {
        passwordTextField2.isSecureTextEntry = !passwordTextField2.isSecureTextEntry
        let img: UIImage = passwordTextField2.isSecureTextEntry ? #imageLiteral(resourceName: "lock") : #imageLiteral(resourceName: "unlock")
        showPasswordBtn.setImage(img, for: .normal)
    }

    @objc func handleNavigateCreateAccount(_ sender: UIButton) {
        view.endEditing(true)
        if !isCreateViewFront {
            animateViewsWithFlag(flag: isCreateViewFront)
            isCreateViewFront = !isCreateViewFront
            
            emailTextField2.text = ""
            passwordTextField2.text = ""
            signInButton.transform = CGAffineTransform(scaleX: 0, y: 0)
        }
    }
    
    @objc func handleNavigateSignIn(_ sender: UIButton) {
        view.endEditing(true)
        if isCreateViewFront {
            animateViewsWithFlag(flag: isCreateViewFront)
            isCreateViewFront = !isCreateViewFront
            
            emailTextField.text = ""
            passwordTextField.text = ""
            repeatPasswordTextField.text = ""
            createAcntBtn.transform = CGAffineTransform(scaleX: 0, y: 0)
        }
    }
    
    func signInSuccesfully() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.4) {
            let loginSuccess = LoginSuccessController()
            loginSuccess.modalTransitionStyle = .crossDissolve
            loginSuccess.modalPresentationStyle = .fullScreen
            
            self.present(loginSuccess, animated: true, completion: {
                self.loading(start: false)
            })
        }
    }
    
    func alertWithMessage(message: String) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.4) {
            let alert = AlertViewController(message: message)
            alert.modalTransitionStyle = .crossDissolve
            alert.modalPresentationStyle = .overCurrentContext
            
            self.present(alert, animated: true, completion: {
                self.loading(start: false)
            })
        }
    }
    
    func loading(start: Bool) {
        loadingView.isHidden = start ? false : true
        createAccountView.isHidden = start ? true : false
        signInView.isHidden = start ? true : false
        
        loadingView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: [.repeat, .autoreverse, .curveEaseOut], animations: {
            self.loadingView.transform = .identity
        })
    }
    
    func animateViewsWithFlag(flag: Bool) {
        centerYContraintOfCreateView?.constant = 45
        centerYContraintOfsignInView?.constant = -45
        
        topContraintOfNavigateCreateAccountBtn?.isActive = flag ? false : true
        bottomContraintOfNavigateCreateAccountBtn?.isActive = flag ? true : false
        
        navigateCreateAccountBtn.isHidden = true
        
        navigateCreateAccountBtn.contentHorizontalAlignment = flag ? .center : .left
        
        UIView.animate(withDuration: 0.1, delay: 0, options: [.curveLinear, .allowUserInteraction], animations: {
            self.view.layoutIfNeeded()
            
        }) { (_) in
            
            self.navigateCreateAccountBtn.titleLabel?.font = flag ? UIFont(name: "HelveticaNeue", size: 15) : UIFont(name: "HelveticaNeue-Medium", size: 22)
            self.navigateSignInBtn.titleLabel?.font = flag ? UIFont(name: "HelveticaNeue-Medium", size: 22) : UIFont(name: "HelveticaNeue", size: 15)
            
            self.leftContraintOfCreateView?.constant = flag ? self.backgroundViewConstant : self.frontViewConstant
            self.rightContraintOfCreateView?.constant = flag ? -self.backgroundViewConstant : -self.frontViewConstant
            
            self.leftContraintOfsignInView?.constant = flag ? self.frontViewConstant : self.backgroundViewConstant
            self.rightContraintOfsignInView?.constant = flag ? -self.frontViewConstant : -self.backgroundViewConstant
            
            self.centerYContraintOfCreateView?.constant = self.centerYOffset
            self.centerYContraintOfsignInView?.constant = -self.centerYOffset
            
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: [.curveLinear, .allowUserInteraction], animations: {
                self.view.layoutIfNeeded()
                self.view.bringSubview(toFront: flag ? self.signInView : self.createAccountView)
                self.navigateCreateAccountBtn.isHidden = false
            })
        }
    }
    
    func createLabel(text: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "HelveticaNeue", size: 13)
        label.text = text
        label.textColor = .lightGray
        return label
    }
    
    func createTextField() -> UITextField {
        let txtField = UITextField()
        txtField.translatesAutoresizingMaskIntoConstraints = false
        txtField.delegate = self
        txtField.textColor = .black
        txtField.keyboardAppearance = .dark
        txtField.font = UIFont(name: "HelveticaNeue", size: 15)
        txtField.layer.cornerRadius = 5
        txtField.layer.borderWidth = 1
        let themeBlue = UIColor.themeBlue.withAlphaComponent(0.7)
        txtField.layer.borderColor = themeBlue.cgColor
        txtField.tintColor = .black
        txtField.autocapitalizationType = .none
        // hack to add padding
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 40))
        txtField.leftView = paddingView
        txtField.leftViewMode = .always
        return txtField
    }
    
    func createView() -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.layer.shadowRadius = 10
        view.layer.shadowOpacity = 0.4
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        return view
    }
    
    func createButton(title: String) -> UIButton {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle(title, for: .normal)
        let darkGray = UIColor.black.withAlphaComponent(0.65)
        btn.setTitleColor(darkGray, for: .normal)
        btn.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 15)
        return btn
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
        return false
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension LoginSignUpController: UITextFieldDelegate {
    
    @objc func createAccountViewEditingChanged(_ textField: UITextField) {
        guard let email = emailTextField.text, !email.isEmpty, let password = passwordTextField.text, !password.isEmpty, let repeatPassword = repeatPasswordTextField.text, !repeatPassword.isEmpty else {
                self.createAcntBtn.transform = CGAffineTransform(scaleX: 0, y: 0)
            return
        }
        
        UIView.animate(withDuration: 0.5, delay: 0.2, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.createAcntBtn.transform = .identity
        })
    }
    
    @objc func signViewEditingChanged(_ textField: UITextField) {
        guard let email2 = emailTextField2.text, !email2.isEmpty, let password2 = passwordTextField2.text, !password2.isEmpty else {
            self.signInButton.transform = CGAffineTransform(scaleX: 0, y: 0)
            return
        }
        
        UIView.animate(withDuration: 0.5, delay: 0.2, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.signInButton.transform = .identity
        })
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        var yPos: CGFloat = 0
        
        if textField == passwordTextField {
            yPos = -45
            
        } else if textField == repeatPasswordTextField {
            yPos = -105
        } else if textField == passwordTextField2 {
            yPos = -45
        }
        
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
            self.view.frame = CGRect(x: 0, y: yPos, width: self.view.frame.size.width, height: self.view.frame.size.height)
        })
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
            self.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        })
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

