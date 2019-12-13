//
//  UserInfoView.swift
//  Turkcell-POC
//
//  Created by Fikri Can Cankurtaran on 11.12.2019.
//  Copyright © 2019 Solid-ICT. All rights reserved.
//

import UIKit

@IBDesignable
class UserInfoView: UIView, NibInitializable {
    // MARK: - NibInitializable
    
    var nibName: String = "UserInfoView"
    
    // MARK: - IBOutlets
    
    // MARK: UILabels
    
    @IBOutlet weak var nameAndSurnameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    // MARK: UIImageView
    
    @IBOutlet weak var userImageView: UIImageView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        initialize(withNibName: self.nibName, postInitialize)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initialize(withNibName: self.nibName, postInitialize)
    }
    
    private func postInitialize(_ view: UIView) {
        
    }
}

extension UserInfoView: ViewModellable {
    typealias ViewModelSource = UserInfoView.ViewModel
    
    func configure(viewModel: UserInfoView.ViewModelSource) {
        self.nameAndSurnameLabel.text = viewModel.nameAndSurname
        self.phoneNumberLabel.text = viewModel.phone
    }
}

extension UserInfoView {
    struct ViewModel: ViewModelType {
        let nameAndSurname: String
        let phone: String
        
        init(user: User) {
            self.nameAndSurname = "\(user.name) \(user.surname)"
            self.phone = user.phone
        }
    }
}
