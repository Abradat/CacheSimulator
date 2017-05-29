//
//  aboutViewController.swift
//  CacheSimulator
//
//  Created by Sajjad Aboutalebi on 5/30/17.
//  Copyright © 2017 Shayan Khorsandi. All rights reserved.
//

import UIKit


class aboutViewController: UIViewController {

    @IBAction func contactus(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://github.com/Abradat/CacheSimulator/issues")!)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
 
        
        
    }

}
