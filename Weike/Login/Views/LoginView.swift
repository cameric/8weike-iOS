//
//  LoginView.swift
//  Weike
//
//  Created by Weiyu Zhou on 8/2/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

let buttonPadding = CGFloat(10)
let logoPadding = CGFloat(10)

protocol LoginViewDelegate: class {
    func LoginViewWechatButtonTapped()
    func LoginViewLoginButtonTapped()
    func LoginViewSignupButtonTapped()
}

class LoginView: UIView {
    weak var delegate: LoginViewDelegate?
    
    // MARK: Views
    var backgroundView: UIView? {
        willSet {
            backgroundView?.removeFromSuperview()
        }
        didSet {
            if let view = backgroundView {
                insertSubview(view, at: 0)
                view.frame = self.frame
            }
        }
    }
    private let logoView = UIImageView(image: UIDesign.logo())
    private let weikeLabel = UILabel()
    private let wechatButton = UIButton.whiteBorderTransparent()
    private let loginButton = UIButton.whiteBorderTransparent()
    private let signupButton = UIButton.whiteBorderTransparent()
    
    // MARK: Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubviews()
        addSubviews([logoView, weikeLabel, wechatButton, loginButton, signupButton])
        installConstraints()
    }
    
    convenience required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Private Helpers
    private func configureSubviews() {
        self.backgroundColor = UIColor.main()
        // Configure Weike Label
        weikeLabel.text = "8 Microgram"
        weikeLabel.textColor = UIColor.white()
        
        // Configure Wechat Button
        wechatButton.setTitle("Wechat", for: [])
        wechatButton.addTarget(self, action: #selector(wechatButtonTapped), for: .touchUpInside)
        
        // Configure Login Button
        loginButton.setTitle("Login", for: [])
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        
        // Configure Signup Button
        signupButton.setTitle("Signup", for: [])
        signupButton.addTarget(self, action: #selector(signupButtonTapped), for: .touchUpInside)
    }
    
    private func installConstraints() {
        let views = ["logoView": logoView,
                     "weikeLabel": weikeLabel,
                     "wechatButton": wechatButton,
                     "loginButton": loginButton,
                     "signupButton": signupButton]
        let metrics = ["buttonPadding": buttonPadding,
                       "logoPadding": logoPadding]
        disableTranslatesAutoresizingMaskIntoConstraints(views)
        var constraints = [NSLayoutConstraint]()
        
        // Horizontal Constraints
        constraints.append(logoView.centerXAnchor.constraint(equalTo: centerXAnchor))
        constraints.append(logoView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.3))
        constraints.append(logoView.widthAnchor.constraint(equalTo: logoView.heightAnchor))
        constraints.append(weikeLabel.centerXAnchor.constraint(equalTo: centerXAnchor))
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat:
            "H:|-(buttonPadding)-[wechatButton]-(buttonPadding)-|", options: [], metrics: metrics, views: views))
        constraints.append(loginButton.widthAnchor.constraint(equalTo: signupButton.widthAnchor))
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat:
            "H:|-(buttonPadding)-[loginButton]-(buttonPadding)-[signupButton]-(buttonPadding)-|",
            options: [], metrics: metrics, views: views))
        
        // Vertical Constraints
        constraints.append(weikeLabel.topAnchor.constraint(equalTo: logoView.bottomAnchor, constant: logoPadding))
        constraints.append(weikeLabel.centerYAnchor.constraint(equalTo: centerYAnchor))
        constraints.append(loginButton.topAnchor.constraint(equalTo: wechatButton.bottomAnchor, constant: buttonPadding))
        constraints.append(bottomAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: buttonPadding))
        constraints.append(bottomAnchor.constraint(equalTo: signupButton.bottomAnchor, constant: buttonPadding))
        NSLayoutConstraint.activate(constraints)
    }
    
    func loginButtonTapped(event: UIEvent) {
        delegate?.LoginViewLoginButtonTapped()
    }
    
    func signupButtonTapped(event: UIEvent) {
        delegate?.LoginViewSignupButtonTapped()
    }
    
    func wechatButtonTapped(event: UIEvent) {
        delegate?.LoginViewWechatButtonTapped()
    }
}
