//
//  ImageCacher.swift
//  ImageCache
//
//  Created by Doğu Emre DEMİRÇİVİ on 12.12.2019.
//  Copyright © 2019 Doğu Emre DEMİRÇİVİ. All rights reserved.
//

import UIKit

internal protocol ImageCacher {
    typealias ImageCacherCallback = (_ result: Result<UIImage, Error>) -> Void
    
    /// Downloads image from given url and caches it internally.
    /// - Parameters:
    ///   - withURL: url to download
    ///   - callback: callback to call when download is complete
    func getImage(withURL: URL, callback: @escaping ImageCacherCallback)
}
