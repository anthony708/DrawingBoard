//
//  EraserBrush.swift
//  DrawingBoard
//
//  Created by ZhuDuan on 16/1/4.
//  Copyright © 2016年 Anthony. All rights reserved.
//

import UIKit

class EraserBrush: BaseBrush {
    
    override func drawingInContext(context: CGContextRef) {
        CGContextSetBlendMode(context, CGBlendMode.Clear)
        
        super.drawingInContext(context)
    }
}
