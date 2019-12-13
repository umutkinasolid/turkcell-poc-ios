//
//  Environment.swift
//  Turkcell-POC
//
//  Created by Fikri Can Cankurtaran on 12.12.2019.
//  Copyright © 2019 Solid-ICT. All rights reserved.
//

import Foundation

struct Environment {
    struct BaseURL {
        static let apiTest = URL(string: "http://34.245.145.145:8080/api")!
        static let apiProd = URL(string: "http://34.245.145.145:8080/api")!
    }
    
    struct Config {
        static let api = API()
    }
}
