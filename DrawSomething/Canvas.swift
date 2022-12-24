//
//  Canvas.swift
//  DrawSomething
//
//  Created by Peiyun on 2022/12/24.
//

import UIKit

class Canvas: UIView {
    
    //畫筆顏色
    var lineColor = UIColor.white
    //畫筆粗細
    var lineWidth:CGFloat = 2
    //作畫時兩點中間的路徑(因確定一定會給值，故可加驚嘆號)
    var path:UIBezierPath!
    //記錄觸碰的點
    var touchPoint:CGPoint!
    //記錄第一筆的點
    var startingPoint:CGPoint!
    
    
    //一碰到UIView要做的事
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //拿到第一個觸碰點
        startingPoint = touches.first?.location(in: self)
    }
    
    //手碰到畫板尚未拿起來
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        touchPoint = touches.first?.location(in: self)
        //建立路徑
        path = UIBezierPath()
        //先把路徑的一個端點移到startingPoint
        path.move(to: startingPoint)
        //畫一條線
        path.addLine(to: touchPoint)
        //把目前的touchPoint設定給startingPoint。手如果繼續移動，持續觸發touchesMoved的話，就會把現在這一點當作startingPoint
        startingPoint = touchPoint
        draw()
    }

    func draw() {
        //產生CAShapeLayer物件
        let shapeLayer = CAShapeLayer()
        //兩點中間的路徑
        //(shapeLayer.path屬性是cgPath， path屬性是UIBezierPath)
        shapeLayer.path = path.cgPath
        //描邊顏色
        //(shapeLayer.strokeColor屬性是cgColor， path屬性是UIColor)
        shapeLayer.strokeColor = lineColor.cgColor
        //畫筆粗細
        shapeLayer.lineWidth = lineWidth
        //填充顏色
        shapeLayer.fillColor = UIColor.clear.cgColor
        //呼叫我們自己的cgLayler這一層
        self.layer.addSublayer(shapeLayer)
        //要求系統重新繪製加入好線段的這個UIView
        self.setNeedsDisplay()
    }
    
    //清空畫板
    func clearCanvas(){
        //移除所有的點
        path.removeAllPoints()
        //清空之前設定的Sublayer
        self.layer.sublayers = nil
        //要求系統重新執行這個UIView
        self.setNeedsDisplay()
    }

}

/*
// Only override draw() if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
override func draw(_ rect: CGRect) {
    // Drawing code
}
*/
