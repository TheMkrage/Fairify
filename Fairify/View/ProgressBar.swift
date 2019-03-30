//
//  ProgressBar.swift
//  Fairify
//
//  Created by Matthew Krager on 3/30/19.
//  Copyright © 2019 Matthew Krager. All rights reserved.
//

import UIKit

class ProgressBar: UIView {
    
    init() {
        super.init(frame: .zero)
        layer.cornerRadius = 14.0
        clipsToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let gradient: CAGradientLayer = CAGradientLayer()
        
        gradient.colors = [UIColor.progressBarGreen.cgColor, UIColor.progressBarRed.cgColor]
        gradient.locations = [0.0 , 1.00]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradient.frame = CGRect(x: 0.0, y: 0.0, width: self.frame.size.width, height: self.frame.size.height)
        
        layer.insertSublayer(gradient, at: 0)
    }
}
