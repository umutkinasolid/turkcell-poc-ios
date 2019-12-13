//
//  Response.swift
//  TVShow-MVVMC
//
//  Created by Fikri Can Cankurtaran on 17.08.2019.
//  Copyright © 2019 Fikri Can Cankurtaran. All rights reserved.
//

import Foundation

enum APIResponse<T: Codable> {
    case success(T)
    case failure(APIError)
}
