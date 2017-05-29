//
//  RoundButton.swift
//  CacheSimulator
//
//  Created by Shayan Khorsandi on 5/29/17.
//  Copyright © 2017 Shayan Khorsandi. All rights reserved.
//

import UIKit

class RoundButton: UIButton {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //ohInit()
        
        
        
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //ohInit()
        
    }
    
    //func ohInit() {
    //    backgroundColor = UIColor.black.withAlphaComponent(0.5)
    //    titleLabel?.textColor = UIColor.black
        //titleLabel?.font = UIFont(name: "IRANSansWeb-Medium", size: 14)
    //}
    
    override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        layer.cornerRadius = self.bounds.size.height/2
        setTitleColor(.black, for: .selected)
    }
    
}
