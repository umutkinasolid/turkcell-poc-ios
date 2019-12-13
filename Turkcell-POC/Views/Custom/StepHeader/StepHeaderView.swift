//
//  StepHeaderView.swift
//  Turkcell-POC
//
//  Created by Fikri Can Cankurtaran on 12.12.2019.
//  Copyright © 2019 Solid-ICT. All rights reserved.
//

import UIKit

class StepHeaderView: UIView {
    // MARK: - Variables
    
    private static let currentButtonRadius: CGFloat = 20.0
    private static let bezierPathHeight: CGFloat = 65.0
    private var shapeLayer: CALayer?
    
    // MARK: - IBOutlets
    
    // MARK: UIStackView
 
    @IBOutlet weak var containerStackView: UIStackView!
    
    // MARK: UIButton
    
    @IBOutlet weak var firstStepButton: UIButton!
    @IBOutlet weak var secondStepButton: UIButton!
    @IBOutlet weak var thirdStepButton: UIButton!
    @IBOutlet weak var fourthStepButton: UIButton!
    @IBOutlet weak var fifthStepButton: UIButton!

    override func draw(_ rect: CGRect) {
        // Drawing code
        
        firstStepButton.setCornerRadius(radius: StepHeaderView.currentButtonRadius)
        secondStepButton.setCircle()
        thirdStepButton.setCircle()
        fourthStepButton.setCircle()
        fifthStepButton.setCircle()
        
        addShape()
    }
    
    private func addShape() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = createPath()
        shapeLayer.strokeColor = #colorLiteral(red: 0.9803921569, green: 0.9803921569, blue: 0.9803921569, alpha: 1)
        shapeLayer.fillColor = #colorLiteral(red: 0.9803921569, green: 0.9803921569, blue: 0.9803921569, alpha: 1)
        shapeLayer.lineWidth = 1.0
        
        if let oldShapeLayer = self.shapeLayer {
            self.layer.replaceSublayer(oldShapeLayer, with: shapeLayer)
        } else {
            self.layer.insertSublayer(shapeLayer, at: 0)
        }
        
        self.shapeLayer = shapeLayer
    }
    
    func createPath() -> CGPath {
        let height: CGFloat = -StepHeaderView.bezierPathHeight
        let path = UIBezierPath()
        let centerWidth = self.frame.width / 2
        
        path.move(to: CGPoint(x: 0, y: self.frame.height))
        path.addLine(to: CGPoint(x: 0, y: self.frame.height))
        
        path.addQuadCurve(to: CGPoint(x: self.frame.width, y: self.frame.height), controlPoint: CGPoint(x: centerWidth, y: -height))
        
        path.addLine(to: CGPoint(x: self.frame.width, y: self.frame.height))
        path.close()
        
        return path.cgPath
    }
}
