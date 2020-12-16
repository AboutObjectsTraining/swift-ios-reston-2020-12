// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import UIKit

class CoolController: UIViewController {

    override func loadView() {
        view = UIView()
        view.backgroundColor = UIColor.brown
        
        let cell1 = CoolViewCell(frame: CGRect(x: 20, y: 60, width: 200, height: 40))
        let cell2 = CoolViewCell(frame: CGRect(x: 50, y: 120, width: 200, height: 40))
        
        view.addSubview(cell1)
        view.addSubview(cell2)
        
        cell1.text = "Hello World! 🌍🌎🌏"
        cell2.text = "Cool Cells Rock! 🥂🍾"
        
        cell1.backgroundColor = UIColor.systemPurple
        cell2.backgroundColor = UIColor.systemOrange
    }
}
