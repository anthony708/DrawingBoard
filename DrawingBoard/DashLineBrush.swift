//
//  DashLineBrush.swift
//  DrawingBoard
//
//  Created by ZhuDuan on 16/1/4.
//  Copyright © 2016年 Anthony. All rights reserved.
//

import UIKit

class DashLineBrush: BaseBrush {
    
    override func drawingInContext(context: CGContextRef) {
        let length: [CGFloat] = [self.strokeWidth * 3, self.strokeWidth * 3]
        CGContextSetLineDash(context, 0, length, 2)
        
        CGContextMoveToPoint(context, beginPoint.x, beginPoint.y)
        CGContextAddLineToPoint(context, endPoint.x, endPoint.y)
    }
}
