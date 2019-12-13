//
//  PackagesViewController.swift
//  Turkcell-POC
//
//  Created by Fikri Can Cankurtaran on 12.12.2019.
//  Copyright © 2019 Solid-ICT. All rights reserved.
//

import UIKit

class PackagesViewController: UIViewController {
    // MARK: - ViewModel
    
    lazy var packagesViewModel: PackagesViewModel = {
        let viewModel = PackagesViewModel(api: Environment.Config.api)
        viewModel.viewDelegate = self
        
        return viewModel
    }()
    
    // MARK: - Variables
    
    private static let cellCornerRadius: CGFloat = 10.0
    private static let cellHeight: CGFloat = 406
    private static let cellPadding: CGFloat = 80
    
    // MARK: - IBOutlets
    
    // MARK: UICollectionView
    
    @IBOutlet weak var packagesCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.registerCells()
        self.packagesViewModel.start()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.packagesCollectionView.setCornerRadius(radius: PackagesViewController.cellCornerRadius)
    }
    
    private func registerCells() {
        self.packagesCollectionView.register(cellType: PackageCollectionViewCell.self)
    }
}

extension PackagesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return packagesViewModel.numberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: PackageCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        let cellViewModel = self.packagesViewModel.packageViewModelFor(indexPath.item)
        cell.configure(viewModel: cellViewModel)
        
        return cell
    }
}

extension PackagesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(
            width: collectionView.frame.size.width - PackagesViewController.cellPadding,
            height: PackagesViewController.cellHeight
        )
    }
}

extension PackagesViewController: PackagesViewDelegate {
    func updatePackagesCollectionView() {
        packagesCollectionView.reloadData()
    }
}
