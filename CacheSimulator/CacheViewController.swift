//
//  CacheViewController.swift
//  CacheSimulator
//
//  Created by Shayan Khorsandi on 5/23/17.
//  Copyright © 2017 Shayan Khorsandi. All rights reserved.
//

import UIKit
import Eureka


class CacheViewController : FormViewController {
    
    
    @IBOutlet var simulateButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        form
            +++ Section()
            +++ Section("Configuration")
            <<< ActionSheetRow<String>() {
                $0.title = "RAM Size"
                $0.tag = "ram"
                $0.selectorTitle = "Pick your Ram Size"
                $0.options = ["512 KB","1 MB","2 MB", "4 MB", "8 MB", "16 MB"]
                $0.value = "512 KB"    // initially selected
            }
            
            <<< ActionSheetRow<String>() {
                $0.title = "Cache Size"
                $0.tag = "cache"
                $0.selectorTitle = "Pick your Cache Size"
                $0.options = ["1KB","2KB","4KB", "8 KB"]
                $0.value = "1 KB"    // initially selected
            }
            
            <<< ActionSheetRow<String>() {
                $0.title = "Block Size"
                $0.tag = "block"
                $0.selectorTitle = "Pick your Block Size"
                $0.options = ["128 B","256 B","512 B", "1 KB", "2 KB"]
                $0.value = "128 B"    // initially selected
                
            }
            
            <<< ActionSheetRow<String>() {
                $0.title = "Method"
                $0.tag = "method"
                $0.selectorTitle = "Pick your Method"
                $0.options = ["Direct Mapped","Fully Associative","Set Associative"]
                $0.value = "Direct Mapped"    // initially selected
                $0.onChange() {[unowned self] row in
                    
                    if(row.value! == "Fully Associative") {
                        let algoRow = self.form.rowBy(tag: "algorithm")
                        algoRow?.disabled = false
                        algoRow?.evaluateDisabled()
                        
                        let wayRow = self.form.rowBy(tag: "way")
                        wayRow?.disabled = true
                        wayRow?.evaluateDisabled()
                    }
                    else if (row.value! == "Set Associative") {
                        let algoRow = self.form.rowBy(tag: "algorithm")
                        algoRow?.disabled = true
                        algoRow?.evaluateDisabled()
                        
                        let wayRow = self.form.rowBy(tag: "way")
                        wayRow?.disabled = false
                        wayRow?.evaluateDisabled()
                    }
                    
                    else {
                        let algoRow = self.form.rowBy(tag: "algorithm")
                        algoRow?.disabled = true
                        algoRow?.evaluateDisabled()
                        
                        let wayRow = self.form.rowBy(tag: "way")
                        wayRow?.disabled = true
                        wayRow?.evaluateDisabled()
                    }
                }
            }
            
            <<< ActionSheetRow<String>() {
                $0.title = "Set ?-Way"
                $0.tag = "way"
                $0.selectorTitle = "Set number of your ways"
                $0.options = ["2","4","8"]
                $0.value = "2"    // initially selected
                $0.disabled = true
            }
            
            <<< ActionSheetRow<String>() {
                $0.title = "Algorithm"
                $0.tag = "algorithm"
                $0.selectorTitle = "Pick your Algorithm"
                $0.options = ["LRU","FIFO","Random"]
                $0.value = "LRU"    // initially selected
                $0.disabled = true
            }
            
            
            +++ Section("Address Trace Selection")
            <<< SegmentedRow<String>(){
                $0.tag = "address"
                $0.options = ["Random","art","mcf", "swim"]
                $0.value = "Random"    // initially selected

        }
            
        +++ Section()
            <<< ButtonRow() {
                $0.title = "Start"
        }.onCellSelection({ (buttom, row) in
            //print("Buttom Pressed")
            self.performSegue(withIdentifier: "start", sender: self)
            
        })
    
        tableView?.separatorStyle = .singleLine
        tableView?.isScrollEnabled = true

        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let methodRow = self.form.rowBy(tag: "method")
        let ramRow = self.form.rowBy(tag: "ram")
        //let ramSize = Int(String(ramRow!.baseValue.components(separatedBy: " ")[0])
        var ramSize = Int(String(describing: ramRow!.baseValue!).components(separatedBy: " ")[0])!
        if(ramSize == 512) { ramSize *= Int(pow(2.0, 10.0)) }
        else { ramSize *= Int(pow(2.0, 20.0)) }
        
        let cacheRow = self.form.rowBy(tag: "cache")
        var cacheSize = Int(String(describing: cacheRow!.baseValue!).components(separatedBy: " ")[0])!
        cacheSize *= Int(pow(2.0, 10.0))
        
        let blockRow = self.form.rowBy(tag: "block")
        var blockSize = Int(String(describing: blockRow!.baseValue!).components(separatedBy: " ")[0])!
        if(blockSize == 1 || blockSize == 2) { blockSize *= Int(pow(2.0, 10.0)) }
        
        let wayRow = self.form.rowBy(tag: "way")
        let ways = Int(String(describing : wayRow!.baseValue!))!
        
        let algoRow = self.form.rowBy(tag: "algorithm")
        let algorithm = String(describing : algoRow!.baseValue!).lowercased()
        
        let addressRow = self.form.rowBy(tag: "address")
        let addressType = String(describing : addressRow!.baseValue!).lowercased()
        
        //print(String(describing: methodRow!.baseValue!))
        let simulatorViewController = segue.destination as! SimulatorViewController
        
        simulatorViewController.addressType = addressType
        
        if(String(describing: methodRow!.baseValue!) == "Direct Mapped") {
            //print("direct")
            simulatorViewController.directMapping = DirectMapping(cacheSize: cacheSize, memorySize: ramSize, blockSize: blockSize)
            
        }
        else if (String(describing: methodRow!.baseValue!) == "Fully Associative") {
            //print("fully")
            simulatorViewController.fullAssociative = FullyAssociative(cacheSize: cacheSize, memorySize: ramSize, blockSize: blockSize, policy: algorithm)
        }
        else {
            //print("set")
            simulatorViewController.setAssociative = SetAssociative(cacheSize: cacheSize, memorySize: ramSize, blockSize: blockSize, k: ways)
        }
    }
    
    //func parser(myString : String) -> Int() {
    
    
    //}
    
}
