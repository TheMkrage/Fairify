//
//  ProgressBar.swift
//  Fairify
//
//  Created by Matthew Krager on 3/30/19.
//  Copyright © 2019 Matthew Krager. All rights reserved.
//

import UIKit

class ProgressBar: UIView {
    
    var percent: Int {
        didSet {
            layoutIfNeeded()
        }
    }
    
    init(percent: Int) {
        self.percent = percent
        super.init(frame: .zero)
        layer.cornerRadius = 14.0
        clipsToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let floatRep = Double(self.percent) / 100.0
        let gradient: CAGradientLayer = CAGradientLayer()
        
        let padding = 0.20
        
        gradient.colors = [UIColor.progressBarGreen.cgColor, UIColor.progressBarRed.cgColor]
        gradient.locations = [0.0 , 1.00]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: floatRep + padding, y: 0.5)
        gradient.frame = CGRect(x: 0.0, y: 0.0, width: self.frame.size.width, height: self.frame.size.height)
        
        layer.insertSublayer(gradient, at: 0)
    }
}
