//
//  TaboolaHeader.swift
//  Fairify
//
//  Created by Matthew Krager on 3/30/19.
//  Copyright © 2019 Matthew Krager. All rights reserved.
//

import UIKit
import Anchorage

class TaboolaHeader: UIView {
    
    let poweredByLabel: UILabel = {
        let l = UILabel()
        l.textColor = .lightGray
        l.text = "Powered By"
        l.textAlignment = .left
        l.font = UIFont(name: "HelveticaNeue", size: 10.0)
        return l
    }()
    
    let taboolaImageView: UIImageView = {
        let i = UIImageView(image: UIImage(named: "Taboola"))
        return i
    }()
    
    let lineView: UIImageView = {
        let i = UIImageView(image: UIImage(named: "Line"))
        return i
    }()
    
    init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(poweredByLabel)
        addSubview(taboolaImageView)
        addSubview(lineView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        defer {
            super.updateConstraints()
        }
        poweredByLabel.centerYAnchor == centerYAnchor
        poweredByLabel.leadingAnchor == leadingAnchor
        poweredByLabel.topAnchor == topAnchor
        poweredByLabel.widthAnchor == 58
        poweredByLabel.heightAnchor == taboolaImageView.heightAnchor
        
        taboolaImageView.centerYAnchor == poweredByLabel.centerYAnchor
        taboolaImageView.leadingAnchor == poweredByLabel.trailingAnchor
        taboolaImageView.widthAnchor == 53
        
        lineView.centerYAnchor == poweredByLabel.centerYAnchor
        lineView.leadingAnchor == taboolaImageView.trailingAnchor + 5
        lineView.trailingAnchor == trailingAnchor
    }
}
