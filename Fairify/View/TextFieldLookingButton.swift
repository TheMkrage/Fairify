//
//  TextFieldLookingButton.swift
//  Fairify
//
//  Created by Matthew Krager on 3/30/19.
//  Copyright © 2019 Matthew Krager. All rights reserved.
//

import UIKit

class TextFieldLookingButton: UIButton {
    
    var isGreenMode: Bool = true {
        didSet {
            if isGreenMode {
                setTitleColor(UIColor.fixButtonFill, for: .normal)
                setTitle("Calculate", for: .normal)
                backgroundColor = UIColor.fixButtonGreen
                layer.borderColor = UIColor.fixButtonFill.cgColor
            } else {
                setTitleColor(.white, for: .normal)
                backgroundColor = UIColor.clear
                layer.borderColor = UIColor.white.cgColor
            }
        }
    }

    init() {
        super.init(frame: .zero)
        titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 16.0)
        setTitleColor(UIColor.fixButtonFill, for: .normal)
        setTitle("Calculate", for: .normal)
        backgroundColor = UIColor.fixButtonGreen
        layer.borderColor = UIColor.fixButtonFill.cgColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.borderWidth = 4.0
        layer.cornerRadius = 14.0
    }
}
