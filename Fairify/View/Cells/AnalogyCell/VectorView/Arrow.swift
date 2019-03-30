//
//  Arrow.swift
//  Fairify
//
//  Created by Matthew Krager on 3/30/19.
//  Copyright © 2019 Matthew Krager. All rights reserved.
//

import UIKit

class Arrow: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func animate() {
        
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let topRight = CGPoint(x: rect.maxX, y: rect.maxY)
        let path = UIBezierPath.bezierPathWithArrowFromPoint(startPoint: rect.origin, endPoint: topRight, tailWidth: 3, headWidth: 3, headLength: 3)    
        path.stroke()
    }
    
}
