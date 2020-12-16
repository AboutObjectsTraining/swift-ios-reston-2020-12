// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func applicationDidFinishLaunching(_ application: UIApplication) {
        window = UIWindow()
        window?.rootViewController = CoolController()
        
        window?.backgroundColor = UIColor.systemYellow
        window?.makeKeyAndVisible()
    }
}
