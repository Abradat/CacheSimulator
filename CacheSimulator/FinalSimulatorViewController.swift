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
    
    @IBOutlet var titleLabel: UILabel!
    @IBAction func backHome(_ sender: Any) {
        performSegue(withIdentifier: "backHome", sender: self)
    }
    
    var graphView :ScrollableGraphView? = nil
    var data: [Double] = [0.0]
    let labels = ["Hit Ratio"]
    var hitRatio : Float! {
        didSet {
            data[0] = Double(hitRatio) * 100
            graphView?.set(data: data, withLabels: labels)
        }
    }
    var titleVal : String? = ""
    
    
    override func viewDidLoad() {
        titleLabel.text = titleVal
        titleLabel.sizeToFit()
    }
    override func loadView() {
        super.loadView()
        graphView = createGraph(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height * (2/3)))
        graphView?.set(data: data, withLabels: labels)
        view.addSubview(graphView!)
        
        view.backgroundColor = UIColor.colorFromHex(hexString: "#333333")
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}
