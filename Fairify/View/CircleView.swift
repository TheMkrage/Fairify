//
//  CircleView.swift
//  Fairify
//
//  Created by Matthew Krager on 3/30/19.
//  Copyright © 2019 Matthew Krager. All rights reserved.
//

import UIKit

class CircleView: UIView {
    
    lazy var stackView: UIStackView = {
        let s = UIStackView()
        return s
    }()

    init(percent: Double) {
        super.init(frame: .zero)
        
        layer.borderWidth = 5.0
        layer.borderColor = UIColor.white.cgColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.height/2.0
    }
}
