//
//  CustomTabbar.swift
//  Recipe App
//
//  Created by Mehmet Kaan on 22.04.2023.
//

import Foundation
import UIKit

@IBDesignable
class CustomTabBar: UITabBar {
    var radii: CGFloat = 18
    
    private var shapeLayer: CALayer?
    
    override func draw(_ rect: CGRect) {
        addShape()
    }
    
    private func addShape() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = createPath()
        shapeLayer.strokeColor = UIColor.orange.cgColor
        shapeLayer.fillColor = UIColor.orange.cgColor
        shapeLayer.lineWidth = 1
        shapeLayer.backgroundColor = UIColor.white.cgColor
        
        if let oldShapeLayer = self.shapeLayer {
            layer.replaceSublayer(oldShapeLayer, with: shapeLayer)
        } else {
            layer.insertSublayer(shapeLayer, at: 0)
        }
        
        self.shapeLayer = shapeLayer
    }
    
    private func createPath() -> CGPath{
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: self.frame.width, y: 0))
        path.fill()
        let roundedRect = UIBezierPath(roundedRect: CGRect(x: self.frame.width / 2.4, y: -55, width: 75, height: 75), byRoundingCorners: [.bottomLeft,.topRight,.bottomRight,.topLeft], cornerRadii: CGSize(width: radii, height: 0))
        roundedRect.fill()
        path.append(roundedRect)
        
        return path.cgPath
    }
}
