//
//  UIView+Extensions.swift
//
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
    
    class func fromNib<T: UIView>() -> T {
        Bundle(for: T.self).loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
}
