//
//  PaintingBrushSettingsView.swift
//  DrawingBoard
//
//  Created by ZhuDuan on 16/1/4.
//  Copyright © 2016年 Anthony. All rights reserved.
//

import UIKit

class PaintingBrushSettingsView: UIView {

    var strokeWidthChangedBlock: ((strokeWidthL: CGFloat) -> Void)?
    var strokeColorChangedBlock: ((strokeColor: UIColor) -> Void)?
    
    @IBOutlet private var strokeWidthSlider: UISlider!
    @IBOutlet private var strokeColorPreview: UIView!
    @IBOutlet private var colorPicker: RGBColorPicker!
    
    override var backgroundColor: UIColor? {
        didSet {
            self.strokeColorPreview.backgroundColor = self.backgroundColor
            self.colorPicker.setCurrentColor(self.backgroundColor!)
            
            super.backgroundColor = oldValue
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.strokeColorPreview.layer.borderColor = UIColor.blackColor().CGColor
        self.strokeColorPreview.layer.borderWidth = 1
        
        self.colorPicker.colorChangedBlock = {
            [unowned self] (color: UIColor) in
            
            self.strokeColorPreview.backgroundColor = color
            if let strokeColorChangedBlock = self.strokeColorChangedBlock {
                strokeColorChangedBlock(strokeColor: color)
            }
        }
        
        self.strokeWidthSlider.addTarget(self, action: "strokeWidthChanged:", forControlEvents: .ValueChanged)
    }

    func strokeWidthChanged(slider: UISlider) {
        if let strokeWidthChangedBlock = self.strokeWidthChangedBlock {
            strokeWidthChangedBlock(strokeWidthL: CGFloat(slider.value))
        }
    }
}
