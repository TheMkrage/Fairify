//
//  UIViewController+Extension.swift
//  Fairify
//
//  Created by Matthew Krager on 3/30/19.
//  Copyright © 2019 Matthew Krager. All rights reserved.
//

import UIKit

extension UIViewController {
    @objc func back() {
        self.navigationController?.popViewController(animated: true)
    }
}
