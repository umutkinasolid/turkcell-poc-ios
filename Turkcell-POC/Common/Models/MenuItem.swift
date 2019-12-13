//
//  MenuItem.swift
//  Turkcell-POC
//
//  Created by Fikri Can Cankurtaran on 12.12.2019.
//  Copyright © 2019 Solid-ICT. All rights reserved.
//

import Foundation

struct MenuItem: Codable {
    let id: String
    let title: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case title = "label"
    }
}
