//
//  APIError.swift
//  TVShow-MVVMC
//
//  Created by Fikri Can Cankurtaran on 17.08.2019.
//  Copyright © 2019 Fikri Can Cankurtaran. All rights reserved.
//

import Foundation

enum APIError {
    case unknown
    case decodingError(Error)
    case noJSONData
    
    // TODO: Will add more cases
}
