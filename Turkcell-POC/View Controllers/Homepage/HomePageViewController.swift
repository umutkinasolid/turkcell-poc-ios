//
//  HomePageViewController.swift
//  Turkcell-POC
//
//  Created by Fikri Can Cankurtaran on 11.12.2019.
//  Copyright © 2019 Solid-ICT. All rights reserved.
//

import UIKit

class HomePageViewController: UIViewController {
    // MARK: - ViewModel
    
    lazy var homePageViewModel: HomePageViewModel = {
        let viewModel = HomePageViewModel(api: Environment.Config.api)
        viewModel.viewDelegate = self
        
        return viewModel
    }()
    
    // MARK: - IBOutlets
    
    // MARK: UICollectionView
    
    @IBOutlet weak var menuCollectionView: UICollectionView!
    
    // MARK: - Custom Views
    
    @IBOutlet weak var userInfoView: UserInfoView!
    
    // MARK: - NSLayoutConstraint
    
    @IBOutlet weak var collectionViewHeightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.registerCells()
        self.homePageViewModel.start()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        menuCollectionView.setShadow()
    }
    
    private func registerCells() {
        self.menuCollectionView.register(cellType: MenuItemCollectionViewCell.self)
    }
}

extension HomePageViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.homePageViewModel.numberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellViewModel = self.homePageViewModel.menuItemViewModelFor(indexPath.item)
        
        let cell: MenuItemCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.configure(viewModel: cellViewModel)
        
        return cell
    }
}

extension HomePageViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: 80)
    }
}

extension HomePageViewController: HomePageViewDelegate {
    func updateMenuItemCollectionView() {
        self.menuCollectionView.reloadData()
    }
    
    func updateUserInfoView() {
        let userInfoViewModel = self.homePageViewModel.userInfoViewModel()
        
        self.userInfoView.configure(viewModel: userInfoViewModel)
    }
}
