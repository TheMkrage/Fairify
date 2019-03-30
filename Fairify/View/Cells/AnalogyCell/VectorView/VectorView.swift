//
//  VectorView.swift
//  Fairify
//
//  Created by Matthew Krager on 3/30/19.
//  Copyright © 2019 Matthew Krager. All rights reserved.
//

import UIKit
import Anchorage


class VectorView: UIView {
    
    var arrow1 = Arrow = {
        
    }()
    
    var chartImage: UIImageView = {
        let i = UIImageView()
        i.image = UIImage(named: "Chart")
        return i
    }()

    init() {
        super.init(frame: .zero)
        
        addSubview(chartImage)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        defer {
            super.updateConstraints()
        }
        chartImage.edgeAnchors == edgeAnchors
    }
}
