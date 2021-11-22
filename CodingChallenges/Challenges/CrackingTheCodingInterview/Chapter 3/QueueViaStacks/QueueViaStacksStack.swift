//
//  QueueViaStacksStack.swift
//  CodingChallenges
//
//  Created by William Boles on 01/06/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import Foundation

class QueueViaStacksStack {
    
    // MARK: - Nodes
    
    var nodes = [Int]()
    
    // MARK: - Meta
    
    func isEmpty() -> Bool {
        return nodes.isEmpty
    }
    
    // MARK: - Actions
    
    func push(value: Int) {
        nodes.insert(value, at: 0)
    }
    
    func pop() -> Int {
        return nodes.removeFirst()
    }
    
    func peek() -> Int {
        return nodes[0]
    }
}
