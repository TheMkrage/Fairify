//
//  TextField.swift
//  Fairify
//
//  Created by Matthew Krager on 3/30/19.
//  Copyright © 2019 Matthew Krager. All rights reserved.
//

import UIKit

class TextField: UITextField {

    init() {
        super.init(frame: .zero)
        
        font = UIFont(name: "HelveticaNeue-Bold", size: 16.0)
        textColor = .white
        textAlignment = .center
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 4.0
        layer.cornerRadius = 14.0
    }
}
