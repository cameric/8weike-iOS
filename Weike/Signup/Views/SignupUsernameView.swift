//
//  SignupUsernameView.swift
//  Weike
//
//  Created by Cam on 8/23/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

private let horizontalPadding = CGFloat(20)
private let verticalPadding = CGFloat(20)

protocol SignupUsernameViewDelegate: class {
    func confirmUsernameButtonTapped()
}

class SignupUsernameView: UIView {

    // MARK: Properties

    weak var delegate: SignupUsernameViewDelegate?
    var username: String? { return usernameTextField.text }

    // MARK: Views

    fileprivate let usernameTextField = UITextField.floatLabeled
    fileprivate let confirmUsernameButton = UIButton.rounded
    fileprivate var formManager = UITextField.formManager

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
        usernameTextField.placeholder = "Username".localized()
        usernameTextField.minimumNumberOfCharacters = 3
        usernameTextField.messageInvalid = "Your username is not a valid".localized()
        usernameTextField.messageRequired = "What is your nickname?".localized()

        confirmUsernameButton.setTitle("Confirm Username".localized(), for: [])
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

    func confirmUsernameButtonTapped(_ event: UIEvent) {
        let isValid = formManager.checkForm()
        if isValid {
            formManager.activeField.resignFirstResponder()
            delegate?.confirmUsernameButtonTapped()
        }
    }
}
