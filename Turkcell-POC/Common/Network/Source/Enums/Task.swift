//
//  Task.swift
//  TVShow-MVVMC
//
//  Created by Fikri Can Cankurtaran on 17.08.2019.
//  Copyright © 2019 Fikri Can Cankurtaran. All rights reserved.
//

import Foundation

typealias Parameters = [String: Any]

enum Task {
    case plain
    case parameters(Parameters)
    
    // TODO: Will add download and upload tasks
}
