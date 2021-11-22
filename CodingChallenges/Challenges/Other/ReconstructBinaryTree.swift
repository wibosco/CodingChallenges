//
//  BinaryTreeAlt.swift
//  CodingChallenges
//
//  Created by William Boles on 29/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import Foundation

class ReconstructBinaryTreeNode {
    var parent: ReconstructBinaryTreeNode?
    
    var left: ReconstructBinaryTreeNode?
    var right: ReconstructBinaryTreeNode?
    
    let value: Int
    
    // MARK: - Init
    
    init(value: Int) {
        self.value = value
    }
    
    // MARK: - Nodes
    
    func addNodeAsChild(node: ReconstructBinaryTreeNode) {
        if left == nil {
            left = node
        } else {
            right = node
        }
        
        node.parent = self
    }
}


//Amazon - Javier
class ReconstructBinaryTree {
    var nodes: [Int: ReconstructBinaryTreeNode] = [Int: ReconstructBinaryTreeNode]()

    // MARK: - Reconstruct
    
    func reconstructTree(deconstructedTree: [[Int]]) -> ReconstructBinaryTreeNode {
        for nodePair in deconstructedTree {
            let parentKey = nodePair[0]
            let childKey = nodePair[1]
            
            var parentNode = nodes[parentKey]
            
            if parentNode == nil {
                parentNode = ReconstructBinaryTreeNode(value: parentKey)
                nodes[parentKey] = parentNode!
            }
            
            var childNode = nodes[childKey]
            
            if childNode == nil {
                childNode = ReconstructBinaryTreeNode(value: childKey)
                nodes[childKey] = childNode!
            }
            
            parentNode!.addNodeAsChild(node: childNode!)
        }
        
        return rootNode()
    }
    
    private func rootNode() -> ReconstructBinaryTreeNode {
        var rootNode = nodes.values.first!
        while rootNode.parent != nil {
            rootNode = rootNode.parent!
        }
        
        return rootNode
    }
}
