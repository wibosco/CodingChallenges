//
//  BFSSearchReachNode.swift
//  CodingChallenges
//
//  Created by William Boles on 24/06/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import Foundation

class BFSSearchReachNode {
    var distanceFromSource = -1
    var visted = false
    
    var nodes = [BFSSearchReachNode]()
    
    // MARK: Add
    
    func addRelationshipWithNode(node: BFSSearchReachNode) {
        if !nodes.contains(node) {
            nodes.append(node)
        }
    }
}

extension BFSSearchReachNode: Equatable {
    static func == (lhs: BFSSearchReachNode, rhs: BFSSearchReachNode) -> Bool {
        ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }
}
