//
//  TypicalImageCacher.swift
//  ImageCache
//
//  Created by Doğu Emre DEMİRÇİVİ on 12.12.2019.
//  Copyright © 2019 Doğu Emre DEMİRÇİVİ. All rights reserved.
//

import UIKit

internal class TypicalImageCacher: ImageCacher {
    private var operationQueue: OperationQueue
    private var images: [URL: UIImage]
    
    public init() {
        self.operationQueue = OperationQueue()
        
        /*
         * Important note:
         * The value below is `1` on a purpose.
         * Since this class is thread-safe
         * it is not a good idea to make this value bigger.
         */
        self.operationQueue.maxConcurrentOperationCount = 1
        
        self.images = [:]
    }
    
    /// Downloads image from given url and caches it internally.
    /// - Parameters:
    ///   - withURL: url to download
    ///   - callback: callback to call when download is complete
    func getImage(withURL url: URL, callback: @escaping ImageCacherCallback) {
        self.operationQueue.addOperation {
            if let image = self.images[url] {
                DispatchQueue.main.async {
                    callback(.success(image))
                }
                
                return
            }
            
            let operation = TypicalImageDownloadOperation(url: url) { (result) in
                switch result {
                case .success(let image):
                    self.images[url] = image
                    
                    DispatchQueue.main.async {
                        callback(.success(image))
                    }
                case .failure(let error):
                    DispatchQueue.main.async {
                        callback(.failure(error))
                    }
                }
            }
            
            self.operationQueue.addOperation(operation)
        }
    }
}
