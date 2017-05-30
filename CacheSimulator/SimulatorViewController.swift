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
    var hitRate : [Double] = [0.0]
    var rate : Float?
    var remain : Int?
    var addresses : Addresses = Addresses()
    var addressType : String!
    var flag : [Int] = [0, 0, 0]
    var defaultBarColor : UIColor?
    var defaultColor : UIColor?
    var titleVal : String? = ""
    
    var directMapping : DirectMapping! {
        didSet{
            //navigationItem.title = "Direct Mapping"
            titleVal = "Direct Mapped"
            self.flag[0] = 1
            self.flag[1] = 0
            self.flag[2] = 0
            
        }
    }
    var fullAssociative : FullyAssociative! {
        didSet {
            //navigationItem.title = "Fully Associative"
            //titleLabel.text = "Fully Associative"
            titleVal = "Fully Associative"
            self.flag[0] = 0
            self.flag[1] = 1
            self.flag[2] = 0
        }
    }
    
    var setAssociative : SetAssociative! {
        didSet {
            //navigationItem.title = "Set Associative"
            //titleLabel.text = "Set Associative"
            titleVal = "Set Associative"
            self.flag[0] = 0
            self.flag[1] = 0
            self.flag[2] = 1
        }
    }
    
    
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var addressValLabel: UILabel!
    @IBOutlet weak var blockLabel: UILabel!
    @IBOutlet weak var blockValLabel: UILabel!
    @IBOutlet weak var hitMissLabel: UILabel!
    
    
    @IBAction func back(_ sender: Any) {
        performSegue(withIdentifier: "back", sender: self)
    }
    @IBAction func run(_ sender: Any) {
        performSegue(withIdentifier: "run", sender: self)
    }
    
    @IBAction func nextStep(_ sender: Any) {
        
        if(flag[0] == 1) {
            
            if(addressType == "art") {
                res = directMapping.simulate(address: Int(addresses.art[cnt], radix : 16)!)
                addressValLabel.text = "0x" + addresses.art[cnt].uppercased()
                //blockValLabel.text = String(directMapping.getAddressBlock(address: Int(addresses.art[cnt])!))
                blockValLabel.text = res[2]
                
            }
            else if(addressType == "mcf") {
                res = directMapping.simulate(address: Int(addresses.mcf[cnt], radix : 16)!)
                addressValLabel.text = "0x" + addresses.mcf[cnt].uppercased()
                //blockValLabel.text = String(directMapping.getAddressBlock(address: Int(addresses.mcf[cnt])!))
                blockValLabel.text = res[2]
                
            }
            else {
                res = directMapping.simulate(address: Int(addresses.swim[cnt], radix : 16)!)
                addressValLabel.text = "0x" + addresses.swim[cnt].uppercased()
                blockValLabel.text = res[2]
            }
            
            rate = directMapping.hitRatio()
            
            if(res[0] == "hit") {
                hitMissLabel.text = "HIT"
                hitMissLabel.backgroundColor = UIColor(red: 0.0, green: 0.502, blue: 0.251, alpha: 1.0)
                hitMissLabel.textColor = UIColor.white
            }
            else {
                hitMissLabel.text = "MISS"
                hitMissLabel.backgroundColor = UIColor(red: 0.502, green: 0.0, blue: 0.0, alpha: 1.0)
                hitMissLabel.textColor = UIColor.white
            }
            
            
        }
            
        else if (flag[1] == 1) {
            
            if(addressType == "art") {
                res = fullAssociative.simulate(address: Int(addresses.art[cnt], radix : 16)!)
                addressValLabel.text = "0x" + addresses.art[cnt].uppercased()
                //blockValLabel.text = String(directMapping.getAddressBlock(address: Int(addresses.art[cnt])!))
                blockValLabel.text = res[2]
                
            }
            else if(addressType == "mcf") {
                res = fullAssociative.simulate(address: Int(addresses.mcf[cnt], radix : 16)!)
                addressValLabel.text = "0x" + addresses.mcf[cnt].uppercased()
                //blockValLabel.text = String(directMapping.getAddressBlock(address: Int(addresses.mcf[cnt])!))
                blockValLabel.text = res[2]
                
            }
            else {
                res = fullAssociative.simulate(address: Int(addresses.swim[cnt], radix : 16)!)
                addressValLabel.text = "0x" + addresses.swim[cnt].uppercased()
                blockValLabel.text = res[2]
            }
            
            rate = fullAssociative.hitRatio()
            
            if(res[0] == "hit") {
                hitMissLabel.text = "HIT"
                hitMissLabel.backgroundColor = UIColor(red: 0.0, green: 0.502, blue: 0.251, alpha: 1.0)
                hitMissLabel.textColor = UIColor.white
            }
            else {
                hitMissLabel.text = "MISS"
                hitMissLabel.backgroundColor = UIColor(red: 0.502, green: 0.0, blue: 0.0, alpha: 1.0)
                hitMissLabel.textColor = UIColor.white
            }
            
        }
        else {
            
            if(addressType == "art") {
                res = setAssociative.simulate(address: Int(addresses.art[cnt], radix : 16)!)
                addressValLabel.text = "0x" + addresses.art[cnt].uppercased()
                //blockValLabel.text = String(directMapping.getAddressBlock(address: Int(addresses.art[cnt])!))
                blockValLabel.text = res[2]
                
            }
            else if(addressType == "mcf") {
                res = setAssociative.simulate(address: Int(addresses.mcf[cnt], radix : 16)!)
                addressValLabel.text = "0x" + addresses.mcf[cnt].uppercased()
                //blockValLabel.text = String(directMapping.getAddressBlock(address: Int(addresses.mcf[cnt])!))
                blockValLabel.text = res[2]
                
            }
            else {
                res = setAssociative.simulate(address: Int(addresses.swim[cnt], radix : 16)!)
                addressValLabel.text = "0x" + addresses.swim[cnt].uppercased()
                blockValLabel.text = res[2]
            }
            
            rate = setAssociative.hitRatio()
            
            if(res[0] == "hit") {
                hitMissLabel.text = "HIT"
                hitMissLabel.backgroundColor = UIColor(red: 0.0, green: 0.502, blue: 0.251, alpha: 1.0)
                hitMissLabel.textColor = UIColor.white
            }
            else {
                hitMissLabel.text = "MISS"
                hitMissLabel.backgroundColor = UIColor(red: 0.502, green: 0.0, blue: 0.0, alpha: 1.0)
                hitMissLabel.textColor = UIColor.white
            }
            
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


    override func loadView() {
        super.loadView()
        graphView = createGraph(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height/2))
        graphView?.set(data: hitRate, withLabels: range)
        view.addSubview(graphView!)
        
        view.backgroundColor = UIColor.colorFromHex(hexString: "#333333")
        hitMissLabel.text = "Hit/Miss"
        
        
    }
    
    func runSimulation() -> Float {
        print("start")
        var cnt : Int = 0
        var hitRate : Float?
        if(flag[0] == 1) {
            
            if(addressType == "art") {
                //res = directMapping.simulate(address: Int(addresses.art[cnt], radix : 16)!)
                for address in addresses.art {
                    _ = directMapping.simulate(address: Int(address, radix : 16)!)
                    cnt += 1
                }
                
            }
            else if(addressType == "mcf") {
                for address in addresses.mcf {
                    _ = directMapping.simulate(address: Int(address, radix : 16)!)
                }
                
            }
            else {
                for address in addresses.swim {
                    _ = directMapping.simulate(address: Int(address, radix : 16)!)
                }
            }
            
            hitRate = directMapping.hitRatio()
        }
        else if (flag[1] == 1) {
            
            if(addressType == "art") {
                for address in addresses.art {
                    _ = fullAssociative.simulate(address: Int(address, radix : 16)!)
                }
                
            }
            else if(addressType == "mcf") {
                for address in addresses.mcf {
                    _ = fullAssociative.simulate(address: Int(address, radix : 16)!)
                }
                
            }
            else {
                for address in addresses.swim {
                    _ = fullAssociative.simulate(address: Int(address, radix : 16)!)
                }
            }
            
            hitRate = fullAssociative.hitRatio()
            
        }
            
        else {
            
            if(addressType == "art") {
                for address in addresses.art {
                    _ = setAssociative.simulate(address: Int(address, radix : 16)!)
                }
                
            }
            else if(addressType == "mcf") {
                for address in addresses.mcf {
                    _ = setAssociative.simulate(address: Int(address, radix : 16)!)
                }
                
            }
            else {
                for address in addresses.swim {
                    _ = setAssociative.simulate(address: Int(address, radix : 16)!)
                }
            }
            
            hitRate = setAssociative.hitRatio()
            
        }
        print("finished \(cnt)")
        return hitRate!
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = titleVal
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "back"?:
            fullAssociative = nil
            setAssociative = nil
            directMapping = nil
        case "run"?:
            
            let finalSimulatorViewController = segue.destination as! FinalSimulatorViewController
            finalSimulatorViewController.hitRatio = runSimulation()
            if(flag[0] == 1) { finalSimulatorViewController.titleVal = "Direct Mapped" }
            else if (flag[1] == 1) { finalSimulatorViewController.titleVal = "Fully Associative" }
            else { finalSimulatorViewController.titleVal = "Set Associative" }
            
        default:
            preconditionFailure("Unexpected segue identifier.")
        }

    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
}
