// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import UIKit

private let textInsets = UIEdgeInsets(top: 7, left: 12, bottom: 8, right: 12)
private let textOrigin = CGPoint(x: textInsets.left, y: textInsets.top)

class CoolViewCell: UIView {
    
    var highlighted: Bool = false {
        didSet { alpha = highlighted ? 0.5 : 1.0 }
    }
    
    var text: String? {
        didSet { sizeToFit() }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLayer()
        configureGestureRecognizers()
    }
    
    // FIXME: Implement me!
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Configuring cells
extension CoolViewCell
{
    private func configureGestureRecognizers() {
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(bounce))
        recognizer.numberOfTapsRequired = 2
        addGestureRecognizer(recognizer)
    }
    
    private func configureLayer() {
        layer.borderWidth = 3
        layer.borderColor = UIColor.white.cgColor
        layer.cornerRadius = 10
        layer.masksToBounds = true
    }
}

// MARK: - Animation

extension CoolViewCell
{
    @objc private func bounce() {
        print("In \(#function)")
        animateBounce(duration: 1, size: CGSize(width: 120, height: 240))
    }
    
    private func animateBounce(duration: TimeInterval, size: CGSize) {
        UIView.animate(withDuration: duration,
                       animations: { self.configureBounce(size: size) },
                       completion: { _ in self.transform = .identity  })
    }
    
    private func configureBounce(size: CGSize) {
        UIView.modifyAnimations(withRepeatCount: 5, autoreverses: true) {
            let translation = CGAffineTransform(translationX: size.width, y: size.height)
            self.transform = translation.rotated(by: .pi / 2)
        }
    }
}
    
// MARK: - Drawing and resizing
extension CoolViewCell
{
    class var textAttributes: [NSAttributedString.Key: Any] {
        return [.font: UIFont.boldSystemFont(ofSize: 20),
                .foregroundColor: UIColor.white]
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        guard let text = text else { return size }
        var newSize = (text as NSString).size(withAttributes: type(of: self).textAttributes)
        newSize.width += textInsets.left + textInsets.right
        newSize.height += textInsets.top + textInsets.bottom
        return newSize
    }
    
    override func draw(_ rect: CGRect) {
        guard let text = text else { return }
        (text as NSString).draw(at: textOrigin, withAttributes: type(of: self).textAttributes)
    }
}
    
// MARK: - UIResponder methods
extension CoolViewCell
{
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        superview?.bringSubviewToFront(self)
        highlighted = true
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        guard
            let currLocation = touch?.location(in: nil),
            let prevLocation = touch?.previousLocation(in: nil)
        else {
            return
        }
        
        let dx = currLocation.x - prevLocation.x
        let dy = currLocation.y - prevLocation.y
        
        frame.origin.x += dx
        frame.origin.y += dy
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        highlighted = false
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        highlighted = false
    }
}
