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



// MARK: Wrappers

func registerAnalytics() {
    let token = "ff3427461722afac1dd1312b42fa7b54"
    _ = Mixpanel.sharedInstance(withToken: token)
    track(event: mixpanelDidSetIRI)
}

func track(event: String, properties: [NSObject : AnyObject]? = nil) {
    let allProperties: [NSObject : AnyObject] = properties == nil ? [NSObject : AnyObject]() : properties!

    Mixpanel.sharedInstance().track(event, properties: allProperties)
}
