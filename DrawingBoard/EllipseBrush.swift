//
//  EllipseBrush.swift
//  DrawingBoard
//
//  Created by ZhuDuan on 16/1/4.
//  Copyright © 2016年 Anthony. All rights reserved.
//

import UIKit

class EllipseBrush: BaseBrush {
    
    override func drawingInContext(context: CGContextRef) {
        CGContextAddEllipseInRect(context, CGRect(origin: CGPoint(x: min(beginPoint.x, endPoint.x), y: min(beginPoint.y, endPoint.y)), size: CGSize(width: abs(endPoint.x - beginPoint.x), height: abs(endPoint.y - beginPoint.y))))
    }
}