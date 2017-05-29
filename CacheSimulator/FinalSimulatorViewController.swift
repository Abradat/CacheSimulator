//
//  FinalSimulatorViewController.swift
//  CacheSimulator
//
//  Created by Shayan Khorsandi on 5/29/17.
//  Copyright © 2017 Shayan Khorsandi. All rights reserved.
//

import UIKit
import ScrollableGraphView

class FinalSimulatorViewController : FinalSimulatorChartViewController {
    
    let data: [Double] = [4, 8, 15, 16, 23, 42, 48, 50]
    var hitRatio : Float! 
    
    let labels = ["one", "two", "three", "four", "five", "six", "seven", "eight"]
    var graphView :ScrollableGraphView? = nil
    
    /*override func viewDidLoad() {
        super.viewDidLoad()
        graphView = createGraph(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height/2))
        graphView?.set(data: data, withLabels: labels)
        view.addSubview(graphView!)
    }
 */
    override func loadView() {
        super.loadView()
        graphView = createGraph(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height * (2/3)))
        graphView?.set(data: data, withLabels: labels)
        view.addSubview(graphView!)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}
