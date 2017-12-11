//
//  CanvasView.swift
//  SimpleJackDrawing
//
//  Created by Shawn Roller on 12/10/17.
//  Copyright © 2017 Shawn Roller. All rights reserved.
//

import UIKit

class CanvasView: UIView {

    private var strokeColor: UIColor!
    private var strokeWidth: CGFloat!
    private var startPoint: CGPoint!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.clipsToBounds = true
        self.isMultipleTouchEnabled = false
        self.strokeColor = UIColor.white
        self.strokeWidth = 5
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        self.startPoint = touch.location(in: self)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let location = touches.first?.location(in: self) else { return }
        let path = UIBezierPath()
        path.move(to: self.startPoint)
        path.addLine(to: location)
        drawLineWith(path)
        self.startPoint = location
    }
    
    private func drawLineWith(_ path: UIBezierPath) {
        let shapeLayer = CAShapeLayer()
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = self.strokeColor.cgColor
        shapeLayer.lineWidth = self.strokeWidth
        shapeLayer.path = path.cgPath
        self.layer.addSublayer(shapeLayer)
        self.setNeedsDisplay()
    }
    
    public func clearCanvas() {
        self.layer.sublayers = nil
        self.setNeedsDisplay()
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
