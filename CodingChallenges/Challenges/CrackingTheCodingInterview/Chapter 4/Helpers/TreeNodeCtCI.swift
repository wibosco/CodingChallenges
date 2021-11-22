//
//  TreeNodeCtCI.swift
//  CodingChallenges
//
//  Created by William Boles on 02/07/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import Foundation

class TreeNodeCtCI {
    let value: Int
    
    var parent: TreeNodeCtCI?
    var left: TreeNodeCtCI?
    var right: TreeNodeCtCI?
    var height = 0
    
    // MARK: - Init
    
    init(value: Int) {
        self.value = value
    }
    
    // MARK:  - Nodes
    
    func addNodeAsChild(node: TreeNodeCtCI) {
        if left == nil {
            left = node
        } else {
            right = node
        }
        
        node.parent = self
    }
}

extension TreeNodeCtCI: Equatable {
    static func == (lhs: TreeNodeCtCI, rhs: TreeNodeCtCI) -> Bool {
        ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }
}

extension TreeNodeCtCI {
    static func createBinaryTree(fromRelationships relationships: [[Int]]) -> TreeNodeCtCI {
       var nodes = [Int: TreeNodeCtCI]()
       
       for relationship in relationships {
           let parentNodeValue = relationship[0]
           let childNodeValue = relationship[1]
           
           var parentNode = nodes[parentNodeValue]
           var childNode = nodes[childNodeValue]
           
           if parentNode == nil {
               parentNode = TreeNodeCtCI(value: parentNodeValue)
               nodes[parentNodeValue] = parentNode
           }
           
           if childNode == nil {
               childNode = TreeNodeCtCI(value: childNodeValue)
               nodes[childNodeValue] = childNode
           }
           
           parentNode!.addNodeAsChild(node: childNode!)
       }
       
       return rootNode(nodes: nodes)
   }
   
    static func rootNode(nodes: [Int: TreeNodeCtCI]) -> TreeNodeCtCI {
       var rootNode: TreeNodeCtCI?
       
       for node in nodes.values {
           if node.parent == nil {
               rootNode = node
               break
           }
       }
       
       return rootNode!
   }
}
