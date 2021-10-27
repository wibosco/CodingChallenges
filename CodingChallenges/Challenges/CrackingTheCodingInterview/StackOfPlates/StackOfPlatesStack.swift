//
//  StackOfPlatesStack.swift
//  CodingChallenges
//
//  Created by William Boles on 01/06/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import UIKit

class StackOfPlatesStack: NSObject {

    // MARK: Properties
    
    lazy var nodes: [StackOfPlatesNode] = {
       
        return [StackOfPlatesNode]()
    }()
    
    var capacity: Int
    
    // MARK: Init
    
    init(capacity: Int) {
        
        self.capacity = capacity
        
        super.init()
    }
    
    // MARK: Meta
    
    func isEmpty() -> Bool {
        
        return nodes.count == 0
    }
    
    func isFull() -> Bool {
        
        if self.capacity == nodes.count {
            
            return true
        }
        
        return false
    }
    
    // MARK: Actions
    
    func push(value: Int) {
        
        let node = StackOfPlatesNode.init(value: value)
        
        nodes.insert(node, at: 0)
    }
    
    func pop() -> StackOfPlatesNode? {
        
        if !isEmpty() {
            
            return nodes.removeFirst()
        }
        
        return nil
    }
}
