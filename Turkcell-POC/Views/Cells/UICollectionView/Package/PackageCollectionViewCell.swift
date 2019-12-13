//
//  PackageCollectionViewCell.swift
//  Turkcell-POC
//
//  Created by Fikri Can Cankurtaran on 12.12.2019.
//  Copyright © 2019 Solid-ICT. All rights reserved.
//

import UIKit

class PackageCollectionViewCell: UICollectionViewCell, Reusable {
    // MARK: - Variables
    
    static let containerRadius: CGFloat = 10.0
    static let buttonRadius: CGFloat = 10.0

    // MARK: - IBOutlets
    
    // MARK: UIView
    
    @IBOutlet weak var containerView: UIView!
    
    // MARK: UILabel
    
    @IBOutlet weak var packageNameLabel: UILabel!
    @IBOutlet weak var appCountLabel: UILabel!
    @IBOutlet weak var dataGBLabel: UILabel!
    @IBOutlet weak var digitalMinutesLabel: UILabel!
    @IBOutlet weak var smsCountLabel: UILabel!
    @IBOutlet weak var callMinutesLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var periodTypeLabel: UILabel!
    
    // MARK: UIImageView
    
    @IBOutlet weak var appCountGradientImageView: UIImageView!
    @IBOutlet weak var bottomGradiantImageView: UIImageView!
    
    // MARK: UIButton
    
    @IBOutlet weak var selectButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        self.setShadow()
        self.containerView.setCornerRadius(radius: PackageCollectionViewCell.containerRadius)
        self.selectButton.setCornerRadius(radius: PackageCollectionViewCell.buttonRadius)
    }
}

extension PackageCollectionViewCell: ViewModellable {
    typealias ViewModelSource = PackageCollectionViewCell.ViewModel
    
    func configure(viewModel: PackageCollectionViewCell.ViewModel) {
        self.packageNameLabel.text = viewModel.name
        self.appCountLabel.text = viewModel.appCountString
        self.dataGBLabel.text = viewModel.dataGBString
        self.digitalMinutesLabel.text = viewModel.digitalMinutesString
        self.smsCountLabel.text = viewModel.smsCountString
        self.callMinutesLabel.text = viewModel.callMinutesString
        self.priceLabel.text = viewModel.priceString
        self.periodTypeLabel.text = viewModel.periodString
        self.appCountGradientImageView.image = viewModel.appCountImage
        self.bottomGradiantImageView.image = viewModel.bottomImage
    }
}

extension PackageCollectionViewCell {
    struct ViewModel: ViewModelType {
        var name: String
        var appCountString: String
        var dataGBString: String
        var digitalMinutesString: String
        var smsCountString: String
        var callMinutesString: String
        var priceString: String
        var periodString: String
        var appCountImage: UIImage?
        var bottomImage: UIImage?
        
        init(package: Package) {
            self.name = package.name
            self.appCountString = "\(package.appCount) APP"
            self.dataGBString = "\(package.dataGigabytes) GB"
            self.digitalMinutesString = "\(package.digitalServiceMinutes) DK"
            self.smsCountString = "+ \(package.smsCount) SMS TEXTS"
            self.callMinutesString = "+ \(package.callMinutes) ON CALLS"
            self.priceString = "\(package.price)"
            
            switch package.periodType {
            case .month:
                self.periodString = "TL / AY"
            }
            
            switch package.colorType {
            case .orange:
                appCountImage = Images.Packages.appCountOrange
                bottomImage = Images.Packages.bottomOrange
                
            case .purple:
                appCountImage = Images.Packages.appCountPurple
                bottomImage = Images.Packages.bottomPurple
                
            case .pink:
                appCountImage = Images.Packages.appCountPink
                bottomImage = Images.Packages.bottomPink
            }
        }
    }
}
