//
//  LoginViewController.swift
//  Weike
//
//  Created by Weiyu Zhou on 7/29/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

import AVKit

class LoginViewController: UIViewController {
    // MARK: Properties
    private let loginView = LoginView()
    
    // MARK: UIViewController
    override func loadView() {
        super.loadView()
        loginView.delegate = self
        view = loginView
        loadBackgroundVideo()
    }
    
    private func loadBackgroundVideo() {
        let player = AVPlayer(url: URL(string:
            "http://trailers.apple.com/movies/universal/stateofplay/stateofplay-tlr2_h.640.mov")!)
        let playerController = AVPlayerViewController()
        playerController.player = player
        playerController.showsPlaybackControls = false
        playerController.videoGravity = AVLayerVideoGravityResizeAspectFill
        addChildViewController(playerController)
        loginView.backgroundView = playerController.view
        player.play()
    }
}

// MARK: LoginViewDelegate
extension LoginViewController: LoginViewDelegate {
    func LoginViewWechatButtonTapped() {
        
    }
    
    func LoginViewLoginButtonTapped() {
        
    }

    func LoginViewSignupButtonTapped() {
        
    }
}
