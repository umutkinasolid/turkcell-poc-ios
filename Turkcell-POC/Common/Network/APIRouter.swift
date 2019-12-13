//
//  APIRouter.swift
//  Turkcell-POC
//
//  Created by Fikri Can Cankurtaran on 12.12.2019.
//  Copyright © 2019 Solid-ICT. All rights reserved.
//

import Foundation

enum APIRouter {
    case tabBarItems
    case menuItems
    case subscriptions
}

extension APIRouter: Routable {
    var baseURL: URL {
        #if DEBUG
        return Environment.BaseURL.apiTest
        #else
        return Environment.BaseURL.apiProd
        #endif        
    }
    
    var path: String {
        switch self {
        case .tabBarItems:
            return "/nav-bar-items"
        case .menuItems:
            return "/menu-items"
        case .subscriptions:
            return "/subscriptions"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .tabBarItems, .menuItems, .subscriptions:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .tabBarItems, .menuItems, .subscriptions:
            return .plain
        }
    }
    
    var headers: Headers? {
        return nil
    }
    
    var parametersEncoding: ParametersEncoding {
        return .url
    }
}
