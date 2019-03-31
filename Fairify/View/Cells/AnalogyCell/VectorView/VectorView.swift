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
    
    var arrowPadding: CGFloat = 4.0
    
    var staticStartArrow: Arrow = {
        let a = Arrow(frame: .zero, color: UIColor.analogyLabelGreen)
        return a
    }()
    
    var staticEndArrow: Arrow = {
        let a = Arrow(frame: .zero, color: UIColor.analogyLabelRed)
        return a
    }()
    
    var changingStartArrow: Arrow = {
        let a = Arrow(frame: .zero, color: UIColor.analogyLabelGreen)
        return a
    }()
    
    var changingEndArrow: Arrow = {
        let a = Arrow(frame: .zero, color: UIColor.analogyLabelGreen)
        return a
    }()
    
    var chartImage: UIImageView = {
        let i = UIImageView()
        i.image = UIImage(named: "Chart")
        return i
    }()
    
    var isFirstAnimation = true

    init() {
        super.init(frame: .zero)
        
        addSubview(chartImage)
        addSubview(staticStartArrow)
        addSubview(staticEndArrow)
        addSubview(changingStartArrow)
        addSubview(changingEndArrow)
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    private func checkForFirst() {
        if isFirstAnimation {
            isFirstAnimation = false
            let startingFrame = CGRect(x: arrowPadding, y: bounds.maxY - arrowPadding, width: 0, height: 0)
            staticStartArrow.frame = startingFrame
            staticEndArrow.frame = startingFrame
            changingStartArrow.frame = startingFrame
            changingEndArrow.frame = startingFrame
        }
    }
    
    private func getAdjustedFrame(point: CGPoint) -> CGRect {
        let adjustedWidth = (frame.width - arrowPadding) * point.x
        let adustedHeight = (frame.height - arrowPadding) * point.y
        return CGRect(x: arrowPadding, y: bounds.maxY - arrowPadding - adustedHeight, width: adjustedWidth, height: adustedHeight)
    }
    
    func setStaticStartArrow(point: CGPoint) {
        checkForFirst()
        staticStartArrow.animate(newFrame: getAdjustedFrame(point: point))
    }
    
    func setStaticEndArrow(point: CGPoint) {
        checkForFirst()
        staticEndArrow.animate(newFrame: getAdjustedFrame(point: point))
    }
    
    func setChangingStartArrow(point: CGPoint) {
        checkForFirst()
        changingStartArrow.animate(newFrame: getAdjustedFrame(point: point))
    }
    
    func setChangingEndArrow(point: CGPoint) {
        checkForFirst()
        changingEndArrow.animate(newFrame: getAdjustedFrame(point: point))
    }
}
