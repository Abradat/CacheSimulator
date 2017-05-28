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

enum Algorithm : String {
    case LRU = "lru"
    case FIFO = "fifo"
    case Random = "rand"
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

class DirectMapping : NSObject{
    
    var cache : [Int: Int]
    var cacheBlocks : Int
    var memoryBlocks : Int
    var blockSize : Int
    var memorySize : Int
    var hit : Float
    var miss : Float
    //var addresses : Addresses
    
    
    init(cacheSize : Int, memorySize : Int, blockSize : Int) {
        self.cache = Dictionary()
        self.cacheBlocks = cacheSize / blockSize
        self.memoryBlocks = memorySize / blockSize
        self.blockSize = blockSize
        self.hit = 0.0
        self.miss = 0.0
        self.memorySize = memorySize
        //self.addresses = Addresses()
        super.init()
        self.initCache()
        
    }
    
    func initCache()
    {
        for i in 0...self.cacheBlocks - 1{
            self.cache[i] = -1
        }
    }
    
    func getAddressBlock(address : Int) -> Int{
        return Int(address / self.blockSize)
    }
    
    func checkHit(address : Int) -> Bool{
        let addressBlock = self.getAddressBlock(address: address)
        return (addressBlock == self.cache[addressBlock % self.cacheBlocks])
    }
    
    func addBlock(address : Int){
        let addressBlock = self.getAddressBlock(address: address)
        self.cache[addressBlock % self.cacheBlocks] = addressBlock
    }
    
    func simulate(address : Int){
        print("Word \(address) with Block \(self.getAddressBlock(address: address)) is ")
        if self.checkHit(address: address){
            self.hit += 1.0
            print("hit")
        }
        else{
            self.miss += 1.0
            self.addBlock(address: address)
            print("miss")
        }
    }
    
    func hitRatio() -> Float{
        return Float(self.hit) / (Float(self.hit) + Float(self.miss))
    }
    
    func cacheState(){
        print("------------")
        for key in self.cache{
            print("Block \(key.value) : \(self.cache[key.value])")
        }
        print("------------")
    }
}

class FullyAssociative : DirectMapping{
    let LRU = "lru"
    let FIFO = "fifo"
    var policy : String
    var countOfUse : [Int:Int]
    var fifo : [Int]

    init(cacheSize : Int, memorySize : Int, blockSize : Int, policy : String) {
        self.policy = policy
        self.countOfUse = Dictionary()
        self.fifo = [Int]()
        super.init(cacheSize: cacheSize, memorySize: memorySize, blockSize: blockSize)
    }
    
    override func checkHit(address : Int) -> Bool{
        var addressBlock = self.getAddressBlock(address: address)
        for block in self.cache{
            if(self.cache[block.value] == addressBlock){
                if var a = self.countOfUse[block.value] {
                    a += 1
                    self.countOfUse[block.value] = a
                }
                return true
            }
        }
        return false
        
    }
    
    override func addBlock(address: Int) {
        let addressBlock = self.getAddressBlock(address: address)
        for i in 0...self.cacheBlocks - 1{
            if(self.cache[i] == -1){
                self.cache[i] = addressBlock
                self.countOfUse[i] = 0
                self.fifo.append(1)
                return
            }
        }
        if(self.policy == Algorithm.LRU.rawValue){
            let m = Array(self.countOfUse.values).min()
            for i in self.countOfUse{
                if self.countOfUse[i.value] == m {
                    self.cache[i.value] = addressBlock
                    self.countOfUse[i.value] = 0
                }
            }
        }
        else if self.policy == Algorithm.FIFO.rawValue {
            print(self.fifo)
            print(address)
            print(addressBlock)
            let firstItem = self.fifo[0]
            self.fifo.remove(at: 0)
            
            self.cache[firstItem] = addressBlock
            self.fifo.append(firstItem)
            self.countOfUse[firstItem] = 0
        }
    }
    
}

class SetAssociative : DirectMapping {
    var k : Int
    var sCache : [Int : [Int]]
    init(cacheSize: Int, memorySize: Int, blockSize: Int, k : Int) {
        self.k = k
        self.sCache = Dictionary()
        super.init(cacheSize: cacheSize, memorySize: memorySize, blockSize: blockSize)
    }
    
    override func initCache() {
        var aux = [Int]()
        for _ in 1...self.k{
            aux.append(-1)
        }
        for i in 0...self.cacheBlocks{
            self.sCache[i] = aux
        }
    }
    
    override func checkHit(address: Int) -> Bool {
        
        let addressBlock = self.getAddressBlock(address: address)
        for i in 0...self.cacheBlocks - 1 {
            if (self.sCache[i]?.contains(addressBlock))! {
                return true
            }
        }
        return false
    }
    
    override func addBlock(address: Int) {
        
        let addressBlock = self.getAddressBlock(address: address)
        
        if (self.sCache[addressBlock % self.cacheBlocks]?.contains(-1))! {
            self.sCache[addressBlock % self.cacheBlocks]?[(self.sCache[addressBlock % self.cacheBlocks]?.index(of: -1))!] = addressBlock
            return
        }
        let random = arc4random_uniform(UInt32(self.k))
        self.sCache[addressBlock % self.cacheBlocks]?[Int(random)] = addressBlock
        
    }
}
