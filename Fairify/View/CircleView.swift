//
//  CircleView.swift
//  Fairify
//
//  Created by Matthew Krager on 3/30/19.
//  Copyright © 2019 Matthew Krager. All rights reserved.
//

import UIKit
import Anchorage

class CircleView: UIView {
    
    var percentLabel: UILabel = {
        let l = UILabel()
        l.font = UIFont(name: "HelveticaNeue-Bold", size: 24.0)
        l.textAlignment = .center
        l.textColor = .white
        return l
    }()
    
    var fairifyLabel: UILabel = {
        let l = UILabel()
        l.textAlignment = .center
        l.text = "Fairify Score"
        l.font = UIFont(name: "HelveticaNeue", size: 12.0)
        l.textColor = .white
        return l
    }()
    
    lazy var stackView: UIStackView = {
        let s = UIStackView()
        s.addArrangedSubview(percentLabel)
        s.addArrangedSubview(fairifyLabel)
        s.axis = .vertical
        return s
    }()

    init(percent: Int) {
        super.init(frame: .zero)
        
        percentLabel.text = "\(percent)%"
        
        layer.borderWidth = 5.0
        layer.borderColor = UIColor.white.cgColor
        
        addSubview(stackView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.height/2.0
    }
    
    override func updateConstraints() {
        defer {
            super.updateConstraints()
        }
        stackView.centerAnchors == centerAnchors
    }
}
