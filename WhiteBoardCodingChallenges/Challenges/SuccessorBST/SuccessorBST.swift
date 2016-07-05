//
//  SuccessorBST.swift
//  WhiteBoardCodingChallenges
//
//  Created by William Boles on 05/07/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import UIKit

//CtCI 4.6
class SuccessorBST: NSObject {
    
    // MARK: InOrderPreSorted
    
    class func successorNode(predecessorNode: SuccessorBSTNode) -> SuccessorBSTNode? {
        guard let parent = predecessorNode.parent else {
            //predecessorNode is the root node
            return predecessorNode.right
        }
        
        let root = findRootFromNode(parent)
        var sorted = [SuccessorBSTNode]()
        inOrder(root, sorted: &sorted)
        
        let indexOfPredecessorNode = sorted.indexOf(predecessorNode)
        let indexOfNextNode = indexOfPredecessorNode! + 1
        
        if indexOfNextNode >= sorted.count {
            return nil
        } else {
            return sorted[indexOfNextNode]
        }
    }
    
    class func findRootFromNode(node: SuccessorBSTNode) -> SuccessorBSTNode {
        guard let parent = node.parent else {
            //node is the root node
            return node
        }
        
        return findRootFromNode(parent)
    }
    
    class func inOrder(node: SuccessorBSTNode?, inout sorted: [SuccessorBSTNode]) {
        if (node != nil) {
            inOrder(node!.left, sorted: &sorted)
            sorted.append(node!)
            inOrder(node!.right, sorted: &sorted)
        }
    }    
}
