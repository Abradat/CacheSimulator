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
    
    var graphView :ScrollableGraphView? = nil
    
    @IBAction func a(_ sender: Any) {
        let adata: [Double] = [4, 8, 15, 16, 23, 42, 48, 50, 20]
        let alabels = ["one", "two", "three", "four", "five", "six", "seven", "eight", "an"]
        
        self.graphView?.set(data: adata, withLabels: alabels)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Show the navigation bar on other view controllers
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    //@IBOutlet weak var barChart: BarChartView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //let graphView = ScrollableGraphView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height * (2/3)))
        self.graphView = ScrollableGraphView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height * (2/3)))
        self.graphView?.shouldAnimateOnStartup = true
        let data: [Double] = [4, 8, 15, 16, 23, 42, 48, 50]
        
        let labels = ["one", "two", "three", "four", "five", "six", "seven", "eight"]
        //graphView.setData(data, withLabels: labels)
        self.graphView?.set(data: data, withLabels: labels)
        self.graphView?.shouldAdaptRange = true
        self.graphView?.shouldAnimateOnAdapt = true
        //graphView.backgroundFillColor = UIColor.colorFromHex("#00BFFF")
        self.graphView?.backgroundFillColor = UIColor(red:0.00, green:0.75, blue:1.00, alpha:1.0)
        //graphView.lineColor = UIColor.clearColor
        
        self.graphView?.dataPointSize = 5
        self.graphView?.dataPointSpacing = 80
        self.graphView?.dataPointLabelFont = UIFont.boldSystemFont(ofSize: 10)
        self.graphView?.dataPointLabelColor = UIColor.white
        self.graphView?.dataPointFillColor = UIColor.white
        
        self.graphView?.referenceLineLabelFont = UIFont.boldSystemFont(ofSize: 10)
        self.graphView?.referenceLineColor = UIColor.white.withAlphaComponent(0.5)
        self.graphView?.referenceLineLabelColor = UIColor.white
        
        self.graphView?.numberOfIntermediateReferenceLines = 9
        
        self.graphView?.rangeMax = 50
        
        self.view.addSubview((self.graphView)!)
        
    }
}
