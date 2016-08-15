//
//  LandingViewController.swift
//  Weike
//
//  Created by Weiyu Zhou on 7/29/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

import AVKit
import AVFoundation

class LandingViewController: UIViewController {
    // MARK: Properties
    
    private let landingView = LandingView()
    
    // MARK: UIViewController
    
    override func loadView() {
        super.loadView()
        landingView.delegate = self
        view = landingView
        loadBackgroundVideo()
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
    }
}

// MARK: LandingViewDelegate

extension LandingViewController: LandingViewDelegate {
    func LandingViewWechatButtonTapped() {
        
    }
    
    func LandingViewLoginButtonTapped() {
        let loginController = LoginViewController()
        present(loginController, animated: true, completion: nil)
    }

    func LandingViewSignupButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
}
