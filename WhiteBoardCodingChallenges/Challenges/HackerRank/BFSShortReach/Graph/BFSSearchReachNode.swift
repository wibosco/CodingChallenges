//
//  BFSSearchReachNode.swift
//  WhiteBoardCodingChallenges
//
//  Created by William Boles on 24/06/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import Foundation

class BFSSearchReachNode: NSObject {

    // MARK: Properties
    
    var distanceFromSource = -1
    var visted = false
    
    var nodes: [BFSSearchReachNode] = {
        
        let nodes = [BFSSearchReachNode]()
        
        return nodes
    }()
    
    // MARK: Add
    
    func addRelationshipWithNode(node: BFSSearchReachNode) {
        
        if !nodes.contains(node) {
            nodes.append(node)
        }
    }
}
