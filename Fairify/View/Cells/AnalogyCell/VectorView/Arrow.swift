//
//  Arrow.swift
//  Fairify
//
//  Created by Matthew Krager on 3/30/19.
//  Copyright © 2019 Matthew Krager. All rights reserved.
//

import UIKit

class Arrow: UIView {

    var color: UIColor
    
    init(frame: CGRect, color: UIColor) {
        self.color = color
        super.init(frame: frame)
        
        backgroundColor = .clear
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func animate(newFrame: CGRect, shouldAnimate: Bool, isFirst: Bool) {
        if !shouldAnimate {
            self.frame = newFrame
            return
        }
        if isFirst {
            UIView.animate(withDuration: 0.25) {
                self.frame = newFrame
            }
        } else {
            UIView.animate(withDuration: 1.5) {
                self.frame = newFrame
            }
        }
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let origin = CGPoint(x: rect.minX, y: rect.maxY)
        let topRight = CGPoint(x: rect.maxX, y: rect.minY)
        let path = UIBezierPath.bezierPathWithArrowFromPoint(startPoint: origin, endPoint: topRight, tailWidth: 1, headWidth: 8, headLength: 10)
        color.setStroke()
        color.setFill()
        path.stroke()
        path.fill()
    }
}
