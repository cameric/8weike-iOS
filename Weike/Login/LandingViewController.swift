//
//  LandingViewController.swift
//  Weike
//
//  Created by Weiyu Zhou on 7/29/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

import AVKit
import AVFoundation

final class LandingViewController: WKUIViewController {
    // MARK: Properties

    fileprivate let landingView = LandingView()

    // MARK: UIViewController

    override func loadView() {
        super.loadView()
        landingView.delegate = self
        view = landingView
        IRI = landingViewIRI

        loadBackgroundVideo()
    }

    override func viewWillAppear(_ animated: Bool) {
        // Hide navigation bar
        navigationController?.setNavigationBarHidden(true, animated: false)
        super.viewWillAppear(animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        // Show navigation bar
        navigationController?.setNavigationBarHidden(false, animated: false)
        super.viewWillDisappear(animated)
    }

    private func loadBackgroundVideo() {
        // todo: Set preloading or change it to local video
        let player = AVPlayer(url: URL(string:
            "http://trailers.apple.com/movies/universal/stateofplay/stateofplay-tlr2_h.640.mov")!)
        player.isMuted = true
        let playerController = AVPlayerViewController()
        playerController.player = player
        playerController.showsPlaybackControls = false
        playerController.videoGravity = AVLayerVideoGravityResizeAspectFill
        addChildViewController(playerController)
        playerController.view.isUserInteractionEnabled = false
        landingView.backgroundView = playerController.view
        player.play()
        player.actionAtItemEnd = .none
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(replayBackgroundVideo),
                                               name: .AVPlayerItemDidPlayToEndTime,
                                               object: player.currentItem)
    }

    /// Replay the background video when it reaches the end
    func replayBackgroundVideo(notification: NSNotification) {
        if let playerItem: AVPlayerItem = notification.object as? AVPlayerItem {
            playerItem.seek(to: kCMTimeZero)
        }
    }
}

// MARK: LandingViewDelegate

extension LandingViewController: LandingViewDelegate {
    func LandingViewWechatButtonTapped() {
        dismissAnimated()
    }

    func LandingViewLoginButtonTapped() {
        let loginController = UINavigationController(rootViewController: LoginViewController())
        present(loginController, animated: true, completion: nil)
    }

    func LandingViewSignupButtonTapped() {
        let signupController = UINavigationController(rootViewController: SignupViewController())
        present(signupController, animated: true, completion: nil)
    }
}
