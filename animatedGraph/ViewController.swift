//
//  ViewController.swift
//  animatedGraph
//
//  Created by Ankur Goswami on 7/6/15.
//  Copyright (c) 2015 Ankur Goswami. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pieView: PieView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func animateGraph(sender: AnyObject) {
        setPieSlices()
    }
    
    func setPieSlices(){
        var randomNumbers: [Float] = []
        let count = 1 + rand() % 10
        for index in 0...count{
            randomNumbers.append(Float(rand() % 100))
        }
        pieView.setSliceValues(randomNumbers)
    }
    
//    func createPieSlice() -> CAShapeLayer{
//        let slice = CAShapeLayer()
//        slice.fillColor = UIColor.redColor().CGColor
//        slice.strokeColor = UIColor.blackColor().CGColor
//        slice.lineWidth = 3
//        
//        let angle = -60.degreesToRadians
//        let center = CGPointMake(100, 100)
//        let radius = CGFloat(100)
//        let piePath = UIBezierPath()
//        piePath.moveToPoint(center)
//        piePath.addLineToPoint(CGPointMake(CGFloat(center.x + radius * cos(angle)), CGFloat(center.y + radius * sin(angle))))
//        piePath.addArcWithCenter(center, radius: radius, startAngle: angle, endAngle: 60.degreesToRadians, clockwise: true)
//        piePath.closePath()
//        slice.path = piePath.CGPath
//        return slice
//    }


}

