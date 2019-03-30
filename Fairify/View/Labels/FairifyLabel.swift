//
//  FairifyLabel.swift
//  Fairify
//
//  Created by Matthew Krager on 3/29/19.
//  Copyright © 2019 Matthew Krager. All rights reserved.
//

import UIKit

class FairifyLabel: UILabel {

    init(fontSize: CGFloat) {
        super.init(frame: .zero)
        text = "Fairify"
        font = UIFont(name: "Arial-Black", size: fontSize)
        textColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
