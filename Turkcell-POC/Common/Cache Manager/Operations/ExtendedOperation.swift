//
//  ExtendedOperation.swift
//  ImageCache
//
//  Created by Doğu Emre DEMİRÇİVİ on 12.12.2019.
//  Copyright © 2019 Doğu Emre DEMİRÇİVİ. All rights reserved.
//

import Foundation

internal class ExtendedOperation: Operation {
    // MARK: - Fields
    
    internal var state: ExtendedOperationState = .ready {
        willSet {
            self.willChangeValue(forKey: "isExecuting")
            self.willChangeValue(forKey: "isFinished")
        }
        
        didSet {
            self.didChangeValue(forKey: "isExecuting")
            self.didChangeValue(forKey: "isFinished")
        }
    }
    
    // MARK: - Properties
    
    internal override var isReady: Bool {
        return state == .ready
    }
    
    internal override var isExecuting: Bool {
        return state == .executing
    }
    
    internal override var isFinished: Bool {
        return state == .finished
    }
    
    // MARK: - Overridden Functions
    
    internal override func start() {
        if self.isCancelled {
            state = .finished
            
            return
        }
        
        state = .executing

        execute()
    }
    
    internal override func cancel() {
        super.cancel()

        stop()
    }
    
    // MARK: - Abstract Functions
    
    open func execute() {
        fatalError("execute must be overridden")
    }
    
    open func stop() {
        fatalError("stop must be overridden")
    }
}
