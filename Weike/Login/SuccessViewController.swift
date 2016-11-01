//
//  successViewController.swift
//  Weike
//
//  Created by Danny Yulang Wang on 8/14/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

final class SuccessViewController: WKUIViewController {
    // MARK: Properties

    fileprivate let successView: SuccessView

    // MARK: Initializers

    init(message: String) {
        self.successView = SuccessView(message: message)
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: UIViewController

    override func loadView() {
        super.loadView()
        view = successView

        // Hide navigation bar
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func viewDidLoad() {
        // Dismiss the view after 2 seconds
        let dispatchTime: DispatchTime = DispatchTime.now() + 2.0
        DispatchQueue.main.asyncAfter(deadline: dispatchTime, execute: {
            self.dismissAnimated()
        })
    }

}
