//
//  SimulatorViewController.swift
//  CacheSimulator
//
//  Created by Shayan Khorsandi on 5/28/17.
//  Copyright © 2017 Shayan Khorsandi. All rights reserved.
//

import UIKit

class SimulatorViewController : UIViewController {
    
    var addresses = Addresses()
    var addressType : String!
    var directMapping : DirectMapping! {
        didSet{
            navigationItem.title = "Direct Mapping"
        }
    }
    var fullAssociative : FullyAssociative! {
        didSet {
            navigationItem.title = "Fully Associative"
        }
    }
    
    var setAssociative : SetAssociative! {
        didSet {
            navigationItem.title = "Set Associative"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print(addressType)
    }
}
