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
    
    var staticAnalogyStartLabel: AnalogyLabel = {
        let l = AnalogyLabel(state: .normal)
        l.textAlignment = .right
        return l
    }()
    
    var staticAnalogyEndLabel: AnalogyLabel = {
        let l = AnalogyLabel(state: .normal)
        l.textAlignment = .left
        return l
    }()
    
    var changingAnalogyStartLabel: AnalogyLabel = {
        let l = AnalogyLabel(state: .normal)
        l.textAlignment = .right
        return l
    }()
    
    var changingAnalogyEndLabel: AnalogyLabel = {
        let l = AnalogyLabel(state: .red)
        l.textAlignment = .left
        return l
    }()
    
    var isToLabel1: UILabel = {
        let l = UILabel()
        l.textColor = .black
        l.text = "is to"
        l.textAlignment = .center
        l.font = UIFont(name: "HelveticaNeue-Thin", size: 14.0)
        return l
    }()
    
    var isToLabel2: UILabel = {
        let l = UILabel()
        l.textColor = .black
        l.text = "is to"
        l.textAlignment = .center
        l.font = UIFont(name: "HelveticaNeue-Thin", size: 14.0)
        return l
    }()
    
    var fixButton: UIButton = {
        let b = UIButton()
        b.setTitle("Fix", for: .normal)
        return b
    }()
    
    init(analogy: Analogy) {
        super.init(style: .default, reuseIdentifier: "Analogy")
        
        backgroundColor = .clear
        selectionStyle = .none
        addSubview(cardView)
        
        cardView.addSubview(staticAnalogyStartLabel)
        cardView.addSubview(staticAnalogyEndLabel)
        cardView.addSubview(changingAnalogyStartLabel)
        cardView.addSubview(changingAnalogyEndLabel)
        cardView.addSubview(isToLabel1)
        cardView.addSubview(isToLabel2)
        
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
        
        staticAnalogyStartLabel.topAnchor == cardView.topAnchor + 20
        staticAnalogyStartLabel.leadingAnchor == cardView.leadingAnchor + 20
        
        changingAnalogyStartLabel.topAnchor == staticAnalogyStartLabel.bottomAnchor + 10
        changingAnalogyStartLabel.leadingAnchor == cardView.leadingAnchor + 20
        
        staticAnalogyEndLabel.topAnchor == cardView.topAnchor + 20
        staticAnalogyEndLabel.trailingAnchor == cardView.trailingAnchor - 20
        
        changingAnalogyEndLabel.topAnchor == staticAnalogyEndLabel.bottomAnchor + 10
        changingAnalogyEndLabel.trailingAnchor == cardView.trailingAnchor - 20
        
        isToLabel1.centerYAnchor == staticAnalogyStartLabel.centerYAnchor
        isToLabel1.centerXAnchor == cardView.centerXAnchor
        
        isToLabel2.centerYAnchor == changingAnalogyStartLabel.centerYAnchor
        isToLabel2.centerXAnchor == cardView.centerXAnchor
        
        cardView.bottomAnchor == changingAnalogyEndLabel.bottomAnchor + 20
    }
}
