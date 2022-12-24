//
//  ViewController.swift
//  DrawSomething
//
//  Created by Peiyun on 2022/12/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var canvas: Canvas!
    
    
    
    @IBAction func clear(_ sender: UIButton) {
        canvas.clearCanvas()      
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //設定畫布不超過畫板
        canvas.clipsToBounds = true
        //只能用一根指頭作畫(關掉多點觸控)
        canvas.isMultipleTouchEnabled = false
    }


}

