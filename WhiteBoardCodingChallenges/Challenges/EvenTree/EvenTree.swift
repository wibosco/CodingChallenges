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
    
    class func totalEdgesRemovedToFormForestOfEvenTrees(numberOfNodes: Int, edges: [[Int]]) -> Int {
        let nodes = buildNodes(numberOfNodes: numberOfNodes)
        connectEdges(nodes: nodes, edges: edges)
        
        var totalEdgesRemoved = 0
        
        for node in nodes {
            if node.parent != nil { // skip root
                let count = nodesInTree(root: node)
                if count % 2 == 0 {
                    totalEdgesRemoved += 1
                }
            }
        }
        
        return totalEdgesRemoved
    }
    
    // MARK: Build
    
    class func buildNodes(numberOfNodes: Int) -> [EvenTreeNode] {
        var nodes = [EvenTreeNode]()
        
        for i in 0..<numberOfNodes {
            let node = EvenTreeNode(value: i)
            nodes.append(node)
        }
        
        return nodes
    }
    
    class func connectEdges(nodes: [EvenTreeNode], edges: [[Int]]) {
        for edge in edges {
            let child = nodes[edge[0]]
            let parent = nodes[edge[1]]
            
            parent.addChild(child: child)
        }
    }
    
    // MARK: DFS
    
    class func nodesInTree(root: EvenTreeNode) -> Int {
        var count = 1 // start at 1 as you need to count the root node
        
        for child in root.children {
            count += nodesInTree(root: child)
        }
        
        return count
    }
}
