//
//  EvenTree.swift
//  WhiteBoardCodingChallenges
//
//  Created by William Boles on 29/06/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import Foundation

//https://www.hackerrank.com/challenges/even-tree
class EvenTree: NSObject {
    
    // MARK: Edges
    
    class func totalEdgesRemovedToFormForestOfEvenTrees(totalNodes: Int, edges: [[Int]]) -> Int {
        let nodes = buildNodes(totalNodes)
        connectEdges(nodes, edges: edges)
        
        var totalEdgesRemoved = 0
        
        for node in nodes {
            if node.immediateChildren.count > 0 {
                for childNode in node.immediateChildren {
                    if (childNode.totalChildren + 1) % 2 == 0 {
                        childNode.breakConnectionWithParent()
                        totalEdgesRemoved += 1
                    }
                }
            }
        }
        
        return totalEdgesRemoved
    }
    
    // MARK: Build
    
    class func buildNodes(totalNodes: Int) -> [EvenTreeNode] {
        var nodes = [EvenTreeNode]()
        
        for i in 0..<totalNodes {
            
            let node = EvenTreeNode(value: i)
            nodes.append(node)
        }
        
        return nodes
    }
    
    class func connectEdges(nodes: [EvenTreeNode], edges: [[Int]]) {
        for edge in edges {
            let child = nodes[edge[0]]
            let parent = nodes[edge[1]]
            
            parent.addChild(child)
        }
    }
}
