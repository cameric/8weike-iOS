//
//  SignupUsernameView.swift
//  Weike
//
//  Created by Cam on 8/23/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

private let horizontalPadding = CGFloat(20)
private let verticalPadding = CGFloat(20)

protocol SignupUsernameViewDelegate {
    func confirmUsernameButtonTapped()
}

class SignupUsernameView: UIView {

    // MARK: Properties

    var delegate: SignupUsernameViewDelegate?
    var username: String? { return usernameTextField.text }

    // MARK: Views

    private let usernameTextField = UITextField.floatLabeled
    private let confirmUsernameButton = UIButton.rounded
    private var formManager = UITextField.formManager

    // MARK: Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubviews()
        addSubviews([usernameTextField, confirmUsernameButton])
        formManager.addTextFields([usernameTextField])
        installConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureSubviews() {
        backgroundColor = UIColor.background

        // Configure phoneNumberTextField
        usernameTextField.placeholder = "Username"
        usernameTextField.messageInvalid = "Your username is not a valid"
        usernameTextField.messageRequired = "What is your nickname?"

        confirmUsernameButton.setTitle("Confirm Username", for: [])
    }

    private func installConstraints() {
        let views = ["usernameTextField": usernameTextField,
                     "confirmUsernameButton": confirmUsernameButton]
        let metrics = ["horizontalPadding": horizontalPadding,
                       "verticalPadding": verticalPadding]
        disableTranslatesAutoresizingMaskIntoConstraints(views)
        var constraints = [NSLayoutConstraint]()

        // Horizontal Constraints
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat:
            "H:|-(horizontalPadding)-[usernameTextField]-(horizontalPadding)-|", options: [], metrics: metrics, views: views))
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat:
            "H:|-(horizontalPadding)-[confirmUsernameButton]-(horizontalPadding)-|", options: [], metrics: metrics, views: views))

        // Vertical Constraints
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat:
            "V:|-(verticalPadding)-[usernameTextField]-(verticalPadding)-[confirmUsernameButton]",
            options: [], metrics: metrics, views: views))

        NSLayoutConstraint.activate(constraints)
    }

    // Private Helpers

    func confirmUsernameButtonTapped(event: UIEvent) {
        let isValid = formManager.checkForm()
        if isValid {
            formManager.activeField.resignFirstResponder()
            delegate?.confirmUsernameButtonTapped()
        }
    }
}
