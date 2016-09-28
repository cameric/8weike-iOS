//
//  PhoneVerifyView.swift
//  Weike
//
//  Created by Weiyu Zhou on 9/26/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

private let topPadding = CGFloat(80)
private let horizontalPadding = CGFloat(20)
private let verticalPadding = CGFloat(20)

protocol PhoneVerifyViewDelegate: class {
    func resendButtonTapped()
}

class PhoneVerifyView: UIView {
    // MARK: Properties
    private var formManager = UITextField.formManager
    weak var delegate: PhoneVerifyViewDelegate?
    var resendButtonText: String? {
        set { resendButton.setTitle(newValue, for: []) }
        get { return resendButton.titleLabel?.text }
    }
    var resendButtonEnable: Bool {
        set { resendButton.isEnabled = newValue }
        get { return resendButton.isEnabled }
    }

    // MARK: Views
    fileprivate var titleLabel = UILabel()
    fileprivate var verifyCodeTextField = UITextField.floatLabeled
    fileprivate var resendButton = UIButton(type: .system)

    // MARK: Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubviews()
        addSubviews([titleLabel, verifyCodeTextField, resendButton])
        formManager.addTextFields([verifyCodeTextField])
        installConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureSubviews() {
        backgroundColor = UIColor.background

        // Configure titleLabel

        titleLabel.text = "Passcode send".localized()
        titleLabel.textColor = .white
        titleLabel.font = .extraExtraLargeBold

        // Configure verifyCodeTextField

        verifyCodeTextField.placeholder = "Passcode sent to your phone".localized()
        verifyCodeTextField.minimumNumberOfCharacters = 4
        verifyCodeTextField.messageInvalid = "Invalid code".localized()
        verifyCodeTextField.messageRequired = "Please enter the code sent to your phone".localized()
        verifyCodeTextField.formKeyPath = "code"

        // Configure resendButton

        resendButton.setTitleColor(.white, for: [])
        resendButton.setTitle("Resend Passcode".localized(), for: [])
        resendButton.addTarget(self, action: #selector(resendButtonTapped), for: .touchUpInside)
    }

    private func installConstraints() {
        let views: [String: UIView] = ["titleLabel": titleLabel,
                     "verifyCodeTextField": verifyCodeTextField,
                     "resendButton": resendButton]
        let metrics = ["topPadding": topPadding,
                "horizontalPadding": horizontalPadding,
                  "verticalPadding": verticalPadding]
        disableTranslatesAutoresizingMaskIntoConstraints(views)
        var constraints = [NSLayoutConstraint]()

        // Horizontal Constraints
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat:
            "H:|-(horizontalPadding)-[titleLabel]-(horizontalPadding)-|", options: [], metrics: metrics, views: views))
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat:
            "H:|-(horizontalPadding)-[verifyCodeTextField]-(horizontalPadding)-|", options: [], metrics: metrics, views: views))
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat:
            "H:|-(horizontalPadding)-[resendButton]", options: [], metrics: metrics, views: views))

        // Vertical Constraints
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat:
            "V:|-(topPadding)-[titleLabel]-(verticalPadding)-[verifyCodeTextField]-(verticalPadding)-[resendButton]", options: [], metrics: metrics, views: views))

        NSLayoutConstraint.activate(constraints)
    }

    // MARK: Helpers

    func resendButtonTapped() {
        delegate?.resendButtonTapped()
    }

}
