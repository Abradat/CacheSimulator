//
//  simViewController.swift
//  CacheSimulator
//
//  Created by Sajjad Aboutalebi on 5/29/17.
//  Copyright © 2017 Shayan Khorsandi. All rights reserved.
//

import UIKit
import ScrollableGraphView
class simViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    func createGraph(frame: CGRect) -> ScrollableGraphView {
        let graphView = ScrollableGraphView(frame: frame)
        
        let data: [Double] = [4, 8, 15, 16, 23, 42, 48, 50]
        
        let labels = ["one", "two", "three", "four", "five", "six", "seven", "eight"]
        
        
        
        //graphView.set(data: data, withLabels: labels)
        graphView.backgroundFillColor = UIColor.colorFromHex(hexString: "#333333")
        
        graphView.lineWidth = 1
        graphView.lineColor = UIColor.colorFromHex(hexString: "#777777")
        graphView.lineStyle = ScrollableGraphViewLineStyle.smooth
        
        graphView.shouldFill = true
        graphView.fillType = ScrollableGraphViewFillType.gradient
        graphView.fillColor = UIColor.colorFromHex(hexString: "#555555")
        graphView.fillGradientType = ScrollableGraphViewGradientType.linear
        graphView.fillGradientStartColor = UIColor.colorFromHex(hexString: "#555555")
        graphView.fillGradientEndColor = UIColor.colorFromHex(hexString: "#444444")
        
        graphView.dataPointSpacing = 80
        graphView.dataPointSize = 2
        graphView.dataPointFillColor = UIColor.white
        
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
