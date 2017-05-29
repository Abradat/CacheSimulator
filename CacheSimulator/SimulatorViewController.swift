//
//  SimulatorViewController.swift
//  CacheSimulator
//
//  Created by Shayan Khorsandi on 5/28/17.
//  Copyright © 2017 Shayan Khorsandi. All rights reserved.
//

import UIKit
import ScrollableGraphView

class SimulatorViewController : simViewController {
    
    var graphView :ScrollableGraphView? = nil
    
    var cnt : Int = 0
    var res : [String] = [" ", " ", " "]
    var range : [String] = ["10"]
    var hitRate : [Double] = [100.0]
    var rate : Float?
    var remain : Int?
    var addresses : Addresses = Addresses()
    var addressType : String!
    var flag : [Int] = [0, 0, 0]
    var defaultBarColor : UIColor?
    var defaultColor : UIColor?
    
    var directMapping : DirectMapping! {
        didSet{
            //navigationItem.title = "Direct Mapping"
            self.flag[0] = 1
            self.flag[1] = 0
            self.flag[2] = 0
            
        }
    }
    var fullAssociative : FullyAssociative! {
        didSet {
            //navigationItem.title = "Fully Associative"
            self.flag[0] = 0
            self.flag[1] = 1
            self.flag[2] = 0
        }
    }
    
    var setAssociative : SetAssociative! {
        didSet {
            //navigationItem.title = "Set Associative"
            self.flag[0] = 0
            self.flag[1] = 0
            self.flag[2] = 1
        }
    }
    
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var addressValLabel: UILabel!
    @IBOutlet weak var blockLabel: UILabel!
    @IBOutlet weak var blockValLabel: UILabel!
    @IBOutlet weak var hitMissLabel: UILabel!
    
    
    @IBAction func back(_ sender: Any) {
        performSegue(withIdentifier: "back", sender: self)
    }
    @IBAction func run(_ sender: Any) {
    }
    
    @IBAction func nextStep(_ sender: Any) {
        
        if(flag[0] == 1) {
            
            if(addressType == "art") {
                res = directMapping.simulate(address: Int(addresses.art[cnt], radix : 16)!)
                addressValLabel.text = res[1]
                //blockValLabel.text = String(directMapping.getAddressBlock(address: Int(addresses.art[cnt])!))
                blockValLabel.text = res[2]
                
            }
            else if(addressType == "mcf") {
                res = directMapping.simulate(address: Int(addresses.mcf[cnt], radix : 16)!)
                addressValLabel.text = res[1]
                //blockValLabel.text = String(directMapping.getAddressBlock(address: Int(addresses.mcf[cnt])!))
                blockValLabel.text = res[2]
                
            }
            else {
                res = directMapping.simulate(address: Int(addresses.swim[cnt], radix : 16)!)
                addressValLabel.text = res[1]
                blockValLabel.text = res[2]
            }
            
            rate = directMapping.hitRatio()
            
            if(res[0] == "hit") {
                hitMissLabel.text = "HIT"
            }
            else {
                hitMissLabel.text = "MISS"
            }
            
            cnt += 1
            remain = Int(cnt / 10)
            if(remain! + 1 > range.count) {
                range.append(String((remain! + 1) * 10))
                hitRate.append(Double(rate! * 100.0))
                graphView?.set(data: hitRate , withLabels: range)
            }
            else {
                hitRate[remain!] = Double(rate! * 100.0)
            }
            
            
        }
        else if (flag[1] == 1) {
            
        }
        else {
            
        }
    }


    override func loadView() {
        super.loadView()
        graphView = createGraph(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height/2))
        graphView?.set(data: hitRate, withLabels: range)
        view.addSubview(graphView!)
        
        view.backgroundColor = UIColor.colorFromHex(hexString: "#333333")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    
}
