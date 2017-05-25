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
            +++ Section("Configuration")
            <<< ActionSheetRow<String>() {
                $0.title = "RAM Size"
                $0.selectorTitle = "Pick your Ram Size"
                $0.options = ["512 KB","1 MB","2 MB", "4 MB", "8 MB", "16 MB"]
                $0.value = "512 KB"    // initially selected
            }
            
            <<< ActionSheetRow<String>() {
                $0.title = "Cache Size"
                $0.selectorTitle = "Pick your Cache Size"
                $0.options = ["1KB","2KB","4KB", "8 KB"]
                $0.value = "1 KB"    // initially selected
            }
            
            <<< ActionSheetRow<String>() {
                $0.title = "Block Size"
                $0.selectorTitle = "Pick your Block Size"
                $0.options = ["128 B","256 B","512 B", "1 KB", "2 KB"]
                $0.value = "128 B"    // initially selected
            }
            
            <<< ActionSheetRow<String>() {
                $0.title = "Method"
                $0.selectorTitle = "Pick your Method"
                $0.options = ["Direct Mapped","Fully Associative","Set Associative"]
                $0.value = "Direct Mapped"    // initially selected
            }
            
            <<< ActionSheetRow<String>() {
                $0.title = "Set ?-Way"
                $0.selectorTitle = "Set number of your ways"
                $0.options = ["2","4","8"]
                $0.value = "2"    // initially selected
            }
            
            <<< ActionSheetRow<String>() {
                $0.title = "Algorithm"
                $0.selectorTitle = "Pick your Algorithm"
                $0.options = ["LRU","FIFO","Random"]
                $0.value = "LRU"    // initially selected
            }
            
            
            +++ Section("Address Trace Selection")
            <<< SegmentedRow<String>(){
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
    
}
