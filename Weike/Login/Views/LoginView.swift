//
//  LoginView.swift
//  Weike
//
//  Created by Weiyu Zhou on 8/2/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

let buttonPadding = CGFloat(10)

protocol LoginViewDelegate: class {
    func LoginViewSkipButtonTapped()
    func LoginViewLoginButtonTapped()
    func LoginViewSignupButtonTapped()
}

class LoginView: UIView {
    weak var delegate: LoginViewDelegate?
    
    // MARK: Views
    let skipButton = UIButton(type: .roundedRect)
    let loginButton = UIButton(type: .roundedRect)
    let signupButton = UIButton(type: .roundedRect)
    
    // MARK: Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubviews()
        addSubviews([skipButton, loginButton, signupButton])
        installConstraints()
    }
    
    convenience required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Private Helpers
    private func configureSubviews() {
        self.backgroundColor = UIDesign.sharedUIDesign.backgroundColor()
        
        // Configure Skip Button
        skipButton.setTitle("Skip", for: [])
        skipButton.addTarget(self, action: #selector(skipButtonTapped), for: .touchUpInside)
        
        // Configure Login Button
        loginButton.setTitle("Login", for: [])
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        
        // Configure Signup Button
        signupButton.setTitle("Signup", for: [])
        signupButton.addTarget(self, action: #selector(signupButtonTapped), for: .touchUpInside)
    }
    
    private func installConstraints() {
        let views = ["skipButton": skipButton,
                     "loginButton": loginButton,
                     "signupButton": signupButton]
        let metrics = ["buttonPadding": buttonPadding]
        disableTranslatesAutoresizingMaskIntoConstraints(views)
        var constraints = [NSLayoutConstraint]()
        
        // Skip Button Constraints
        constraints.append(skipButton.topAnchor.constraint(equalTo: self.topAnchor, constant: buttonPadding))
        constraints.append(self.rightAnchor.constraint(equalTo: skipButton.rightAnchor, constant: buttonPadding))
        
        // Horizontal Constraints
        constraints.append(loginButton.widthAnchor.constraint(equalTo: signupButton.widthAnchor))
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat:
            "H:|-(buttonPadding)-[loginButton]-(buttonPadding)-[signupButton]-(buttonPadding)-|",
                                                                      options: [], metrics: metrics, views: views))
        
        // Vertical Constraints
        constraints.append(self.bottomAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: buttonPadding))
        constraints.append(self.bottomAnchor.constraint(equalTo: signupButton.bottomAnchor, constant: buttonPadding))
        NSLayoutConstraint.activate(constraints)
    }
    
    func skipButtonTapped(event: UIEvent) {
        self.delegate?.LoginViewSkipButtonTapped()
    }
    
    func loginButtonTapped(event: UIEvent) {
        self.delegate?.LoginViewLoginButtonTapped()
    }
    
    func signupButtonTapped(event: UIEvent) {
        self.delegate?.LoginViewSignupButtonTapped()
    }
}
