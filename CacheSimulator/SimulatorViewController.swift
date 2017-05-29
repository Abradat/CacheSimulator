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
    //var navigationBarAppearace = UINavigationBar.appearance()
    
    
    var range : [String] = []
    var hitRate : [Int] = []
    var addresses : Addresses = Addresses()
    var addressType : String!
    var flag : [Int] = [0, 0, 0]
    var defaultBarColor : UIColor?
    var defaultColor : UIColor?
    
    var directMapping : DirectMapping! {
        didSet{
            navigationItem.title = "Direct Mapping"
            self.flag[0] = 1
            
        }
    }
    var fullAssociative : FullyAssociative! {
        didSet {
            navigationItem.title = "Fully Associative"
            self.flag[1] = 1
        }
    }
    
    var setAssociative : SetAssociative! {
        didSet {
            navigationItem.title = "Set Associative"
            self.flag[2] = 1
        }
    }
    override func loadView() {
        super.loadView()
        //navigationController?.navigationBar.backgroundColor = UIColor.black
        self.defaultBarColor = tabBarController?.tabBar.barTintColor
        self.defaultColor = tabBarController?.tabBar.tintColor

        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.navigationBar.isHidden = true
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)

        self.navigationController?.navigationBar.isHidden = false
        self.tabBarController?.tabBar.isHidden = false
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let graphview = createGraph(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height/2))
        view.addSubview(graphview)
        
        
        
    }
    
    
}
