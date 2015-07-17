//
//  PieView.swift
//  animatedGraph
//
//  Created by Ankur Goswami on 7/6/15.
//  Copyright (c) 2015 Ankur Goswami. All rights reserved.
//

import UIKit

class PieView: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    private var _normalizedValues: NSMutableArray?
    private var _containerLayer: CALayer!
    var _sliceValues: [Float]?
    
    func doInitialSetup(){
        self._containerLayer = CALayer()
        self.layer.addSublayer(_containerLayer)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.doInitialSetup()
        updateSlices()
    }
    
    required init(coder: NSCoder){
        super.init(coder: coder)
        self.doInitialSetup()
        updateSlices()
    }
    
    func setSliceValues(sliceValues: [Float]){
        self._sliceValues = sliceValues
        
        self._normalizedValues = NSMutableArray()
        var total: Float = 0
        for num in sliceValues{
            total = total + num
        }
        for num in sliceValues{
            //println(num)
            _normalizedValues?.addObject(NSNumber(float: num/total))
        }
        self.updateSlices()
    }
    
//    override func willMoveToSuperview(newSuperview: UIView?) {
//        let circleLayer = CAShapeLayer()
//        let offset = CGPointMake((self.bounds.size.width-150)/2, (self.bounds.size.height-150)/2)
//        circleLayer.path = (UIBezierPath(ovalInRect: CGRectMake(offset.x, offset.y, 150, 150))).CGPath
//        circleLayer.fillColor = UIColor(white: 0.25, alpha: 1).CGColor
//        
//        self.layer.addSublayer(circleLayer)
//    }
    
    func updateSlices(){
        self._containerLayer.frame = self.bounds
        if let normalizedValues = _normalizedValues{
            if let sublayers = _containerLayer.sublayers{
                if(normalizedValues.count > sublayers.count){
                    let count = normalizedValues.count - sublayers.count
                    for index in 0...count{
                        let slice = PieSliceLayer()
                        slice.strokeColor = UIColor(white: 0.25, alpha: 1.0)
                        slice.strokeWidth = 0.5
                        slice.frame = self.bounds
                        _containerLayer.addSublayer(slice)
                    }
                }
                else if (normalizedValues.count < sublayers.count){
                    //println(sublayers.count)
                    //println(normalizedValues.count)
                    let count = sublayers.count - normalizedValues.count
                    //println(count)
                    for index in 0...count-1{
                        _containerLayer.sublayers[0].removeFromSuperlayer()
                    }
                }
            }
            else{
                if(normalizedValues.count > 0){
                    let count = normalizedValues.count
                    for index in 0...count{
                        let slice = PieSliceLayer()
                        slice.strokeColor = UIColor(white: 0.25, alpha: 1.0)
                        slice.strokeWidth = 0.5
                        slice.frame = self.bounds
                        _containerLayer.addSublayer(slice)
                    }
                }
                else if (normalizedValues.count < 0){
                    let count = 0 - normalizedValues.count
                    for index in 0...count{
                        _containerLayer.sublayers[0].removeFromSuperlayer()
                    }
                }
            }
        }
        
        var startAngle: CGFloat = 0
        var index: Int = 0
        if let normalizedValues = _normalizedValues{
            let count = normalizedValues.count
            //println(count)
            for num in normalizedValues{
                let numFloat = num as! Double
                let angle = numFloat * 2 * M_PI
                let slice = _containerLayer.sublayers[index] as! PieSliceLayer
                slice.fillColor = UIColor(hue: CGFloat(Float(index)/Float(count)), saturation: 0.5, brightness: 0.75, alpha: 1.0)
                //println("index: \(index), count: \(count), index/count: \(index/count)")
                slice.startAngle = startAngle
                slice.endAngle = startAngle + CGFloat(angle)
                
                startAngle = startAngle + CGFloat(angle)
                //println("startAngle = \(startAngle), slice.startAngle = \(slice.startAngle)")
                index = index + 1
            }
        }
    }
}
