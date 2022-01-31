//
//  StackOfPlatesStack.swift
//  CodingChallenges
//
//  Created by William Boles on 01/06/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import Foundation

class StackOfPlatesStack {
    var nodes = [StackOfPlatesNode]()
    var capacity: Int
    
    // MARK: - Init
    
    init(capacity: Int) {
        self.capacity = capacity
    }
    
    // MARK: - Meta
    
    func isEmpty() -> Bool {
        return nodes.isEmpty
    }
    
    func isFull() -> Bool {
        if self.capacity == nodes.count {
            return true
        }
        
        return false
    }
    
    // MARK: - Actions
    
    func push(value: Int) {
        let node = StackOfPlatesNode(value: value)
        nodes.insert(node, at: 0)
    }
    
    func pop() -> StackOfPlatesNode? {
        guard !isEmpty() else {
            return nil
        }
        
        return nodes.removeFirst()
    }
}
