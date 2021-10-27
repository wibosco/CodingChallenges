//
//  SuccessorBST.swift
//  CodingChallenges
//
//  Created by William Boles on 05/07/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import UIKit

//CtCI 4.6
class SuccessorBST {
    
    // MARK: InOrderPreSorted
    
     static func successorNode(predecessorNode: SuccessorBSTNode) -> SuccessorBSTNode? {
        guard let parent = predecessorNode.parent else {
            //predecessorNode is the root node
            return predecessorNode.right
        }
        
        let root = findRootFromNode(node: parent)
        var sorted = [SuccessorBSTNode]()
        inOrder(node: root, sorted: &sorted)
        
        let indexOfPredecessorNode = sorted.firstIndex(of: predecessorNode)
        let indexOfNextNode = indexOfPredecessorNode! + 1
        
        if indexOfNextNode >= sorted.count {
            return nil
        } else {
            return sorted[indexOfNextNode]
        }
    }
    
     static func findRootFromNode(node: SuccessorBSTNode) -> SuccessorBSTNode {
        guard let parent = node.parent else {
            //node is the root node
            return node
        }
        
        return findRootFromNode(node: parent)
    }
    
     static func inOrder(node: SuccessorBSTNode?, sorted: inout [SuccessorBSTNode]) {
        if (node != nil) {
            inOrder(node: node!.left, sorted: &sorted)
            sorted.append(node!)
            inOrder(node: node!.right, sorted: &sorted)
        }
    }    
}
