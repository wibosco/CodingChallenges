//
//  EvenTree.swift
//  CodingChallenges
//
//  Created by William Boles on 29/06/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import Foundation

//https://www.hackerrank.com/challenges/even-tree
class EvenTree {
    
    // MARK: Edges
    
     static func totalEdgesRemovedToFormForestOfEvenTrees(numberOfNodes: Int, edges: [[Int]]) -> Int {
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
    
     static func buildNodes(numberOfNodes: Int) -> [EvenTreeNode] {
        var nodes = [EvenTreeNode]()
        
        for i in 0..<numberOfNodes {
            let node = EvenTreeNode(value: i)
            nodes.append(node)
        }
        
        return nodes
    }
    
     static func connectEdges(nodes: [EvenTreeNode], edges: [[Int]]) {
        for edge in edges {
            let child = nodes[edge[0]]
            let parent = nodes[edge[1]]
            
            parent.addChild(child: child)
        }
    }
    
    // MARK: DFS
    
     static func nodesInTree(root: EvenTreeNode) -> Int {
        var count = 1 // start at 1 as you need to count the root node
        
        for child in root.children {
            count += nodesInTree(root: child)
        }
        
        return count
    }
}

class EvenTreeNode {
    var value: Int // to help with debugging
    var parent: EvenTreeNode?
    var children = [EvenTreeNode]()
    
    // MARK: - Lifecycle
    
    init(value: Int) {
        self.value = value
    }
    
    // MARK: Child
    
    func addChild(child: EvenTreeNode) {
        children.append(child)
        child.parent = self
    }
    
    // MARK: Parent
    
    func removeChild(child: EvenTreeNode) {
        let childIndex = children.firstIndex(of: child)!
        children.remove(at: childIndex)
        child.parent = nil
    }
}

extension EvenTreeNode: Equatable {
    static func == (lhs: EvenTreeNode, rhs: EvenTreeNode) -> Bool {
        ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }
}

