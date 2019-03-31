//
//  Button.swift
//  Fairify
//
//  Created by Matthew Krager on 3/31/19.
//  Copyright © 2019 Matthew Krager. All rights reserved.
//

import UIKit

class Button: UIButton {

    init() {
        super.init(frame: .zero)
        isUserInteractionEnabled = true
        setTitleColor(.white, for: .normal)
        backgroundColor = UIColor.fixButtonGreen
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 1.0, height: 2.0)
        layer.shadowOpacity = 1
        layer.shadowRadius = 4.0
        layer.borderColor = UIColor.fixButtonFill.cgColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.borderWidth = 7.0
        layer.cornerRadius = 20.0
    }
}
