//
//  PieSlices.swift
//  animatedGraph
//
//  Created by Ankur Goswami on 7/6/15.
//  Copyright (c) 2015 Ankur Goswami. All rights reserved.
//

import UIKit

class PieSlices{
    init(){
        
    }
    
//    class func createPieSliceWithCenter(center: CGPoint, radius: CGFloat, startAngle: Int, endAngle: Int) -> CGPathRef{
//        let piePath = UIBezierPath()
//        piePath.moveToPoint(center)
//        piePath.addLineToPoint(CGPointMake(CGFloat(center.x + radius * cos(startAngle.degreesToRadians)), CGFloat(center.y + radius * sin(startAngle.degreesToRadians))))
//        piePath.addArcWithCenter(center, radius: radius, startAngle: startAngle.degreesToRadians, endAngle: endAngle.degreesToRadians, clockwise: true)
//        piePath.closePath()
//        return piePath.CGPath
//    }
    
//    class func createPieSlice() -> CAShapeLayer{
//        let center = CGPointMake(150, 100)
//        let radius = CGFloat(100)
//        let fromPath = PieSlices.createPieSliceWithCenter(center, radius: radius, startAngle: -60, endAngle: 60)
//        let toPath = PieSlices.createPieSliceWithCenter(center, radius: radius, startAngle: 120, endAngle: -120)
//        
//        let slice = CAShapeLayer()
//        slice.fillColor = UIColor.redColor().CGColor
//        slice.strokeColor = UIColor.blackColor().CGColor
//        slice.lineWidth = 3
//        slice.path = fromPath
//        
//        let anim = CABasicAnimation(keyPath: "path")
//        anim.fromValue = fromPath
//        anim.toValue = toPath
//        anim.fillMode = kCAFillModeForwards
//        anim.removedOnCompletion = false
//        slice.addAnimation(anim, forKey: nil)
//        
//        return slice
//    }
}