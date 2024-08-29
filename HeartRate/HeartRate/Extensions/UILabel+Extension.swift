//
//  UILabel+Extension.swift
//  PrankApp
//
//  Created by Que Nguyen on 23/06/2024.
//

import Foundation
import UIKit

enum CustomFontWeight: String {
    case Regular
    case Light
    case Medium
    case SemiBold
    case Thin
    case Black
    case Bold
    case ExtraBold
    case ExtraLight
}

extension UILabel {
    func configText(_ title: String, weight: CustomFontWeight, color: UIColor?, size: CGFloat?) {
        text = title
        font = UIFont(name: "Poppins-\(weight.rawValue)", size: size ?? 20)
        textColor = color ?? UIColor(hex: "#444250")
    }
    
    func styleFont(
        text: String,
        textColor: UIColor = ColorsGen.textBlack.color,
        fontSize: Float = 16,
        textAligment: NSTextAlignment = .left,
        numOfLines: Int = 0,
        weight: CustomFontWeight
    ){
        self.text = text
        self.textColor = textColor
        self.textAlignment = textAligment
        self.numberOfLines = numOfLines
        switch weight {
        case .Regular :
            self.font = UIFont(
                name: FontFamily.Poppins.regular.name,
                size: CGFloat(fontSize))
        case .Light:
            self.font = UIFont(
                name: FontFamily.Poppins.regular.name,
                size: CGFloat(fontSize))
        case .Medium:
            self.font = UIFont(
                name: FontFamily.Poppins.medium.name,
                size: CGFloat(fontSize))
        case .SemiBold:
            self.font = UIFont(
                name: FontFamily.Poppins.bold.name,
                size: CGFloat(fontSize))
        case .Thin:
            self.font = UIFont(
                name: FontFamily.Poppins.regular.name,
                size: CGFloat(fontSize))
        case .Black:
            self.font = UIFont(
                name: FontFamily.Poppins.semiBold.name,
                size: CGFloat(fontSize))
        case .Bold:
            self.font = UIFont(
                name: FontFamily.Poppins.bold.name,
                size: CGFloat(fontSize))
        case .ExtraBold:
            self.font = UIFont(
                name: FontFamily.Poppins.extraBold.name,
                size: CGFloat(fontSize))
        case .ExtraLight:
            self.font = UIFont(
                name: FontFamily.Poppins.extraBold.name,
                size: CGFloat(fontSize))
        }
        
    }
}
