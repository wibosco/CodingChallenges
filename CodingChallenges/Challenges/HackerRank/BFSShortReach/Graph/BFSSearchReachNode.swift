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
    
    var nodes = Set<BFSSearchReachNode>()
    
    // MARK: Add
    
    func connect(with node: BFSSearchReachNode) {
        nodes.insert(node)
    }
}

extension BFSSearchReachNode: Equatable {
    static func == (lhs: BFSSearchReachNode, rhs: BFSSearchReachNode) -> Bool {
        return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }
}

extension BFSSearchReachNode: Hashable {
    func hash(into hasher: inout Hasher) {
        return hasher.combine(ObjectIdentifier(self))
    }
}
