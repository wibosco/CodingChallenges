//
//  RoutePlannerQueue.swift
//  CrackingTheCodingInterview
//
//  Created by William Boles on 01/06/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import Foundation

final class RoutePlannerQueue {
    lazy var nodes = [RoutePlannerNode]()
    
    // MARK: - Meta
    
    func isEmpty() -> Bool {
        return nodes.isEmpty
    }
    
    // MARK: - Actions
    
    func enqueue(node: RoutePlannerNode) {
        nodes.append(node)
    }
    
    func dequeue() -> RoutePlannerNode {
        return nodes.removeFirst()
    }
}
