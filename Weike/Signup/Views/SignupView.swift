//
//  SignupView.swift
//  Weike
//
//  Created by Weiyu Zhou on 8/2/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

private let topPadding = CGFloat(80)
private let horizontalPadding = CGFloat(20)
private let verticalPadding = CGFloat(20)

protocol SignupViewDelegate: class {
    func getVerificationCodeButtonTapped()
    func confirmButtonTapped()
}

class SignupView: UIView {
    // MARK: Properties
    
    weak var delegate: SignupViewDelegate?
    private var verticalAnchor: NSLayoutConstraint?
    
    // MARK: Views
    
    private let phoneNumberTextField = UITextField.floatLabeled
    private let verificationCodeTextField = UITextField.floatLabeled
    private let passwordTextField = UITextField.floatLabeled
    private let getVerificationCodeButton = UIButton.rounded
    private let confirmButton = UIButton.rounded
    
    // MARK: Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubviews()
        addSubviews([phoneNumberTextField, verificationCodeTextField, passwordTextField, getVerificationCodeButton, confirmButton])
        installConstraints()
    }
    
    convenience required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureSubviews() {
        backgroundColor = UIColor.background
        startListenToKeyboardEvent()
        
        phoneNumberTextField.setPlaceholder("Phone Number", floatingTitle: "Phone Number")
        verificationCodeTextField.setPlaceholder("Verification Code", floatingTitle: "Verification Code")
        passwordTextField.setPlaceholder("Set Password", floatingTitle: "Set Password")
        
        getVerificationCodeButton.setTitle("Get Code", for: [])
        getVerificationCodeButton.addTarget(self, action: #selector(getVerificationCodeButtonTapped), for: .touchUpInside)
        
        confirmButton.setTitle("Confirm", for: [])
        confirmButton.addTarget(self, action: #selector(confirmButtonTapped), for: .touchUpInside)
    }
    
    private func installConstraints() {
        let views = ["phoneNumberTextField": phoneNumberTextField,
                     "verificationCodeTextField": verificationCodeTextField,
                     "passwordTextField": passwordTextField,
                     "getVerificationCodeButton": getVerificationCodeButton,
                     "confirmButton": confirmButton]
        let metrics = ["horizontalPadding": horizontalPadding,
                       "verticalPadding": verticalPadding]
        disableTranslatesAutoresizingMaskIntoConstraints(views)
        var constraints = [NSLayoutConstraint]()
        
        // Horizontal constraints
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat:
            "H:|-(horizontalPadding)-[phoneNumberTextField]-(horizontalPadding)-|",
                                                                      options: [], metrics: metrics, views: views))
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat:
            "H:|-(horizontalPadding)-[verificationCodeTextField]-[getVerificationCodeButton(>=30)]-(horizontalPadding)-|",
                                                                      options: [], metrics: metrics, views: views))
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat:
            "H:|-(horizontalPadding)-[passwordTextField]-(horizontalPadding)-|",
                                                                      options: [], metrics: metrics, views: views))
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat:
            "H:|-(horizontalPadding)-[confirmButton]-(horizontalPadding)-|",
                                                                      options: [], metrics: metrics, views: views))
        
        // Vertical constraints
        verticalAnchor = passwordTextField.centerYAnchor.constraint(equalTo: centerYAnchor)
        constraints.append(verticalAnchor!)
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat:
            "V:[phoneNumberTextField]-[verificationCodeTextField]-[passwordTextField]-(verticalPadding)-[confirmButton]",
                                                                      options: [], metrics: metrics, views: views))
        
        NSLayoutConstraint.activate(constraints)
    }
    
    // MARK: Private Helpers
    
    func getVerificationCodeButtonTapped(event: UIEvent) {
        // Color change after tap
        getVerificationCodeButton.setTitle("Code Sent", for: [])
        getVerificationCodeButton.tintColor = UIColor.gray
        
        // Change back after 5 seconds
        let dispatchTime: DispatchTime = DispatchTime.now() + 5.0
        DispatchQueue.main.asyncAfter(deadline: dispatchTime, execute: {
            self.getVerificationCodeButton.setTitle("Get Code", for: [])
            self.getVerificationCodeButton.tintColor = UIColor.orange
        })
        
        // Action
        delegate?.getVerificationCodeButtonTapped()
    }
    
    func confirmButtonTapped(event: UIEvent) {
        delegate?.confirmButtonTapped()
    }
}

// MARK: KeyboardDelegate

extension SignupView: KeyboardDelegate {
    func keyboardWillShow() {
        if verticalAnchor != nil {
            NSLayoutConstraint.deactivate([verticalAnchor!])
        }
        
        verticalAnchor = phoneNumberTextField.topAnchor.constraint(equalTo: topAnchor,
                                                                constant: topPadding)
        NSLayoutConstraint.activate([verticalAnchor!])
        
        setNeedsLayout()
    }
    
    func keyboardWillHide() {
        if verticalAnchor != nil {
            NSLayoutConstraint.deactivate([verticalAnchor!])
        }
        
        verticalAnchor = passwordTextField.centerYAnchor.constraint(equalTo: centerYAnchor)
        NSLayoutConstraint.activate([verticalAnchor!])
        
        setNeedsLayout()
    }
}
