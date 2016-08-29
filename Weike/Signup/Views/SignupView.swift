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
    func signupButtonTapped()
}

class SignupView: UIView {
    // MARK: Properties

    weak var delegate: SignupViewDelegate?
    private var verticalAnchor: NSLayoutConstraint?

    // MARK: Views

    private let phoneNumberTextField = UITextField.floatLabeled
    private let passwordTextField = UITextField.floatLabeled
    private let confirmPasswordTextField = UITextField.floatLabeled
    private let signupButton = UIButton.rounded

    // MARK: Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubviews()
        addSubviews([phoneNumberTextField, passwordTextField, confirmPasswordTextField, signupButton])
        installConstraints()
    }

    convenience required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureSubviews() {
        backgroundColor = UIColor.background
        startListenToKeyboardEvent()

        phoneNumberTextField.setPlaceholder("Phone Number", floatingTitle: "Phone Number")
        phoneNumberTextField.keyboardType = .phonePad

        passwordTextField.setPlaceholder("Password", floatingTitle: "Password")
        passwordTextField.isSecureTextEntry = true

        confirmPasswordTextField.setPlaceholder("Confirm Password", floatingTitle: "Confirm Password")
        confirmPasswordTextField.isSecureTextEntry = true

        signupButton.setTitle("Sign Up", for: [])
        signupButton.addTarget(self, action: #selector(signupButtonTapped), for: .touchUpInside)
    }

    private func installConstraints() {
        let views = ["phoneNumberTextField": phoneNumberTextField,
                     "passwordTextField": passwordTextField,
                     "confirmPasswordTextField": confirmPasswordTextField,
                     "signupButton": signupButton]
        let metrics = ["horizontalPadding": horizontalPadding,
                       "verticalPadding": verticalPadding]
        disableTranslatesAutoresizingMaskIntoConstraints(views)
        var constraints = [NSLayoutConstraint]()

        // Horizontal constraints
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat:
            "H:|-(horizontalPadding)-[phoneNumberTextField]-(horizontalPadding)-|",
                                                                      options: [], metrics: metrics, views: views))
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat:
            "H:|-(horizontalPadding)-[passwordTextField]-(horizontalPadding)-|",
                                                                      options: [], metrics: metrics, views: views))
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat:
            "H:|-(horizontalPadding)-[confirmPasswordTextField]-(horizontalPadding)-|",
                                                                      options: [], metrics: metrics, views: views))
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat:
            "H:|-(horizontalPadding)-[signupButton]-(horizontalPadding)-|",
                                                                      options: [], metrics: metrics, views: views))

        // Vertical constraints
        verticalAnchor = confirmPasswordTextField.centerYAnchor.constraint(equalTo: centerYAnchor)
        constraints.append(verticalAnchor!)
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat:
            "V:[phoneNumberTextField]-[passwordTextField]-[confirmPasswordTextField]-(verticalPadding)-[signupButton]",
                                                                      options: [], metrics: metrics, views: views))

        NSLayoutConstraint.activate(constraints)
    }

    // MARK: Private Helpers

    func signupButtonTapped(event: UIEvent) {
        delegate?.signupButtonTapped()
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

        verticalAnchor = confirmPasswordTextField.centerYAnchor.constraint(equalTo: centerYAnchor)
        NSLayoutConstraint.activate([verticalAnchor!])

        setNeedsLayout()
    }
}
