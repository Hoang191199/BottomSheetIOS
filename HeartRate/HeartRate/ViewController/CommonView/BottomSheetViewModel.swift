//
//  BottomSheetViewModel.swift
//  HeartRate
//
//  Created by Phạm Hoàng on 29/8/24.
//

import Foundation
import UIKit

public struct BRQBottomSheetViewModel: BRQBottomSheetPresentable {
    
    public var height: CGFloat?
    public var cornerRadius: CGFloat
    public var animationTransitionDuration: TimeInterval
    public var barrierDismissible: Bool
    
    public init() {
        cornerRadius = 20
        animationTransitionDuration = 0.3
        barrierDismissible = true
    }
    
    public init(
        cornerRadius: CGFloat,
        animationTransitionDuration: TimeInterval,
        backgroundColor: UIColor?,
        barrierDismissible: Bool,
        height: CGFloat?
    ){
        self.cornerRadius = cornerRadius
        self.animationTransitionDuration = animationTransitionDuration
        self.barrierDismissible = barrierDismissible
        self.height = height ?? nil
    }
}
