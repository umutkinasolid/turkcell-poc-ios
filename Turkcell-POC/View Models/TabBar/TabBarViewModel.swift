//
//  TabBarViewModel.swift
//  Turkcell-POC
//
//  Created by Fikri Can Cankurtaran on 12.12.2019.
//  Copyright © 2019 Solid-ICT. All rights reserved.
//

import Foundation

protocol TabBarViewDelegate: AnyObject {
    func updateTabBar()
}

protocol TabBarViewModelProtocol {
    // MARK: - Delegate
    
    var viewDelegate: TabBarViewDelegate? { get set }
    
    // MARK: - DataSource
    
    func start()
    func getTabs() -> [TabBarItem]
}

class TabBarViewModel {
    // MARK: - Delegates
    
    weak var viewDelegate: TabBarViewDelegate?
    
    // MARK: - Properties
    
    fileprivate let api: API
    
    private var tabBarItems = [TabBarItem]()
        
    // MARK: - Init
    
    init(api: API) {
        self.api = api
    }
        
    // MARK: - Network
    
    func getTabBarItems() {
        api.tabBarItems { [weak self] (response) in
            switch response {
            case .success(let tabBarItems):
                self?.tabBarItems = tabBarItems
                
            case .failure(let error):
                print(error)
            }
            
            self?.viewDelegate?.updateTabBar()
        }
    }
}

extension TabBarViewModel: TabBarViewModelProtocol {
    func start() {
        self.getTabBarItems()
    }
    
    func getTabs() -> [TabBarItem] {
        return self.tabBarItems
    }
}
