//
//  PieSliceLayer.swift
//  animatedGraph
//
//  Created by Ankur Goswami on 7/6/15.
//  Copyright (c) 2015 Ankur Goswami. All rights reserved.
//

import UIKit

class PieSliceLayer: CALayer {
    
    @NSManaged var startAngle: CGFloat
    @NSManaged var endAngle: CGFloat
    var fillColor: UIColor!
    var strokeColor: UIColor!
    var strokeWidth: CGFloat!
    
    func makeAnimationForKey(key: String) -> CABasicAnimation{
        let anim = CABasicAnimation(keyPath: key)
        anim.fromValue = self.presentationLayer()?.valueForKey(key)
        anim.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        anim.duration = 0.5
        return anim
    }
    
    override func actionForKey(event: String!) -> CAAction! {
        if(event == "startAngle" || event == "endAngle"){
            return self.makeAnimationForKey(event)
        }
        return super.actionForKey(event)
    }
    
    override class func needsDisplayForKey(key: String) -> Bool{
        if(key == "startAngle" || key == "endAngle"){
            return true
        }
        return CALayer.needsDisplayForKey(key)
    }
    
    override func drawInContext(ctx: CGContext!) {
        let center = CGPointMake(UIScreen.mainScreen().bounds.size.width/2, self.bounds.size.height/2)
        let radius: CGFloat = min(center.x, center.y)
        
        CGContextBeginPath(ctx)
        CGContextMoveToPoint(ctx, center.x, center.y)
        
        let p1 = CGPointMake(center.x + radius * cos(self.startAngle), center.y + radius * sin(self.startAngle))
        CGContextAddLineToPoint(ctx, p1.x, p1.y)
        let clockwise: Int32 = self.startAngle > self.endAngle ? 1 : 0
        CGContextAddArc(ctx, center.x, center.y, radius, self.startAngle, self.endAngle, clockwise)
        CGContextClosePath(ctx)
        CGContextSetFillColorWithColor(ctx, self.fillColor.CGColor)
        CGContextSetStrokeColorWithColor(ctx, self.strokeColor.CGColor)
        CGContextSetLineWidth(ctx, self.strokeWidth)
        
        CGContextDrawPath(ctx, kCGPathFillStroke)
    }
    
    override init(){
        super.init()
        self.fillColor = UIColor.grayColor()
        self.strokeColor = UIColor.blackColor()
        self.strokeWidth = 1.0
        self.setNeedsDisplay()
    }
    
    override init(layer: AnyObject!) {
        super.init(layer: layer)
        if(layer.isKindOfClass(PieSliceLayer.classForCoder())){
            let other = layer as! PieSliceLayer
            self.startAngle = other.startAngle
            self.endAngle = other.endAngle
            self.fillColor = other.fillColor
            
            self.strokeColor = other.strokeColor
            self.strokeWidth = other.strokeWidth
        }
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
