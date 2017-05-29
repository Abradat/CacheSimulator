//
//  FinalSimulatorChart.swift
//  CacheSimulator
//
//  Created by Shayan Khorsandi on 5/29/17.
//  Copyright © 2017 Shayan Khorsandi. All rights reserved.
//

import UIKit
import ScrollableGraphView

class FinalSimulatorChartViewController : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func createGraph(frame: CGRect) -> ScrollableGraphView {
        let graphView = ScrollableGraphView(frame: frame)
        
        graphView.shouldDrawDataPoint = false
        graphView.lineColor = UIColor.clear
        
        // Tell the graph it should draw the bar layer instead.
        graphView.shouldDrawBarLayer = true
        
        // Customise the bar.
        graphView.barWidth = 25
        graphView.barLineWidth = 1
        graphView.barLineColor = UIColor.colorFromHex(hexString: "#777777")
        graphView.barColor = UIColor.colorFromHex(hexString: "#555555")
        graphView.backgroundFillColor = UIColor.colorFromHex(hexString: "#333333")
        
        graphView.referenceLineLabelFont = UIFont.boldSystemFont(ofSize: 8)
        graphView.referenceLineColor = UIColor.white.withAlphaComponent(0.2)
        graphView.referenceLineLabelColor = UIColor.white
        graphView.numberOfIntermediateReferenceLines = 5
        graphView.dataPointLabelColor = UIColor.white.withAlphaComponent(0.5)
        
        graphView.shouldAnimateOnStartup = true
        graphView.shouldAdaptRange = true
        graphView.adaptAnimationType = ScrollableGraphViewAnimationType.elastic
        graphView.animationDuration = 1.5
        graphView.rangeMax = 50
        graphView.shouldRangeAlwaysStartAtZero = true
        
        
        graphView.topMargin = 50.0
        
        
        return graphView
    }
}
