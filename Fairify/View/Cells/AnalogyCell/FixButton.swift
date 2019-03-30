//
//  FixButton.swift
//  Fairify
//
//  Created by Matthew Krager on 3/30/19.
//  Copyright © 2019 Matthew Krager. All rights reserved.
//

import UIKit

class FixButton: UIButton {

    init() {
        super.init(frame: .zero)
        
        isUserInteractionEnabled = true
        setTitle("Fix", for: .normal)
        setTitleColor(.fixButtonGreen, for: .normal)
        titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
        
        clipsToBounds = true
        backgroundColor = .fixButtonFill
        
        layer.borderWidth = 5.0
        layer.borderColor = UIColor.fixButtonGreen?.cgColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.height/2.0
    }
    
    func showCheck() {
        setTitle("", for: .normal)
        setImage(UIImage(named: "check"), for: .normal)
    }
}
