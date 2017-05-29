//
//  aboutViewController.swift
//  CacheSimulator
//
//  Created by Sajjad Aboutalebi on 5/30/17.
//  Copyright © 2017 Shayan Khorsandi. All rights reserved.
//

import UIKit
import PTPopupWebView

class aboutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        let popupvc = PTPopupWebView(frame: view.frame)
        popupvc.addButton(PTPopupWebViewButton(type: .custom))
        popupvc.URL(string: "https://github.com/")
        popupvc.title("")
        
        view.addSubview(popupvc)
 
        
        
    }

}
