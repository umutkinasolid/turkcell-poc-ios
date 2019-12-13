//
//  PackagesViewModel.swift
//  Turkcell-POC
//
//  Created by Fikri Can Cankurtaran on 12.12.2019.
//  Copyright © 2019 Solid-ICT. All rights reserved.
//

import Foundation

protocol PackagesViewDelegate: AnyObject {
    func updatePackagesCollectionView()
}

protocol PackagesViewModelProtocol {
    // MARK: - Delegate
    
    var viewDelegate: PackagesViewDelegate? { get set }
    
    // MARK: - DataSource
    
    func start()
    func numberOfItems() -> Int
    func packageViewModelFor( _ item: Int) -> PackageCollectionViewCell.ViewModel
}

class PackagesViewModel {
    // MARK: - Delegates
    
    weak var viewDelegate: PackagesViewDelegate?
    
    // MARK: - Properties
    
    fileprivate let api: API
    
    private var packages = [Package]()
        
    // MARK: - Init
    
    init(api: API) {
        self.api = api
    }
        
    // MARK: - Network
    
    func getPackages() {
        api.subscriptions { [weak self] (response) in
            switch response {
            case .success(let packages):
                self?.packages = packages
                
            case .failure(let error):
                print(error)
            }
            
            self?.viewDelegate?.updatePackagesCollectionView()
        }
    }
}

extension PackagesViewModel: PackagesViewModelProtocol {
    func start() {
        self.getPackages()
    }
    
    func numberOfItems() -> Int {
        return self.packages.count
    }
    
    func packageViewModelFor(_ item: Int) -> PackageCollectionViewCell.ViewModel {
        let package = self.packages[item]
        let viewModel = PackageCollectionViewCell.ViewModel(package: package)
        return viewModel
    }
}
