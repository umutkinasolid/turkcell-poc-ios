
//
//  TypicalImageDownloadOperation.swift
//  ImageCache
//
//  Created by Doğu Emre DEMİRÇİVİ on 12.12.2019.
//  Copyright © 2019 Doğu Emre DEMİRÇİVİ. All rights reserved.
//

import UIKit

internal class TypicalImageDownloadOperation: ExtendedOperation {
    typealias DownloadCallback = (_ result: Result<UIImage, Error>) -> Void
    
    private var task: URLSessionDataTask!
    
    internal init(url: URL, callback: @escaping DownloadCallback) {
        super.init()
        
        task = URLSession.shared.dataTask(with: url, completionHandler: { (data, _, error) in
            if let error = error {
                callback(.failure(error))
                
                return
            }
            
            guard let data = data else {
                callback(.failure(TypicalImageCacherError.dataNotProvided))
                
                return
            }
            
            guard let image = UIImage(data: data) else {
                callback(.failure(TypicalImageCacherError.invalidImage))
                
                return
            }

            callback(.success(image))
            
            self.state = .finished
        })
    }

    internal override func execute() {
        self.task.resume()
    }
    
    internal override func stop() {
        self.task.cancel()
    }
}
