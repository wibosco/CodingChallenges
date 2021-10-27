//
//  ValidateBSTFactory.swift
//  CodingChallenges
//
//  Created by William Boles on 02/07/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import UIKit

class ValidateBSTFactory {

    // MARK: Build
    
     static func buildBinaryTree(relationships: [[Int]]) -> ValidateBSTNode {
        
        var nodes = [Int: ValidateBSTNode]()
        
        for relationship in relationships {
            let parentNodeValue = relationship[0]
            let childNodeValue = relationship[1]
            
            var parentNode = nodes[parentNodeValue]
            var childNode = nodes[childNodeValue]
            
            if parentNode == nil {
                parentNode = ValidateBSTNode(value: parentNodeValue)
                nodes[parentNodeValue] = parentNode
            }
            
            if childNode == nil {
                childNode = ValidateBSTNode(value: childNodeValue)
                nodes[childNodeValue] = childNode
            }
            
            parentNode!.addNodeAsChild(node: childNode!)
        }
        
        return rootNode(nodes: nodes)
    }
    
     static func rootNode(nodes: [Int: ValidateBSTNode]) -> ValidateBSTNode {
        var rootNode: ValidateBSTNode?
        
        for node in nodes.values {
            if node.parent == nil {
                rootNode = node
                break
            }
        }
        
        return rootNode!
    }
}
