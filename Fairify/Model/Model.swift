//
//  Model.swift
//  Fairify
//
//  Created by Matthew Krager on 3/30/19.
//  Copyright © 2019 Matthew Krager. All rights reserved.
//

import UIKit

class Model: Codable {
    var name: String
    var analogies: [Analogy]?
    var percent: CGFloat
}
