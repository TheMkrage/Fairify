//
//  AnalogyLabel.swift
//  Fairify
//
//  Created by Matthew Krager on 3/30/19.
//  Copyright © 2019 Matthew Krager. All rights reserved.
//

import UIKit

enum AnalogyLabelState {
    case normal, red, green
}

class AnalogyLabel: UILabel {
    
    var state: AnalogyLabelState {
        didSet {
            updateAppearance()
        }
    }
    
    private func updateAppearance() {
        switch state {
        case .normal:
            textColor = .black
        case .red:
            textColor = .analogyLabelRed
        case .green:
            textColor = .analogyLabelGreen
        }
    }

    init(state: AnalogyLabelState) {
        self.state = state
        super.init(frame: .zero)
        
        text = text
        font = UIFont(name: "HelveticaNeue-Bold", size: 18.0)
        
        updateAppearance()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
