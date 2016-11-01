//
//  PostView.swift
//  Weike
//
//  Created by Cam on 10/20/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

class PostView: UIView {
    fileprivate var imageView = PostImageView()
    fileprivate var authorView = PostAuthorView()
    fileprivate var commentsView = PostCommentsView()

    var post: Post? {
        didSet {
            imageView.image = post?.image
            authorView.author = post?.author
            commentsView.comments = post?.comments
        }
    }

    // MARK: Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews([imageView, authorView, commentsView])
        installConstraints()
    }

    convenience required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Private Helpers

    private func installConstraints() {
        let views: [String: UIView] = ["imageView": imageView,
                                       "authorView": authorView,
                                       "commentsView": commentsView]
        disableTranslatesAutoresizingMaskIntoConstraints(views)

        var constraints = [NSLayoutConstraint]()

        // Vertical Constraints
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat:
            "V:|-[imageView]-[authorView]-[commentsView]-|", metrics: nil, views: views))

        // Horizontal Constraints
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat:
            "H:|-[imageView]-|", metrics: nil, views: views))
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat:
            "H:|-[authorView]-|", metrics: nil, views: views))
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat:
            "H:|-[commentsView]-|", metrics: nil, views: views))

        NSLayoutConstraint.activate(constraints)
    }
}
