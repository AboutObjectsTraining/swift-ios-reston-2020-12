// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import UIKit

extension CoolController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("In \(#function)")
        textField.resignFirstResponder()
        return true
    }
}

class CoolController: UIViewController {
    
    @IBOutlet private var textField: UITextField?
    @IBOutlet private var contentView: UIView?
    
    @IBAction private func addCell() {
        print("In \(#function), text is \(textField?.text ?? "")")
        let newCell = CoolViewCell()
        newCell.text = textField?.text
        contentView?.addSubview(newCell)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("In \(#function) in \(type(of: self))")
        super.touchesBegan(touches, with: event)
    }
}


// MARK: - Unused loadView examples
extension CoolController
{
    func loadView1() {
        Bundle.main.loadNibNamed("CoolStuff", owner: self)
    }
    
    func loadView2() {
        let topLevelObjs = Bundle.main.loadNibNamed("CoolStuff", owner: nil)
        view = topLevelObjs?.first as? UIView
    }

    func loadView_original() {
        view = UIView()
        view.backgroundColor = UIColor.brown
        
        let screenRect = UIScreen.main.bounds
        let (accessoryRect, contentRect) = screenRect.divided(atDistance: 90, from: .minYEdge)
        
        let accessoryView = UIView(frame: accessoryRect)
        let contentView = UIView(frame: contentRect)
        
        self.contentView = contentView
        
        contentView.clipsToBounds = true
        
        view.addSubview(accessoryView)
        view.addSubview(contentView)
        
        accessoryView.backgroundColor = UIColor(white: 1, alpha: 0.6)
        contentView.backgroundColor = UIColor(white: 1, alpha: 0.4)
        
        // Controls
        
        textField = UITextField(frame: CGRect(x: 15, y: 50, width: 240, height: 30))
        accessoryView.addSubview(textField!)
        textField?.placeholder = "Enter a label"
        textField?.borderStyle = .roundedRect
        textField?.clearButtonMode = .whileEditing
        
        textField?.delegate = self
        
        let button = UIButton(type: .system)
        accessoryView.addSubview(button)
        button.setTitle("Add Cell", for: .normal)
        button.sizeToFit()
        button.frame = button.frame.offsetBy(dx: 265, dy: 50)
        
        button.addTarget(self, action: #selector(addCell), for: .touchUpInside)
        
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
