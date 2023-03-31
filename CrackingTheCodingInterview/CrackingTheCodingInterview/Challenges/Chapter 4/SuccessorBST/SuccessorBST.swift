//
//  SuccessorBST.swift
//  CrackingTheCodingInterview
//
//  Created by William Boles on 05/07/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import Foundation

//CtCI 4.6
struct SuccessorBST {
    
    // MARK: - InOrderPreSorted
    
    static func successorNode(predecessorNode: TreeNodeCtCI) -> TreeNodeCtCI? {
        guard let parent = predecessorNode.parent else {
            //predecessorNode is the root node
            return predecessorNode.right
        }
        
        let root = findRootFromNode(node: parent)
        var sorted = [TreeNodeCtCI]()
        inOrder(node: root, sorted: &sorted)
        
        let indexOfPredecessorNode = sorted.firstIndex(of: predecessorNode)
        let indexOfNextNode = indexOfPredecessorNode! + 1
        
        if indexOfNextNode >= sorted.count {
            return nil
        } else {
            return sorted[indexOfNextNode]
        }
    }
    
    private static func findRootFromNode(node: TreeNodeCtCI) -> TreeNodeCtCI {
        guard let parent = node.parent else {
            //node is the root node
            return node
        }
        
        return findRootFromNode(node: parent)
    }
    
    private static func inOrder(node: TreeNodeCtCI?, sorted: inout [TreeNodeCtCI]) {
        guard let node = node else {
            return
        }
        
        inOrder(node: node.left, sorted: &sorted)
        sorted.append(node)
        inOrder(node: node.right, sorted: &sorted)
    }
}
