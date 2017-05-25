//
//  CacheView.swift
//  CacheSimulator
//
//  Created by Shayan Khorsandi on 5/23/17.
//  Copyright © 2017 Shayan Khorsandi. All rights reserved.
//

import UIKit
import Eureka
import SnapKit

class CacheView : FormViewController{
    
    //override init(style: UITableViewStyle) {
    //    super.init(style: .plain)
    //}
    
    //init() {
    //    super.init()
    //}
    
    //required init?(coder aDecoder: NSCoder) {
    //    super.init(coder: aDecoder)
    //    fatalError("init(coder:) has not been implemented")
    //}
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        tableView?.separatorStyle = .singleLine
        tableView?.isScrollEnabled = true
    }
    
}
