//
//  resetPasswordView.swift
//  Weike
//
//  Created by Danny Yulang Wang on 8/23/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

private let topPadding = CGFloat(80)
private let horizontalPadding = CGFloat(20)
private let verticalPadding = CGFloat(20)

protocol ResetPasswordViewDelegate: class {
    func confirmButtonTapped()
}

class ResetPasswordView: UIView {
    // MARK: Properties

    weak var delegate: ResetPasswordViewDelegate?
    fileprivate var verticalAnchor: NSLayoutConstraint?

    // MARK: Views

    fileprivate let passwordTextField = UITextField.floatLabeled
    fileprivate let confirmButton = UIButton.rounded

    // MARK: Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubviews()
        addSubviews([passwordTextField, confirmButton])
        installConstraints()
    }

    convenience required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureSubviews() {
        backgroundColor = UIColor.background
        startListenToKeyboardEvent()

        passwordTextField.setPlaceholder("Set Password", floatingTitle: "Set Password")

        confirmButton.setTitle("Confirm", for: [])
        confirmButton.addTarget(self, action: #selector(confirmButtonTapped), for: .touchUpInside)
    }

    private func installConstraints() {
        let views = ["passwordTextField": passwordTextField,
                     "confirmButton": confirmButton]
        let metrics = ["horizontalPadding": horizontalPadding,
                       "verticalPadding": verticalPadding]
        disableTranslatesAutoresizingMaskIntoConstraints(views)
        var constraints = [NSLayoutConstraint]()

        // Horizontal constraints
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
            "V:[passwordTextField]-(verticalPadding)-[confirmButton]",
                                                                      options: [], metrics: metrics, views: views))

        NSLayoutConstraint.activate(constraints)
    }

    // MARK: Private Helpers

    func confirmButtonTapped(event: UIEvent) {
        delegate?.confirmButtonTapped()
    }
}

// MARK: KeyboardDelegate

extension ResetPasswordView: KeyboardDelegate {
    func keyboardWillShow(notification: NSNotification) {
        if verticalAnchor != nil {
            NSLayoutConstraint.deactivate([verticalAnchor!])
        }

        verticalAnchor = passwordTextField.topAnchor.constraint(equalTo: topAnchor,
                                                                   constant: topPadding)
        NSLayoutConstraint.activate([verticalAnchor!])

        setNeedsLayout()
    }

    func keyboardWillHide(notification: NSNotification) {
        if verticalAnchor != nil {
            NSLayoutConstraint.deactivate([verticalAnchor!])
        }

        verticalAnchor = passwordTextField.centerYAnchor.constraint(equalTo: centerYAnchor)
        NSLayoutConstraint.activate([verticalAnchor!])

        setNeedsLayout()
    }
}
