//
//  DocumentViewController.swift
//  CacheSimulator
//
//  Created by Sajjad Aboutalebi on 5/30/17.
//  Copyright © 2017 Shayan Khorsandi. All rights reserved.
//

import UIKit
import PTPopupWebView

class DocumentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let popupvc = PTPopupWebView(frame: view.frame)
        popupvc.addButton(PTPopupWebViewButton(type: .custom))
        popupvc.URL(string: "https://github.com/Abradat/CacheSimulator/blob/master/README.md")
        popupvc.title("")
        
        view.addSubview(popupvc)
    }

    

}
