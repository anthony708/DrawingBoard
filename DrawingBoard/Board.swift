//
//  Board.swift
//  DrawingBoard
//
//  Created by ZhuDuan on 16/1/4.
//  Copyright © 2016年 Anthony. All rights reserved.
//

import UIKit

// 记录每次touch的状态
enum DrawingState {
    case Began, Moved, Ended
}

class Board: UIImageView {
    
    var brush: BaseBrush?
    
    var drawingStateChangedBlock: ((state: DrawingState) -> Void)?
    
    private var realImage: UIImage?
    
    private var drawingStates: DrawingState!
    
    // - touches methods
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let brush = self.brush {
            brush.lastPoint = nil
        
            brush.beginPoint = touches.first!.locationInView(self)
            brush.endPoint = brush.beginPoint
            
            self.drawingStates = .Began
            self.drawingImages()
        }
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let brush = self.brush {
            brush.endPoint = touches.first!.locationInView(self)
            
            self.drawingStates = .Moved
            self.drawingImages()
        }
    }
    
    override func touchesCancelled(touches: Set<UITouch>?, withEvent event: UIEvent?) {
        if let brush = self.brush {
            brush.endPoint = nil
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let brush = self.brush {
            brush.endPoint = touches.first!.locationInView(self)
            
            self.drawingStates = .Ended
            self.drawingImages()
        }
    }
    
    func takeImage() -> UIImage {
        UIGraphicsBeginImageContext(self.bounds.size)
        
        self.backgroundColor?.setFill()
        UIRectFill(self.bounds)
        
        self.image?.drawInRect(self.bounds)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
    
 
    // - Drawing
    
    private func drawingImages() {
        if let brush = self.brush {
            // hook
            if let drawingStateChangedBlock = drawingStateChangedBlock {
                drawingStateChangedBlock(state: self.drawingStates)
            }
            
            // 1. 开启一个新context，保存每次的绘图状态
            
            UIGraphicsBeginImageContext(self.bounds.size)
            
            // 2. 初始化context，，进行基本设置（画壁宽度，画笔颜色，画壁圆润度等）
            
            let context = UIGraphicsGetCurrentContext()
            
            UIColor.clearColor().setFill()
            UIRectFill(self.bounds)
            
            CGContextSetLineCap(context, CGLineCap.Round)
            CGContextSetLineWidth(context, self.strokeWidth)
            CGContextSetStrokeColorWithColor(context, self.strokeColor.CGColor)
            
            // 3. 把之前保存的图片绘制进context中
            if let realImage = self.realImage {
                realImage.drawInRect(self.bounds)
            }
            
            // 4. 设置brush基本属性；调用具体的绘图方法最终添加到context中
            brush.strokeWidth = self.strokeWidth
            brush.drawingInContext(context!)
            CGContextStrokePath(context)
            
            // 5. 从当前context中得到Image，如果是ended状态或需要支持连续画图，则将Image保存到realImage中
            let previewImage = UIGraphicsGetImageFromCurrentImageContext()
            if self.drawingStates == .Ended || brush.supportedContinuousDrawing() {
                self.realImage = previewImage
            }
            
            UIGraphicsEndImageContext()
            
            // 6. 显示实时绘制状态，并记录绘制的最后一个点
            self.image = previewImage
            
            brush.lastPoint = brush.endPoint
        }
    }
    
    var strokeWidth: CGFloat
    var strokeColor: UIColor
    
    override init(frame: CGRect) {
        self.strokeColor = UIColor.blackColor()
        self.strokeWidth = 1
        
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.strokeColor = UIColor.blackColor()
        self.strokeWidth = 1
        
        super.init(coder: aDecoder)
    }
}
