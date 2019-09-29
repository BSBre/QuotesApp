//
//  DesignableTextField.swift
//  AppDynamicsClientApp
//
//  Created by Bojan Savic on 5/9/19.
//  Copyright © 2019 Bojan Savic. All rights reserved.
//

import UIKit

@IBDesignable
class DesignableTextField: UITextField {
    var normalBackgroundColor: UIColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.85)
    var errorBackgroundColor: UIColor = UIColor.init(red: 1, green: 81/255, blue: 96/255, alpha: 0.85)
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.backgroundColor = normalBackgroundColor
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = normalBackgroundColor
    }
    
    // Provides left padding for images
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.leftViewRect(forBounds: bounds)
        textRect.origin.x += leftPadding
        return textRect
    }
    
    @IBInspectable var leftImage: UIImage? {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var leftPadding: CGFloat = 0
    
    @IBInspectable var color: UIColor = UIColor.lightGray {
        didSet {
            updateView()
        }
    }
    
    func updateView() {
        if let image = leftImage {
            leftViewMode = UITextField.ViewMode.always
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
            imageView.contentMode = .scaleAspectFit
            imageView.image = image
            imageView.tintColor = color
            leftView = imageView
        } else {
            leftViewMode = UITextField.ViewMode.never
            leftView = nil
        }
        attributedPlaceholder = NSAttributedString(string: placeholder != nil ?  placeholder! : "", attributes: [NSAttributedString.Key.foregroundColor: color])
    }
}
