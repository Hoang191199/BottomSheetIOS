//
//  Circular.swift
//  HeartRate
//
//  Created by Phạm Hoàng on 27/8/24.
//

import Foundation
import UIKit
import QuartzCore
import Reusable

class Circular: UIView, NibOwnerLoadable {
    
    private var progressLayer = CAShapeLayer()
    private var tracklayer = CAShapeLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        loadNibContent()
        self.configureProgressViewToBeCircular()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        loadNibContent()
        self.configureProgressViewToBeCircular()
    }
    
    var setProgressColor: UIColor = UIColor.red {
        didSet {
            progressLayer.strokeColor = setProgressColor.cgColor
        }
    }
    
    var setTrackColor: UIColor = UIColor.white {
        didSet {
            tracklayer.strokeColor = setTrackColor.cgColor
        }
    }
    /**
     A path that consists of straight and curved line segments that you can render in your custom views.
     Meaning our CAShapeLayer will now be drawn on the screen with the path we have specified here
     */
    private var viewCGPath: CGPath? {
        let center = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
        let radius = (min(frame.size.width, frame.size.height) - 1.5) / 2
        return UIBezierPath(
            arcCenter: center,
            radius: radius,
            startAngle: CGFloat(-0.5 * Double.pi),
            endAngle: CGFloat(1.5 * Double.pi),
            clockwise: true).cgPath
    }
    
    private func configureProgressViewToBeCircular() {
        self.drawsView(using: tracklayer, startingPoint: 20.0, ending: 1.0)
        self.drawsView(using: progressLayer, startingPoint: 20.0, ending: 0.0)
    }
    
    private func drawsView(using shape: CAShapeLayer, startingPoint: CGFloat, ending: CGFloat) {
        self.backgroundColor = UIColor.clear
        self.layer.cornerRadius = self.frame.size.width/2.0
        
        shape.path = self.viewCGPath
        shape.fillColor = UIColor.clear.cgColor
        shape.strokeColor = setProgressColor.cgColor
        shape.lineWidth = startingPoint
        shape.strokeEnd = ending
        shape.lineCap = .round
        
        self.layer.addSublayer(shape)
    }
    
    func setProgressWithAnimation(duration: TimeInterval, value: Float) {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = duration

        animation.fromValue = progressLayer.strokeEnd
        animation.toValue = value
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)

        progressLayer.strokeEnd = CGFloat(value)
        progressLayer.add(animation, forKey: "animateCircle")
    }
}
