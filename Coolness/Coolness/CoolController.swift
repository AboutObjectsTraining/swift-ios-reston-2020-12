// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import UIKit

class CoolController: UIViewController {

    override func loadView() {
        view = UIView()
        view.backgroundColor = UIColor.brown
        
        let screenRect = UIScreen.main.bounds
        let (accessoryRect, contentRect) = screenRect.divided(atDistance: 90, from: .minYEdge)
        
        let accessoryView = UIView(frame: accessoryRect)
        let contentView = UIView(frame: contentRect)
        
        contentView.clipsToBounds = true
        
        view.addSubview(accessoryView)
        view.addSubview(contentView)
        
        accessoryView.backgroundColor = UIColor(white: 1, alpha: 0.6)
        contentView.backgroundColor = UIColor(white: 1, alpha: 0.4)
        
        
        // Cool Cells
        let cell1 = CoolViewCell(frame: CGRect(x: 20, y: 60, width: 200, height: 40))
        let cell2 = CoolViewCell(frame: CGRect(x: 50, y: 120, width: 200, height: 40))
        
        contentView.addSubview(cell1)
        contentView.addSubview(cell2)
        
        cell1.text = "Hello World! 🌍🌎🌏"
        cell2.text = "Cool Cells Rock! 🥂🍾"
        
        cell1.backgroundColor = UIColor.systemPurple
        cell2.backgroundColor = UIColor.systemOrange
    }
}
