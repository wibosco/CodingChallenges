//
//  RoutePlannerQueue.swift
//  CodingChallenges
//
//  Created by William Boles on 01/06/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import UIKit

class RoutePlannerQueue {
    
    // MARK: Properties
    
    lazy var nodes: [RoutePlannerNode] = {
        
        return [RoutePlannerNode]()
    }()
    
    // MARK: Meta
    
    func isEmpty() -> Bool {
        
        return nodes.count == 0
    }
    
    // MARK: Actions
    
    func enqueue(node: RoutePlannerNode) {
        
        nodes.append(node)
    }
    
    func dequeue() -> RoutePlannerNode {
        
        return nodes.removeFirst()
    }
}
