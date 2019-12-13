//
//  BaseTabBar.swift
//  Turkcell-POC
//
//  Created by Fikri Can Cankurtaran on 11.12.2019.
//  Copyright © 2019 Solid-ICT. All rights reserved.
//

import UIKit

class CurvedTabBar: UITabBar {
    private var shapeLayer: CALayer?
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        self.setupAppearance()        
        self.addShape()
    }
    
    private func setupAppearance() {
        self.barTintColor = #colorLiteral(red: 0.9607843137, green: 0.5137254902, blue: 0.1882352941, alpha: 1)
        self.tintColor = .black
        self.unselectedItemTintColor = .white
    }
    
    private func addShape() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = createPath()
        shapeLayer.strokeColor = #colorLiteral(red: 0.9607843137, green: 0.5137254902, blue: 0.1882352941, alpha: 1)
        shapeLayer.fillColor = #colorLiteral(red: 0.9607843137, green: 0.5137254902, blue: 0.1882352941, alpha: 1)
        shapeLayer.lineWidth = 1.0
        
        if let oldShapeLayer = self.shapeLayer {
            self.layer.replaceSublayer(oldShapeLayer, with: shapeLayer)
        } else {
            self.layer.insertSublayer(shapeLayer, at: 0)
        }
        
        self.shapeLayer = shapeLayer
    }
    
    func createPath() -> CGPath {
        let height: CGFloat = 50
        let path = UIBezierPath()
        let centerWidth = self.frame.width / 2
        
        path.move(to: CGPoint(x: 0, y: 10))
        path.addLine(to: CGPoint(x: 0, y: 10))
        
        path.addQuadCurve(to: CGPoint(x: self.frame.width, y: 10), controlPoint: CGPoint(x: centerWidth, y: -height))
        
        path.addLine(to: CGPoint(x: self.frame.width, y: 0))
        path.addLine(to: CGPoint(x: self.frame.width, y: self.frame.height))
        path.addLine(to: CGPoint(x: 0, y: self.frame.height))
        path.close()
        
        return path.cgPath
    }
}
