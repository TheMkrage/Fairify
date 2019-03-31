//
//  Analogy.swift
//  Fairify
//
//  Created by Matthew Krager on 3/30/19.
//  Copyright © 2019 Matthew Krager. All rights reserved.
//

import UIKit

class Analogy: Codable {
    
    var staticStartAnalogy: String
    var staticEndAnalogy: String
    var changingStartAnalogy: String
    var changingEndAnalogy: String
    
    var taboolaUrl: String?

    // Before Vectors
    var staticStartVectorBeforeX: CGFloat
    var staticStartVectorBeforeY: CGFloat
    var staticEndVectorBeforeX: CGFloat
    var staticEndVectorBeforeY: CGFloat
    var changingStartVectorBeforeX: CGFloat
    var changingStartVectorBeforeY: CGFloat
    var changingEndVectorBeforeX: CGFloat
    var changingEndVectorBeforeY: CGFloat
    // After Vectors
    var staticStartVectorAfterX: CGFloat
    var staticStartVectorAfterY: CGFloat
    var staticEndVectorAfterX: CGFloat
    var staticEndVectorAfterY: CGFloat
    var changingStartVectorAfterX: CGFloat
    var changingStartVectorAfterY: CGFloat
    var changingEndVectorAfterX: CGFloat
    var changingEndVectorAfterY: CGFloat
    
    var isUser: Bool
    
    var index: Int?
    
    var shouldFix: Bool
    var isFixed: Bool
    
    var isPoweredByTaboola: Bool {
        get {
            return taboolaUrl != "" && taboolaUrl != nil
        }
    }

    // mapping database variables to Swift ones
    enum CodingKeys: String, CodingKey {
        // Before Vectors
        case staticStartVectorBeforeX = "a1x"
        case staticStartVectorBeforeY = "a1y"
        case staticEndVectorBeforeX = "a2x"
        case staticEndVectorBeforeY = "a2y"
        case changingStartVectorBeforeX = "b1x"
        case changingStartVectorBeforeY = "b1y"
        case changingEndVectorBeforeX = "b2x"
        case changingEndVectorBeforeY = "b2y"
        // After Vectors
        case staticStartVectorAfterX = "a1xn"
        case staticStartVectorAfterY = "a1yn"
        case staticEndVectorAfterX = "a2xn"
        case staticEndVectorAfterY = "a2yn"
        case changingStartVectorAfterX = "b1xn"
        case changingStartVectorAfterY = "b1yn"
        case changingEndVectorAfterX = "b2xn"
        case changingEndVectorAfterY = "b2yn"
        
        case staticStartAnalogy = "a1"
        case staticEndAnalogy = "a2"
        case changingStartAnalogy = "b1"
        case changingEndAnalogy = "b2"
        
        case taboolaUrl = "taboola_url"
        
        case isUser = "is_user"
        case shouldFix = "should_fix"
        case isFixed = "is_fixed"
    }
}
