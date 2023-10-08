//
//  UIView+Extension.swift
//  Catstargram
//
//  Created by 김제훈 on 2023/10/08.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}
