//
//  API.swift
//  Turkcell-POC
//
//  Created by Fikri Can Cankurtaran on 12.12.2019.
//  Copyright © 2019 Solid-ICT. All rights reserved.
//

import Foundation

final class API {
    private let router = APIRouter.self
    
    func tabBarItems(completion: @escaping (APIResponse<[TabBarItem]>) -> ()) {
        APIClient.shared.request(responseType: [TabBarItem].self, router: router.tabBarItems, completion: completion)
    }
        
    func menuItems(completion: @escaping (APIResponse<[MenuItem]>) -> ()) {
        APIClient.shared.request(responseType: [MenuItem].self, router: router.menuItems, completion: completion)        
    }
    
    func subscriptions(completion: @escaping (APIResponse<[Package]>) -> ()) {
        APIClient.shared.request(responseType: [Package].self, router: router.subscriptions, completion: completion)        
    }
}
