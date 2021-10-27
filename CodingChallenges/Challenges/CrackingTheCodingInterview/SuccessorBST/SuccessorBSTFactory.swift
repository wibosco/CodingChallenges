//
//  ValidateBSTFactory.swift
//  CodingChallenges
//
//  Created by William Boles on 02/07/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import UIKit

class SuccessorBSTFactory {

    // MARK: Build
    
     static func buildBinaryTree(relationships: [[Int]]) -> SuccessorBSTNode {
        
        var nodes = [Int: SuccessorBSTNode]()
        
        for relationship in relationships {
            let parentNodeValue = relationship[0]
            let childNodeValue = relationship[1]
            
            var parentNode = nodes[parentNodeValue]
            var childNode = nodes[childNodeValue]
            
            if parentNode == nil {
                parentNode = SuccessorBSTNode(value: parentNodeValue)
                nodes[parentNodeValue] = parentNode
            }
            
            if childNode == nil {
                childNode = SuccessorBSTNode(value: childNodeValue)
                nodes[childNodeValue] = childNode
            }
            
            parentNode!.addNodeAsChild(node: childNode!)
        }
        
        return rootNode(nodes: nodes)
    }
    
     static func rootNode(nodes: [Int: SuccessorBSTNode]) -> SuccessorBSTNode {
        var rootNode: SuccessorBSTNode?
        
        for node in nodes.values {
            if node.parent == nil {
                rootNode = node
                break
            }
        }
        
        return rootNode!
    }
}
