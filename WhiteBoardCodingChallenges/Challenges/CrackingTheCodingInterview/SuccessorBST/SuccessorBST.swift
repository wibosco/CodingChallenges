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
    
    class func findRootFromNode(node: SuccessorBSTNode) -> SuccessorBSTNode {
        guard let parent = node.parent else {
            //node is the root node
            return node
        }
        
        return findRootFromNode(node: parent)
    }
    
    class func inOrder(node: SuccessorBSTNode?, sorted: inout [SuccessorBSTNode]) {
        if (node != nil) {
            inOrder(node: node!.left, sorted: &sorted)
            sorted.append(node!)
            inOrder(node: node!.right, sorted: &sorted)
        }
    }    
}
