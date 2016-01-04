//
//  PencilBrush.swift
//  DrawingBoard
//
//  Created by ZhuDuan on 16/1/4.
//  Copyright © 2016年 Anthony. All rights reserved.
//

import UIKit

class PencilBrush: BaseBrush {
    
    // 如果lastPoint为nil则基于beginPoint画线，否则基于lastPoint画线
    
    override func drawingInContext(context: CGContextRef) {
        if let lastPoint = self.lastPoint {
            CGContextMoveToPoint(context, lastPoint.x, lastPoint.y)
            CGContextAddLineToPoint(context, endPoint.x, endPoint.y)
        } else {
            CGContextMoveToPoint(context, beginPoint.x, beginPoint.y)
            CGContextAddLineToPoint(context, endPoint.x, endPoint.y)
        }
    }
    
    override func supportedContinuousDrawing() -> Bool {
        return true
    }
}
