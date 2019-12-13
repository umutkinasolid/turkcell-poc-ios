//
//  MenuItemCollectionViewCell.swift
//  Turkcell-POC
//
//  Created by Fikri Can Cankurtaran on 11.12.2019.
//  Copyright © 2019 Solid-ICT. All rights reserved.
//

import UIKit

class MenuItemCollectionViewCell: UICollectionViewCell, Reusable {
    // MARK: - IBOutlets
    
    // MARK: UILabel
    @IBOutlet weak var menuItemTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}

extension MenuItemCollectionViewCell: ViewModellable {
    typealias ViewModelSource = MenuItemCollectionViewCell.ViewModel
    
    func configure(viewModel: MenuItemCollectionViewCell.ViewModel) {
        self.menuItemTitleLabel.text = viewModel.title
    }
}

extension MenuItemCollectionViewCell {
    struct ViewModel: ViewModelType {
        var title: String
        
        init(menuItem: MenuItem) {
            self.title = menuItem.title
        }
    }
}
