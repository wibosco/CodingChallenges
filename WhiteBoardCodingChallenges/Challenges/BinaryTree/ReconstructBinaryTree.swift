//
//  BinaryTreeAlt.swift
//  WhiteBoardCodingChallenges
//
//  Created by William Boles on 29/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import UIKit

class ReconstructBinaryTree: NSObject {

    // MARK: Properties
    
    lazy var nodes: [Int: Node] = {
       
        return [Int: Node]()
    }()
    
    // MARK: Reconstruct
    
    func reconstructTree(deconstructedTree: [[Int]]) -> Node {
        
        for nodePair in deconstructedTree {
            
            let parentKey = nodePair[0]
            let childKey = nodePair[1]
            
            var parentNode = nodes[parentKey]
            
            if parentNode == nil {
                
                parentNode = Node.init(value: parentKey)
                nodes[parentKey] = parentNode!
            }
            
            var childNode = nodes[childKey]
            
            if childNode == nil {
                
                childNode = Node.init(value: childKey)
                nodes[childKey] = childNode!
            }
            
            parentNode!.addNodeAsChild(childNode!)
        }
        
        return rootNode()
    }
    
    private func rootNode() -> Node {
        
        var rootNode = nodes.values.first!
        
        while rootNode.parent != nil {
            
            rootNode = rootNode.parent!
        }
        
        return rootNode
    }
}
