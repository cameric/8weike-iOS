//
//  successView.swift
//  Weike
//
//  Created by Danny Yulang Wang on 8/13/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

import UIKit

private let horizontalPadding = CGFloat(30)
private let verticalPadding = CGFloat(22)

class SuccessView: UIView {

    // MARK: Views

    let successMessageLabel = UILabel()
    fileprivate let successImageView = UIImageView(image: UIImage(named: "success")!)

    // MARK: Initializers

    init(message: String) {
        super.init(frame: .zero)
        configureSubviews(with: message)
        addSubviews([successMessageLabel, successImageView])
        installConstraints()
    }

    convenience required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureSubviews(with message: String) {
        backgroundColor = UIColor.main

        // Message related
        successMessageLabel.text = message
        successMessageLabel.font = UIFont.large
        successMessageLabel.textColor = UIColor.white
        successMessageLabel.textAlignment = NSTextAlignment.center

        // Image related
        successImageView.isUserInteractionEnabled = false // TODO: Make it enabled, a button leading to main page?
    }

    private func installConstraints() {
        let views = ["successMessageLabel": successMessageLabel,
                     "successImageView": successImageView]
        let metrics = ["horizontalPadding": horizontalPadding,
                       "verticalPadding": verticalPadding]
        disableTranslatesAutoresizingMaskIntoConstraints(views)
        var constraints = [NSLayoutConstraint]()

        // Horizontal constraints
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat:
            "H:|-(horizontalPadding)-[successMessageLabel]-(horizontalPadding)-|",
                                                                      options: [], metrics: metrics, views: views))
        constraints.append(successImageView.widthAnchor.constraint(equalTo: widthAnchor,
                                                                        multiplier: 0.3))
        constraints.append(successImageView.centerXAnchor.constraint(equalTo: centerXAnchor))

        // Vertical constraints
        constraints.append(successImageView.centerYAnchor.constraint(equalTo: centerYAnchor))
        constraints.append(successImageView.heightAnchor.constraint(equalTo: successImageView.widthAnchor))
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat:
            "V:[successMessageLabel]-(verticalPadding)-[successImageView]",
                                                                      options: [], metrics: metrics, views: views))

        NSLayoutConstraint.activate(constraints)
    }

}
