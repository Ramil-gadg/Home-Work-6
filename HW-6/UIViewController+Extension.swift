//
//  UIViewController+Extension.swift
//
//  
//

import UIKit

let statusBarManager = (UIApplication.shared.delegate as? SceneDelegate)?.window?.windowScene?.statusBarManager

extension UIViewController {

    /**
     *  Height of status bar + navigation bar (if navigation bar exist)
     */

    var topbarHeight: CGFloat? {
        (statusBarManager?.statusBarFrame.size.height ?? 0.0) + (self.navigationController?.navigationBar.frame.height ?? 0.0)
    }
}
