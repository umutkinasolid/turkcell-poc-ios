//
//  URLRequest+API.swift
//  TVShow-MVVMC
//
//  Created by Fikri Can Cankurtaran on 17.08.2019.
//  Copyright © 2019 Fikri Can Cankurtaran. All rights reserved.
//

import Foundation

extension URLRequest {
    
    init(router: Routable) {
        let urlComponents = URLComponents(router: router)
        
        self.init(url: urlComponents.url!)
        
        httpMethod = router.method.rawValue
        
        router.headers?.forEach { key, value in
            addValue(value, forHTTPHeaderField: key)
        }
        
        guard
            case let .parameters(parameters) = router.task,
            router.parametersEncoding == .json
        else { return }
        
        httpBody = try? JSONSerialization.data(withJSONObject: parameters)
    }
}
