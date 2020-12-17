// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func applicationDidFinishLaunching(_ application: UIApplication) {
        window = UIWindow()
        window?.rootViewController = CoolController(nibName: "CoolStuff", bundle: nil)
        
        window?.backgroundColor = UIColor.systemYellow
        window?.makeKeyAndVisible()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("In \(#function) in \(type(of: self))")
    }
    
//    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        let touch = touches.first
//        guard
//            let currLocation = touch?.location(in: nil),
//            let prevLocation = touch?.previousLocation(in: nil)
//        else {
//            return
//        }
//        
//        let dx = currLocation.x - prevLocation.x
//        let dy = currLocation.y - prevLocation.y
//        
//        touch?.view?.frame.origin.x += dx
//        touch?.view?.frame.origin.y += dy
//    }
}
