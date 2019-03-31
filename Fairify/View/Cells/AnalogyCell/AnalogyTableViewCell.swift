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
    
    var taboolaHeader: TaboolaHeader = {
        let t = TaboolaHeader()
        return t
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
    
    var fixButton: FixButton = {
        let b = FixButton()
        return b
    }()
    
    let vectorView: VectorView = {
        let v = VectorView()
        return v
    }()
    
    var learnMoreButton: UIButton = {
        let b = UIButton()
        b.backgroundColor = UIColor(named: "TaboolaButton")
        b.layer.cornerRadius = 8
        b.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 12.0)
        b.setTitle("Learn More", for: .normal)
        b.setTitleColor(.white, for: .normal)
        return b
    }()
    
    var isDisplayedTaboolaHeader: Bool {
        didSet {
            setNeedsUpdateConstraints()
        }
    }
    
    init() {
        self.isDisplayedTaboolaHeader = true
        defer {
            self.isDisplayedTaboolaHeader = true
        }
        super.init(style: .default, reuseIdentifier: "Analogy")
        backgroundColor = .clear
        selectionStyle = .none
        contentView.addSubview(cardView)
        
        cardView.addSubview(taboolaHeader)
        cardView.addSubview(staticAnalogyStartLabel)
        cardView.addSubview(staticAnalogyEndLabel)
        cardView.addSubview(changingAnalogyStartLabel)
        cardView.addSubview(changingAnalogyEndLabel)
        cardView.addSubview(isToLabel1)
        cardView.addSubview(isToLabel2)
        
        cardView.addSubview(learnMoreButton)
        cardView.addSubview(fixButton)
        cardView.addSubview(vectorView)
        
        setNeedsUpdateConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        defer {
            super.updateConstraints()
        }
        cardView.leadingAnchor == contentView.leadingAnchor + 30
        cardView.trailingAnchor == contentView.trailingAnchor - 30
        cardView.topAnchor == contentView.topAnchor + 15
        cardView.bottomAnchor == contentView.bottomAnchor - 15
        
        taboolaHeader.leadingAnchor == cardView.leadingAnchor + 20
        taboolaHeader.trailingAnchor == cardView.trailingAnchor - 20
        taboolaHeader.topAnchor == cardView.topAnchor + 15
        if isDisplayedTaboolaHeader {
            taboolaHeader.heightAnchor == 12
            taboolaHeader.isHidden = false
            learnMoreButton.isHidden = false
        } else {
            taboolaHeader.heightAnchor == 0
            taboolaHeader.isHidden = true
            learnMoreButton.isHidden = true
        }
        
        if isDisplayedTaboolaHeader {
            staticAnalogyStartLabel.topAnchor == taboolaHeader.bottomAnchor + 10
            taboolaHeader.isHidden = false
        } else {
            staticAnalogyStartLabel.topAnchor == taboolaHeader.bottomAnchor + 10
            taboolaHeader.isHidden = true
        }
        staticAnalogyStartLabel.leadingAnchor == cardView.leadingAnchor + 20
        
        changingAnalogyStartLabel.topAnchor == staticAnalogyStartLabel.bottomAnchor + 10
        changingAnalogyStartLabel.leadingAnchor == cardView.leadingAnchor + 20
        
        staticAnalogyEndLabel.topAnchor == staticAnalogyStartLabel.topAnchor
        staticAnalogyEndLabel.trailingAnchor == cardView.trailingAnchor - 20
        
        changingAnalogyEndLabel.topAnchor == staticAnalogyEndLabel.bottomAnchor + 10
        changingAnalogyEndLabel.trailingAnchor == cardView.trailingAnchor - 20
        
        isToLabel1.centerYAnchor == staticAnalogyStartLabel.centerYAnchor
        isToLabel1.centerXAnchor == cardView.centerXAnchor
        
        isToLabel2.centerYAnchor == changingAnalogyStartLabel.centerYAnchor
        isToLabel2.centerXAnchor == cardView.centerXAnchor
        
        fixButton.topAnchor == changingAnalogyEndLabel.bottomAnchor + 15
        fixButton.trailingAnchor == cardView.trailingAnchor - 20
        fixButton.heightAnchor == 55
        fixButton.widthAnchor == 55
        
        vectorView.centerYAnchor == fixButton.centerYAnchor
        vectorView.leadingAnchor == cardView.leadingAnchor + 22
        vectorView.heightAnchor == 60
        vectorView.widthAnchor == 60
        
        learnMoreButton.widthAnchor == 85
        learnMoreButton.heightAnchor == 25
        learnMoreButton.centerYAnchor == fixButton.centerYAnchor
        learnMoreButton.centerXAnchor == cardView.centerXAnchor
        
        fixButton.bottomAnchor == cardView.bottomAnchor - 15
    }
}
