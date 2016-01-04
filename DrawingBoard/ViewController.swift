//
//  ViewController.swift
//  DrawingBoard
//
//  Created by ZhuDuan on 16/1/4.
//  Copyright © 2016年 Anthony. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var brushes = [PencilBrush(), LineBrush(), DashLineBrush(), RectangleBrush(), EllipseBrush(), EraserBrush()]
    
    @IBOutlet var board: Board!
    @IBOutlet var topView: UIView!
    
    @IBAction func switchBrush(sender: UISegmentedControl) {
        assert(sender.tag < self.brushes.count, "!!!")
        
        self.board.brush = self.brushes[sender.selectedSegmentIndex]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.board.brush = brushes[0]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

