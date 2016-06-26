//
//  BFSShortReach.swift
//  WhiteBoardCodingChallenges
//
//  Created by William Boles on 24/06/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import Foundation

//https://www.hackerrank.com/challenges/bfsshortreach
class BFSShortReach: NSObject {
    
    // MARK: Distance
    
    class func distanceFromSourceToAllOtherNodes(sourceIndex: Int, totalNodes: Int, edges: [[Int]]) -> [BFSSearchReachNode] {
        
        let nodes = buildNodes(totalNodes)
        connectNodes(nodes, edges: edges)

        let source = nodes[sourceIndex]
        
        findDistanceFromSourceToAllOtherNodes(source)
        
        return nodes
    }
    
    class func findDistanceFromSourceToAllOtherNodes(source: BFSSearchReachNode) {
    
        source.visted = true
        source.distanceFromSource = 0
        
        var queue = [BFSSearchReachNode]()
        queue.append(source)
        
        while queue.count > 0 {
            
            let node = queue.removeFirst()
            
            for connectedNode in node.nodes {
                
                if !connectedNode.visted {
                    
                    queue.append(connectedNode)
                    connectedNode.visted = true
                    connectedNode.distanceFromSource = (node.distanceFromSource + 6)
                }
            }
        }
    }
    
    // MARK: Build
    
    class func buildNodes(totalNodes: Int) -> [BFSSearchReachNode] {
        
        var nodes = [BFSSearchReachNode]()
        
        for _ in 0..<totalNodes {
            
            let node = BFSSearchReachNode()
            
            nodes.append(node)
        }
        
        return nodes
    }
    
    class func connectNodes(nodes: [BFSSearchReachNode], edges: [[Int]]) {
        
        for edge in edges {
            
            let sourceNodeIndex = edge[0]
            let destinationNodeIndex = edge[1]
            
            let sourceNode = nodes[sourceNodeIndex]
            let destinationNode = nodes[destinationNodeIndex]
            
            sourceNode.addRelationshipWithNode(destinationNode)
        }
    }
}
