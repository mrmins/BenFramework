//
//  LinearChart.swift
//  bensframework
//
//  Created by Jarvis on 4/21/18.
//  Copyright © 2018 Jarvis. All rights reserved.
//

import UIKit

public class LinearChart: UIView {

    private var axesView:UIView = UIView()
    private var chartView:UIView = UIView()
    
    @IBInspectable public var lineColor: UIColor = UIColor.red {
        didSet {
            
        }
    }
    
    @IBInspectable public var circleColor: UIColor = UIColor.red {
        didSet {
            
        }
    }
    
    @IBInspectable public var circleInternalColor: UIColor = UIColor.white {
        didSet {
            
        }
    }
    
    @IBInspectable public var lineWeight: CGFloat = 0.3 {
        didSet {
            
        }
    }
    
    @IBInspectable public var circleRadius: CGFloat = 3 {
        didSet {
            
        }
    }
    
    public var dataset:[LinearChartModel] = [LinearChartModel]() {
        didSet {
            axesView.layer.sublayers = nil
            chartView.layer.sublayers = nil
            createAxis()
            renderValues()
            renderCircles()
        }
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    private func setupViews(){
        axesView = UIView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        chartView = UIView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        addSubview(axesView)
        addSubview(chartView)
    }
    
    private func createAxis(){
        let path = UIBezierPath()
        let shapeLayer = CAShapeLayer()
        
        //Y axis
        path.move(to: CGPoint(x: 1, y: 1))
        path.addLine(to: CGPoint(x: 1, y: frame.height - 1))
        
        //X axis
        path.move(to: CGPoint(x: 1, y: frame.height - 1))
        path.addLine(to: CGPoint(x: frame.width - 1, y: frame.height - 1))
        
        //Drawing vertical lines
        for i in 0...5 {
            path.move(to: CGPoint(x: (frame.width / 5) * CGFloat(i), y: 1))
            path.addLine(to: CGPoint(x: (frame.width / 5) * CGFloat(i), y: frame.height - 1))
        }
        
        //Drawing horizontal lines
        for i in 0...5 {
            path.move(to: CGPoint(x: 1, y: (frame.height / 5) * CGFloat(i) ))
            path.addLine(to: CGPoint(x: frame.width - 1, y: (frame.height / 5) * CGFloat(i) ))
        }
        
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = lineColor.cgColor
        shapeLayer.fillColor = UIColor.white.cgColor
        shapeLayer.lineWidth = 0.3
        shapeLayer.position = CGPoint(x: 10, y: 10)
        axesView.layer.addSublayer(shapeLayer)
    }
    
    func renderValues() {
        let path = UIBezierPath()
        let shapeLayer = CAShapeLayer()
        
        for i in 0...dataset.count-2 {
            path.move(to: CGPoint(x: dataset[i].x, y: dataset[i].y))
            path.addLine(to: CGPoint(x: dataset[i + 1].x, y: dataset[i + 1].y))
        }
        
        path.close()
        shapeLayer.path = path.cgPath
        
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.fillColor = UIColor.white.cgColor
        shapeLayer.lineWidth = 3
        shapeLayer.position = CGPoint(x: 10, y: 10)
        chartView.layer.addSublayer(shapeLayer)
    }
    
    func renderCircles() {
        let radius:CGFloat = 5
        for item in dataset {
            let circlePath = UIBezierPath(arcCenter: CGPoint(x: item.x + (2 * radius), y: item.y + (2 * radius)), radius: radius, startAngle: CGFloat(0), endAngle:CGFloat(Double.pi * 2), clockwise: true)
            let shapeLayer = CAShapeLayer()
            shapeLayer.path = circlePath.cgPath
            shapeLayer.fillColor = circleInternalColor.cgColor
            shapeLayer.strokeColor = circleColor.cgColor
            shapeLayer.lineWidth = circleRadius
            chartView.layer.addSublayer(shapeLayer)
        }
    }
    
}
