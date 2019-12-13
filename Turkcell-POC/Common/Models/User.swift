//
//  User.swift
//  Turkcell-POC
//
//  Created by Fikri Can Cankurtaran on 11.12.2019.
//  Copyright © 2019 Solid-ICT. All rights reserved.
//

import Foundation

struct User: Codable {
    let name: String
    let surname: String
    let phone: String
    let imageURL: URL?
    
    init() {
        self.name = ""
        self.surname = ""
        self.phone = ""
        self.imageURL = nil
    }
    
    // Temporary constructor
    init(name: String, surname: String, phone: String, imageURL: URL?) {
        self.name = name
        self.surname = surname
        self.phone = phone
        self.imageURL = imageURL
    }
}
