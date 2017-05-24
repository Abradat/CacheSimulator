//
//  CacheViewController.swift
//  CacheSimulator
//
//  Created by Shayan Khorsandi on 5/23/17.
//  Copyright © 2017 Shayan Khorsandi. All rights reserved.
//

import UIKit
import Eureka
import SnapKit

class CacheViewController : UIViewController{
    
    lazy var cacheView : CacheView = CacheView(style : .plain)
    
    @IBOutlet var simulateButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        addChildViewController(cacheView)
        view.addSubview(cacheView.view)
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        /*cacheView.view.snp.makeConstraints { (maker) in
            //maker.centerX.equalToSuperview()
            maker.bottom.equalTo(simulateButton).offset(-40)
            maker.top.equalTo(view).offset(65)
            maker.left.equalTo(view)
            maker.right.equalTo(view)
            
        }*/
        
    }
    
}
