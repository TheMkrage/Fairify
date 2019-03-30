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
    var fairifiedChangingEndAnalogy: String
    
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

    // mapping database variables to Swift ones
    enum CodingKeys: String, CodingKey {
        // Before Vectors
        case staticStartVectorBeforeX = "staticStartVectorBeforeX"
        case staticStartVectorBeforeY = "staticStartVectorBeforeY"
        case staticEndVectorBeforeX = "staticEndVectorBeforeX"
        case staticEndVectorBeforeY = "staticEndVectorBeforeY"
        case changingStartVectorBeforeX = "changingStartVectorBeforeX"
        case changingStartVectorBeforeY = "changingStartVectorBeforeY"
        case changingEndVectorBeforeX = "changingEndVectorBeforeX"
        case changingEndVectorBeforeY = "changingEndVectorBeforeY"
        // After Vectors
        case staticStartVectorAfterX = "staticStartVectorAfterX"
        case staticStartVectorAfterY = "staticStartVectorAfterY"
        case staticEndVectorAfterX = "staticEndVectorAfterX"
        case staticEndVectorAfterY = "staticEndVectorAfterY"
        case changingStartVectorAfterX = "changingStartVectorAfterX"
        case changingStartVectorAfterY = "changingStartVectorAfterY"
        case changingEndVectorAfterX = "changingEndVectorAfterX"
        case changingEndVectorAfterY = "changingEndVectorAfterY"
        
        case staticStartAnalogy = "staticStartAnalogy"
        case staticEndAnalogy = "staticEndAnalogy"
        case changingStartAnalogy = "changingStartAnalogy"
        case changingEndAnalogy = "changingEndAnalogy"
        case fairifiedChangingEndAnalogy = "fairifiedChangingEndAnalogy"
        
        case taboolaUrl = "taboolaUrl"
    }
}
