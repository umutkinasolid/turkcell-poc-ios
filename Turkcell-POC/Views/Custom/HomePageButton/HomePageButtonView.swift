//
//  HomePageButtonView.swift
//  Turkcell-POC
//
//  Created by Fikri Can Cankurtaran on 12.12.2019.
//  Copyright © 2019 Solid-ICT. All rights reserved.
//

import UIKit

class HomePageButtonView: UIView, NibInitializable {
    // MARK: - NibInitializable
    
    var nibName: String = "HomePageButtonView"
    
    // MARK: - IBOutlets
    
    // MARK: UIView
    
    @IBOutlet weak var imageContainerView: UIView!
    
    // MARK: UILabel
    
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: UIImageView
    
    @IBOutlet weak var iconImageView: UIImageView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        initialize(withNibName: self.nibName, postInitialize)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initialize(withNibName: self.nibName, postInitialize)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.imageContainerView.setCircle()
    }
    
    private func postInitialize(_ view: UIView) {
        
    }
    
    func setSelected(_ selected: Bool) {
        titleLabel.textColor = selected ? .black: .white
    }
    
    
}

extension HomePageButtonView: ViewModellable {
    
    typealias ViewModelSource = HomePageButtonView.ViewModel
    
    func configure(viewModel: HomePageButtonView.ViewModel) {
        self.iconImageView.image = viewModel.image
        self.titleLabel.text = viewModel.title
    }
 
}

extension HomePageButtonView {
    
    struct ViewModel: ViewModelType {
        
        let title: String
        let image: UIImage!
        
        init(title: String, image: UIImage) {
            self.title = title
            self.image = image
        }
        
    }
    
}
