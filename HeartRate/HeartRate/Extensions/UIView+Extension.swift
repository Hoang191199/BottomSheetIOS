//
//  UIView+Extension.swift
//  PrankApp
//
//  Created by QueNguyen on 28/06/2024.
//

import Foundation
import UIKit

extension UIView {
    func setDropShadown() {
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor(red: 80/255, green: 153/255, blue: 255/255, alpha: 0.25).cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 3.0
    }
    
    func setDropShadown2() {
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor(hex: "#5896F7")?.withAlphaComponent(0.12).cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 8.0
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return self.layer.borderWidth
        }
        set {
            self.layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            if let color = self.layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                self.layer.borderColor = color.cgColor
            } else {
                self.layer.borderColor = nil
            }
        }
    }
    
    @IBInspectable var shadowBlur: CGFloat {
        get {
            return self.layer.shadowRadius * 2.0
        }
        set {
            self.layer.shadowRadius = newValue / 2.0
        }
    }
    
    @IBInspectable var shadowColor: UIColor? {
        get {
            if let color = self.layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                self.layer.shadowColor = color.cgColor
                self.layer.shadowOpacity = 1.0
            } else {
                self.layer.shadowColor = nil
                self.layer.shadowOpacity = 0.0
            }
        }
    }
    
    func showToast(message: String, font: UIFont = UIFont.systemFont(ofSize: 14.0), duration: Double = 2.0, backgroundColorToast: UIColor? = nil) {
        let toastLabel = UILabel()
        toastLabel.translatesAutoresizingMaskIntoConstraints = false
        toastLabel.backgroundColor = backgroundColorToast == nil ? ColorsGen.red.color.withAlphaComponent(0.6) : backgroundColorToast
        toastLabel.styleFont(text: message, textColor: UIColor.white, fontSize: 14, textAligment: .center, numOfLines: 0 ,weight: .Bold)
        toastLabel.alpha = 0.0
        toastLabel.layer.cornerRadius = 10
        toastLabel.clipsToBounds = true
        
        self.addSubview(toastLabel)
        
        // Constraints
        let horizontalPadding: CGFloat = 20.0
        let verticalPadding: CGFloat = 20.0
        
        NSLayoutConstraint.activate([
            toastLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: horizontalPadding),
            toastLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -horizontalPadding),
            toastLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 40),
            toastLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 35)
        ])
        
        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseIn, animations: {
            toastLabel.alpha = 1.0
        }, completion: { _ in
            UIView.animate(withDuration: 0.5, delay: duration, options: .curveEaseOut, animations: {
                toastLabel.alpha = 0.0
            }, completion: { _ in
                toastLabel.removeFromSuperview()
            })
        })
    }
    
    func addShadow(
        color: UIColor,
        opacity: Float = 1,
        offset: CGSize = CGSize(width: 0, height: 2),
        radius: CGFloat = 1
    ){
        // shadow
        self.layer.masksToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = offset
        self.layer.shadowRadius = radius
    }
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let roundedLayer = CAShapeLayer()
        roundedLayer.path = UIBezierPath(
            roundedRect: bounds,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
            ).cgPath
        layer.mask = roundedLayer
    }
    
    func fadeTo(
        _ alpha: CGFloat,
        duration: TimeInterval = 0.3,
        delay: TimeInterval = 0,
        completion: (() -> Void)? = nil) {
        
        UIView.animate(
            withDuration: duration,
            delay: delay,
            options: .curveEaseInOut,
            animations: {
                self.alpha = alpha
        },
            completion: nil
        )
        
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            completion?()
        }
    }
    
    func fadeIn(duration: TimeInterval = 0.3, delay: TimeInterval = 0, completion: (() -> Void)? = nil) {
        fadeTo(1, duration: duration, delay: delay, completion: completion)
    }
    
    func fadeOut(duration: TimeInterval = 0.3, delay: TimeInterval = 0, completion: (() -> Void)? = nil) {
        fadeTo(0, duration: duration, delay: delay, completion: completion)
    }
}

extension CALayer {
    func applySketchShadow(
        color: UIColor = .black,
        alpha: Float = 0.5,
        x: CGFloat = 0,
        y: CGFloat = 2,
        blur: CGFloat = 4,
        spread: CGFloat = 0)
    {
        masksToBounds = false
        shadowColor = color.cgColor
        shadowOpacity = alpha
        shadowOffset = CGSize(width: x, height: y)
        shadowRadius = blur / 2.0
        if spread == 0 {
            shadowPath = nil
        } else {
            let dx = -spread
            let rect = bounds.insetBy(dx: dx, dy: dx)
            shadowPath = UIBezierPath(rect: rect).cgPath
        }
    }
}

public extension UIViewController {
    func presentBottomSheet(_ bottomSheet: BottomSheetViewController, completion: (() -> Void)?) {
        self.present(bottomSheet, animated: false, completion: completion)
    }
}
