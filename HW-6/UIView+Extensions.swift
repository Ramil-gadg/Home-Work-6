//
//  UIView+Extensions.swift
//  delta-ohrana
//
//  Created by Sergey Nazarov on 11.01.2022.
//  
//

import UIKit

extension UIView {
    
    public func addSubviews(_ views: UIView...) {
        for view in views {
            self.addSubview(view)
        }
    }
    
    func updateConstraint(_ attribute: NSLayoutConstraint.Attribute, to constant: CGFloat) {
        for constraint in constraints where constraint.firstAttribute == attribute {
            constraint.constant = constant
        }
    }
}
