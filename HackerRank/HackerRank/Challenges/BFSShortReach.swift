//
//  BFSShortReach.swift
//  HackerRank
//
//  Created by William Boles on 24/06/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import Foundation

//https://www.hackerrank.com/challenges/bfsshortreach
final class BFSShortReach {
    
    // MARK: Distance
    
    func distanceFromSourceToAllOtherNodes(startingIndex: Int, totalNodes: Int, edges: [[Int]]) -> [Int] {
        let nodes = (0..<totalNodes).map { _ in BFSSearchReachNode() }
        
        for edge in edges {
            let sourceNodeIndex = edge[0] - 1
            let destinationNodeIndex = edge[1] - 1
            
            let sourceNode = nodes[sourceNodeIndex]
            let destinationNode = nodes[destinationNodeIndex]
            
            sourceNode.connect(with: destinationNode)
            destinationNode.connect(with: sourceNode)
        }
        
        let startingNode = nodes[(startingIndex - 1)]
        startingNode.distanceFromSource = 0
        startingNode.visted = true
        
        var queue = [BFSSearchReachNode]()
        queue.append(startingNode)
        
        while queue.count > 0 {
            let node = queue.removeFirst()
            
            for connectedNode in node.nodes {
                if !connectedNode.visted {
                    connectedNode.visted = true
                    connectedNode.distanceFromSource = (node.distanceFromSource + 6)
                    
                    queue.append(connectedNode)
                }
            }
        }

        return nodes.filter { $0 != startingNode }.map { $0.distanceFromSource }
    }
}

final class BFSSearchReachNode {
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
