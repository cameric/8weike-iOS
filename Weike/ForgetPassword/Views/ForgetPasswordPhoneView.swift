//
//  ForgetPasswordPhoneView.swift
//  Weike
//
//  Created by Danny Yulang Wang on 11/3/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

private let horizontalPadding = CGFloat(30)
private let verticalPadding = CGFloat(30)

protocol ForgetPasswordPhoneViewDelegate: class {
    func nextButtonTapped()
}

class ForgetPasswordPhoneView: UIView {

    // MARK: Properties

    weak var delegate: ForgetPasswordPhoneViewDelegate?
    var phone: String? { get { return phoneNumberTextField.text } }
    var formManager = UITextField.formManager

    fileprivate var topConstraint = NSLayoutConstraint()
    var topPadding = CGFloat(80) {
        didSet {
            topConstraint.constant = topPadding
            layoutIfNeeded()
        }
    }

    // MARK: Views

    fileprivate let titleLabel = UILabel()
    fileprivate let phoneNumberTextField = UITextField.floatLabeled

    // MARK: Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubviews()
        addSubviews([titleLabel, phoneNumberTextField])
        formManager.addTextFields([phoneNumberTextField])
        installConstraints()
    }

    convenience required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureSubviews() {
        backgroundColor = UIColor.background

        // Configure title
        titleLabel.text = "Forgot Password".localized()
        titleLabel.font = .extraExtraLargeBold
        titleLabel.textColor = .white

        // Configure phoneNumberTextField
        phoneNumberTextField.placeholder = "Phone Number".localized()
        phoneNumberTextField.keyboardType = .phonePad
        phoneNumberTextField.regex = "^(\\+?0?86\\-?)?1[345789]\\d{9}$"
        phoneNumberTextField.messageInvalid = "Your phone number is not a valid".localized()
        phoneNumberTextField.messageRequired = "Sorry, please enter numbers only".localized()
        phoneNumberTextField.formKeyPath = "Phone"
        phoneNumberTextField.accessibilityIdentifier = "Phone"
        phoneNumberTextField.returnKeyType = .next
    }

    private func installConstraints() {
        let views = ["titleLabel": titleLabel,
                     "phoneNumberTextField": phoneNumberTextField]
        let metrics = ["topPadding": topPadding,
                       "horizontalPadding": horizontalPadding,
                       "verticalPadding": verticalPadding]
        disableTranslatesAutoresizingMaskIntoConstraints(views)
        var constraints = [NSLayoutConstraint]()

        // Horizontal constraints
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat:
            "H:|-(horizontalPadding)-[titleLabel]-(horizontalPadding)-|",
                                                                      options: [], metrics: metrics, views: views))
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat:
            "H:|-(horizontalPadding)-[phoneNumberTextField]-(horizontalPadding)-|",
                                                                      options: [], metrics: metrics, views: views))

        // Vertical constraints
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat:
            "V:|-(verticalPadding)-[titleLabel]-(verticalPadding)-[phoneNumberTextField]",
                                                                      options: [], metrics: metrics, views: views))

        NSLayoutConstraint.activate(constraints)

    }

    // MARK: Helpers

    func nextButtonTapped() {
        delegate?.nextButtonTapped()
    }

}

// MARK: UITextFieldDelegate

extension ForgetPasswordPhoneView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.returnKeyType == .send {
            delegate?.nextButtonTapped()
            return true
        }
        return false
    }
}

// MARK: Keyboard Dismiss

extension ForgetPasswordPhoneView {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        formManager.activeField?.resignFirstResponder()
    }
}
