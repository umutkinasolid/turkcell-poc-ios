//
//  ViewModellable.swift
//  Turkcell-POC
//
//  Created by Fikri Can Cankurtaran on 11.12.2019.
//  Copyright © 2019 Solid-ICT. All rights reserved.
//

import Foundation

protocol ViewModelType {
    
}

protocol ViewModellable {
    associatedtype ViewModelSource: ViewModelType
    
    func configure(viewModel: ViewModelSource)
}
