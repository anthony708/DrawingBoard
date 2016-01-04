//
//  BaseBrush.swift
//  DrawingBoard
//
//  Created by ZhuDuan on 16/1/4.
//  Copyright © 2016年 Anthony. All rights reserved.
//

import CoreGraphics

protocol PaintBrush {
    
    func supportedContinuousDrawing() -> Bool;
    
    func drawingInContext(context: CGContextRef)
    
}
class BaseBrush: NSObject, PaintBrush {
    var beginPoint: CGPoint!
    var endPoint: CGPoint!
    var lastPoint: CGPoint?
    
    var strokeWidth: CGFloat!
    
    func supportedContinuousDrawing() -> Bool {
        return false
    }
    
    func drawingInContext(context: CGContextRef) {
        assert(false, "must implements in subclass.")
    }
}