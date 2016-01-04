//
//  LineBrush.swift
//  DrawingBoard
//
//  Created by ZhuDuan on 16/1/4.
//  Copyright © 2016年 Anthony. All rights reserved.
//

import UIKit

class LineBrush: BaseBrush {
    
    override func drawingInContext(context: CGContextRef) {
        CGContextMoveToPoint(context, beginPoint.x, beginPoint.y)
        CGContextAddLineToPoint(context, endPoint.x, endPoint.y)
    }
}
