//
//  ViewController.swift
//  SimpleJackDrawing
//
//  Created by Shawn Roller on 12/10/17.
//  Copyright © 2017 Shawn Roller. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var canvasView: CanvasView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func clearCanvasTapped(sender: UIButton) {
        self.canvasView.clearCanvas()
    }

}

