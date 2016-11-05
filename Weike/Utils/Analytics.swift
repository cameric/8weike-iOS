//
//  Analytics.swift
//  Weike
//
//  Created by Cam on 8/25/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

import Mixpanel

// MARK: Mixpanel

let mixpanelDidSetIRI = "mixpanel/set"

// MARK: Login

let landingViewIRI = "landing"
let landingSignupIRI = "landing/signup"
let landingLoginIRI = "landing/login"

let loginViewIRI = "login"
let ResetPasswordViewIRI = "login/password_reset"
let EnterPhoneNumberViewIRI = "login/password_reset/phone"
let EnterPasscodeIRI = "login/password_reset/passcode"

// MARK: Signup

let signupViewIRI = "signup"

let phoneVerifyIRI = "phone_verify"
let phoneVerifyResendIRI = "phone_verify/resend"

// MARK: Wrappers

func registerAnalytics() {
    let token = "ff3427461722afac1dd1312b42fa7b54"
    _ = Mixpanel.sharedInstance(withToken: token)
    track(mixpanelDidSetIRI)
}

func track(_ event: String, properties: [AnyHashable: Any]? = nil) {
    let allProperties: [AnyHashable: Any] = properties == nil ? [NSObject : AnyObject]() : properties!

    Mixpanel.sharedInstance().track(event, properties: allProperties)
}
