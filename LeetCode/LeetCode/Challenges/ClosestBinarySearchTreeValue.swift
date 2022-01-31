//
//  ClosestBinarySearchTreeValue.swift
//  CodingChallenges
//
//  Created by William Boles on 19/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/closest-binary-search-tree-value/
//binary search tree
struct ClosestBinarySearchTreeValue {
    
    //Time: O(log n)
    //Space: O(1)
    //binary search
    //divide and conquer
    //
    //Solution Description:
    //We traverse the tree at each node we calculate the delta between the target and that node. If the delta is
    //less than (in absolute terms) the current delta then we replace it with that node. We then check if that node
    //has any children nodes and select which one to search down depending on if that nodes val is less than or
    //greater than the target
    static func closestValue(_ root: BinaryTreeNode?, _ target: Double) -> Int {
        guard let root = root else {
            return -1
        }
        
        var closetNode = root
        var currentNode: BinaryTreeNode? = root
        while currentNode != nil {
            let currentDelta = abs(Double(currentNode!.val) - target)
            let closetDelta = abs(Double(closetNode.val) - target)
            
            if currentDelta < closetDelta {
                closetNode = currentNode!
            }
            
            if Double(currentNode!.val) >= target { //decide which path to go down
                currentNode = currentNode!.left
            } else {
                currentNode = currentNode!.right
            }
        }
        
        return closetNode.val
    }
}
