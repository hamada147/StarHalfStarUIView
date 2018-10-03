//
//  StarShapeUIView.swift
//  Designs
//
//  Created by Ahmed Moussa on 10/1/18.
//  Copyright © 2018 Moussa Tech. All rights reserved.
//

import UIKit

@IBDesignable
class StarShapeUIView: UIView {
    
    // MARK:- Class Variables
    private var path: UIBezierPath!
    private lazy var middleX: CGFloat = self.getMiddleX()
    private let p2_3Yperc: CGFloat = 38
    private let p4Yperc: CGFloat = 60
    private let p2Xperc: CGFloat = 15
    private let p4Xperc: CGFloat = 22
    private let p5Xperc: CGFloat = 35
    private let p6Yperc: CGFloat = 75
    @IBInspectable var fillColour: UIColor = UIColor.orange
    
    // MARK:- initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
        self.fillColour = UIColor.orange
        if (frame.width != frame.height) {
            fatalError("Width must equal height")
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.backgroundColor = UIColor.clear
        if (self.frame.width != self.frame.height) {
            fatalError("Width must equal height")
        }
    }
    
    // MARK:- Get Calculated Value
    private func getMiddleX() -> CGFloat {
        return self.frame.width / 2
    }
    
    private func getSpecificPercentFromWidth(_ percent: CGFloat) -> CGFloat {
        return self.frame.width * percent / 100
    }
    
    private func getSpecificPercentFromHeight(_ percent: CGFloat) -> CGFloat {
        return self.frame.height * percent / 100
    }

    // MARK:- UIView as Star
    /*
     
     Only override draw() if you perform custom drawing.
     An empty implementation adversely affects performance during animation.
    */
    override func draw(_ rect: CGRect) {
        self.createStar()
    }
    
    private func createStar() {
        let point1X: CGFloat = self.middleX
        let point1Y: CGFloat = 0.0
        
        let point2X: CGFloat = self.getSpecificPercentFromWidth(self.p2Xperc) + self.middleX
        let point2Y: CGFloat = self.getSpecificPercentFromHeight(self.p2_3Yperc)
        
        let point3X: CGFloat = self.frame.width
        let point3Y: CGFloat = point2Y
        
        let point4X: CGFloat = self.getSpecificPercentFromWidth(self.p4Xperc) + self.middleX
        let point4Y: CGFloat = self.getSpecificPercentFromHeight(self.p4Yperc)
        
        let point5X: CGFloat = self.getSpecificPercentFromWidth(self.p5Xperc) + self.middleX
        let point5Y: CGFloat = self.frame.height
        
        let point6X: CGFloat = self.middleX
        let point6Y: CGFloat = self.getSpecificPercentFromHeight(self.p6Yperc)
        
        self.path = UIBezierPath()
        // start point
        let firstPoint: CGPoint = CGPoint(x: point1X, y: point1Y)
        self.path.move(to: firstPoint)
        
        let secondPoint: CGPoint = CGPoint(x: point2X, y: point2Y)
        self.path.addLine(to: secondPoint)
        
        let thirdPoint: CGPoint = CGPoint(x: point3X, y: point3Y)
        self.path.addLine(to: thirdPoint)
        
        let fouthPoint: CGPoint = CGPoint(x: point4X, y: point4Y)
        self.path.addLine(to: fouthPoint)
        
        let fivthPoint: CGPoint = CGPoint(x: point5X, y: point5Y)
        self.path.addLine(to: fivthPoint)
        
        let sixthPoint: CGPoint = CGPoint(x: point6X, y: point6Y)
        self.path.addLine(to: sixthPoint)
        
        let mirrorOverXOrigin = CGAffineTransform(scaleX: -1.0, y: 1.0)
        let translate = CGAffineTransform(translationX: self.frame.width, y: 0)
        
        self.path.apply(mirrorOverXOrigin)
        self.path.apply(translate)
        
        self.fillColour.setFill()
        self.path.fill()
        
        self.path.move(to: firstPoint)
        self.path.addLine(to: secondPoint)
        self.path.addLine(to: thirdPoint)
        self.path.addLine(to: fouthPoint)
        self.path.addLine(to: fivthPoint)
        self.path.addLine(to: sixthPoint)
        self.path.close()
        
        // set colour
        self.fillColour.setFill()
        self.path.fill()
    }
    
}
