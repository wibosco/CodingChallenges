//
//  QueueViaStacksStack.swift
//  WhiteBoardCodingChallenges
//
//  Created by William Boles on 01/06/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import UIKit

class QueueViaStacksStack: NSObject {
    
    // MARK: Nodes
    
    lazy var nodes: [Int] = {
    
        return [Int]()
    }()
    
    // MARK: Meta
    
    func isEmpty() -> Bool {
        
        return nodes.count == 0
    }
    
    // MARK: Actions
    
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
