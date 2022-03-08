//
//  UIStackView+Extension.swift
//  Global24
//
//

import UIKit
import Foundation

// swiftlint:disable all
extension UIStackView {
    
    func addArrangedSubviews(_ views: UIView...) {
        for v in views {
            self.addArrangedSubview(v)
        }
    }

    func addSpacing(_ spacing: CGFloat, after arrangedSubview: UIView) {
        let index = arrangedSubviews.firstIndex(of: arrangedSubview)

        if let index = index, arrangedSubviews.count > (index + 1), arrangedSubviews[index + 1].accessibilityIdentifier == "spacer" {

            arrangedSubviews[index + 1].updateConstraint(axis == .horizontal ? .width : .height, to: spacing)
        } else {
            let separatorView = UIView(frame: .zero)
            separatorView.accessibilityIdentifier = "spacer"
            separatorView.translatesAutoresizingMaskIntoConstraints = false

            switch axis {
            case .horizontal:
                separatorView.widthAnchor.constraint(equalToConstant: spacing).isActive = true
            case .vertical:
                separatorView.heightAnchor.constraint(equalToConstant: spacing).isActive = true
            @unknown default:
                return
            }
            if let index = index {
                insertArrangedSubview(separatorView, at: index + 1)
            }
        }
    }

    func addSpacing(_ spacing: CGFloat, before arrangedSubview: UIView) {
        let index = arrangedSubviews.firstIndex(of: arrangedSubview)

        if let index = index, index > 0, arrangedSubviews[index - 1].accessibilityIdentifier == "spacer" {

            let previousSpacer = arrangedSubviews[index - 1]

            switch axis {
            case .horizontal:
                previousSpacer.updateConstraint(.width, to: spacing)
            case .vertical:
                previousSpacer.updateConstraint(.height, to: spacing)
            @unknown default: return // Incase NSLayoutConstraint.Axis is extended in future
            }
        } else {
            let separatorView = UIView(frame: .zero)
            separatorView.accessibilityIdentifier = "spacer"
            separatorView.translatesAutoresizingMaskIntoConstraints = false

            switch axis {
            case .horizontal:
                separatorView.widthAnchor.constraint(equalToConstant: spacing).isActive = true
            case .vertical:
                separatorView.heightAnchor.constraint(equalToConstant: spacing).isActive = true
            @unknown default:
                return
            }
            if let index = index {
                insertArrangedSubview(separatorView, at: max(index, 0))
            }
        }
    }

    func removeSpacing(after arrangedSubview: UIView) {
        if let index = arrangedSubviews.firstIndex(of: arrangedSubview), arrangedSubviews.count > (index + 1), arrangedSubviews[index + 1].accessibilityIdentifier == "spacer" {
            let spacingView = arrangedSubviews[index + 1]
            self.removeArrangedSubview(spacingView)
            spacingView.removeFromSuperview()
        }
    }

    func removeSpacing(before arrangedSubview: UIView) {
        if let index = arrangedSubviews.firstIndex(of: arrangedSubview), index > 0, arrangedSubviews[index - 1].accessibilityIdentifier == "spacer" {
            let spacingView = arrangedSubviews[index - 1]
            self.removeArrangedSubview(spacingView)
            spacingView.removeFromSuperview()
        }
    }
    
    func setBackgroundColor(_ backgroundColor: UIColor) {
        let bgView = getOrCreateBgView()
        bgView.backgroundColor = backgroundColor
    }
    
    func setCornerRadius(_ cornerRadius: CGFloat) {
        let bgView = getOrCreateBgView()
        bgView.layer.cornerRadius = cornerRadius
    }
    
    private func getOrCreateBgView() -> UIView {
        let bgView: UIView
        if !subviews.isEmpty, subviews[0].accessibilityIdentifier == "bgView" {
            bgView = subviews[0]
        } else {
            bgView = UIView(frame: bounds)
            bgView.accessibilityIdentifier = "bgView"
            bgView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            insertSubview(bgView, at: 0)
        }
        return bgView
    }
}
