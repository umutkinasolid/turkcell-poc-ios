//
//  HomepageViewModel.swift
//  Turkcell-POC
//
//  Created by Fikri Can Cankurtaran on 11.12.2019.
//  Copyright © 2019 Solid-ICT. All rights reserved.
//

import Foundation

protocol HomePageViewDelegate: AnyObject {
    func updateMenuItemCollectionView()
    func updateUserInfoView()
}

protocol HomePageViewModelProtocol {
    // MARK: - Delegate
    
    var viewDelegate: HomePageViewDelegate? { get set }
    
    // MARK: - DataSource
    
    func start()
    func numberOfItems() -> Int
    func menuItemViewModelFor( _ item: Int) -> MenuItemCollectionViewCell.ViewModel
    func userInfoViewModel() -> UserInfoView.ViewModel
}

class HomePageViewModel {
    // MARK: - Temp Data
    
    let titles = ["HAT SİPARİŞİM", "SIK SORULAN SORULAR", "MYCELL ASİSTAN"]
    let userTemp = User(name: "Bahar", surname: "Demirkan", phone: "05321234567", imageURL: nil)
    
    // MARK: - Delegates
    
    weak var viewDelegate: HomePageViewDelegate?
    
    // MARK: - Properties
    
    fileprivate let api: API
    
    private var menuItems = [MenuItem]()
    
    private var user = User()
    
    // MARK: - Init
    
    init(api: API) {
        self.api = api
    }
        
    // MARK: - Network
    
    func getMenuItems() {
        api.menuItems { [weak self] (response) in
            switch response {
            case .success(let menuItems):
                self?.menuItems = menuItems
                
            case .failure(let error):
                print(error)
            }
            
            self?.viewDelegate?.updateMenuItemCollectionView()
        }
    }
    
    func getUserInfo() {
        self.user = userTemp
        
        viewDelegate?.updateUserInfoView()
    }
}

extension HomePageViewModel: HomePageViewModelProtocol {
    func start() {
        self.getMenuItems()
        self.getUserInfo()
    }
    
    func numberOfItems() -> Int {
        return self.menuItems.count
    }
    
    func menuItemViewModelFor(_ item: Int) -> MenuItemCollectionViewCell.ViewModel {
        let menuItemTitle = self.menuItems[item]
        let viewModel = MenuItemCollectionViewCell.ViewModel(menuItem: menuItemTitle)
        
        return viewModel
    }
    
    func userInfoViewModel() -> UserInfoView.ViewModel {
        let viewModel = UserInfoView.ViewModel(user: self.user)
        
        return viewModel
    }
}
