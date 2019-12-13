//
//  Package.swift
//  Turkcell-POC
//
//  Created by Fikri Can Cankurtaran on 12.12.2019.
//  Copyright © 2019 Solid-ICT. All rights reserved.
//

import Foundation

enum PeriodType: String, Codable {
    case month = "MONTH"
}

enum ColorType: String, Codable {
    case purple = "PURPLE"
    case pink = "PINK"
    case orange = "ORANGE"
}

struct Package: Codable {
    let id: String
    let name: String
    let appCount: Int
    let dataGigabytes: Int
    let digitalServiceMinutes: Int
    let smsCount: Int
    let callMinutes: Int
    let periodType: PeriodType
    let price: Int
    let colorType: ColorType
}
