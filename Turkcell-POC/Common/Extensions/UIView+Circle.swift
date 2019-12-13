//
//  UIView+Circle.swift
//  Turkcell-POC
//
//  Created by Fikri Can Cankurtaran on 12.12.2019.
//  Copyright © 2019 Solid-ICT. All rights reserved.
//

import UIKit

extension UIView {
    func setCircle() {
        layer.cornerRadius = 0.5 * frame.size.width
        clipsToBounds = true
    }
}
