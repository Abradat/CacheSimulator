//
//  ChartViewController.swift
//  CacheSimulator
//
//  Created by Shayan Khorsandi on 5/24/17.
//  Copyright © 2017 Shayan Khorsandi. All rights reserved.
//

import UIKit
import ScrollableGraphView

class ChartViewController : UIViewController{
    
    //@IBOutlet weak var barChart: BarChartView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let graphView = ScrollableGraphView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height * (2/3)))
        let data: [Double] = [4, 8, 15, 16, 23, 42, 48, 50]
        
        let labels = ["one", "two", "three", "four", "five", "six", "seven", "eight"]
        //graphView.setData(data, withLabels: labels)
        graphView.set(data: data, withLabels: labels)
        graphView.shouldAdaptRange = true
        graphView.shouldAnimateOnAdapt = true
        //graphView.backgroundFillColor = UIColor.colorFromHex("#00BFFF")
        graphView.backgroundFillColor = UIColor(red:0.00, green:0.75, blue:1.00, alpha:1.0)
        //graphView.lineColor = UIColor.clearColor
        
        graphView.dataPointSize = 5
        graphView.dataPointSpacing = 80
        graphView.dataPointLabelFont = UIFont.boldSystemFont(ofSize: 10)
        graphView.dataPointLabelColor = UIColor.white
        graphView.dataPointFillColor = UIColor.white
        
        graphView.referenceLineLabelFont = UIFont.boldSystemFont(ofSize: 10)
        graphView.referenceLineColor = UIColor.white.withAlphaComponent(0.5)
        graphView.referenceLineLabelColor = UIColor.white
        
        graphView.numberOfIntermediateReferenceLines = 9
        
        graphView.rangeMax = 50
        
        self.view.addSubview(graphView)
        
    }
}
