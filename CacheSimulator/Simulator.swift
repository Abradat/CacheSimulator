//
//  Simulator.swift
//  CacheSimulator
//
//  Created by Sajjad Aboutalebi on 5/25/17.
//  Copyright © 2017 Shayan Khorsandi. All rights reserved.
//

import UIKit

enum Method {
    case directMapped
    case fullyAssociative
    case setAssociative
}

enum nWay: Int {
    case two = 2
    case four = 4
    case eight = 8
}

enum Algorithm {
    case LRU
    case FIFO
    case Random
}


class Simulator: NSObject {
    var method: Method
    //var nWay: nWay
    var algorithm: Algorithm
    
    init(cacheSize: Float, blockSize: Float, method: Method, algorithm: Algorithm) {
        NSLog("Simulator Initalized")
        self.method = method
        
        self.algorithm = algorithm
    }
    
    func simulate() {
        
    }

}
