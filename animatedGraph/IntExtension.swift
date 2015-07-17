//
//  IntExtension.swift
//  animatedGraph
//
//  Created by Ankur Goswami on 7/6/15.
//  Copyright (c) 2015 Ankur Goswami. All rights reserved.
//

import UIKit

extension Int{
    var degreesToRadians: CGFloat {
        return CGFloat(self) * CGFloat(M_PI) / 180.0
    }
}