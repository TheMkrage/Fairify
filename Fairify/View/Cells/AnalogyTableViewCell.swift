//
//  AnalogyTableViewCell.swift
//  Fairify
//
//  Created by Matthew Krager on 3/30/19.
//  Copyright © 2019 Matthew Krager. All rights reserved.
//

import UIKit
import Anchorage

class AnalogyTableViewCell: UITableViewCell {
    
    var cardView: CardView = {
        let c = CardView()
        return c
    }()
    
    init(analogy: Analogy) {
        super.init(style: .default, reuseIdentifier: "Analogy")
        
        selectionStyle = .none
        addSubview(cardView)
        
        setNeedsUpdateConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        defer {
            super.updateConstraints()
        }
        cardView.leadingAnchor == leadingAnchor + 30
        cardView.trailingAnchor == trailingAnchor - 30
        cardView.topAnchor == topAnchor + 15
        cardView.bottomAnchor == bottomAnchor - 15
    }
}
