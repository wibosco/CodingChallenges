//
//  ClosestBinarySearchTreeValue.swift
//  CodingChallenges
//
//  Created by William Boles on 19/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/closest-binary-search-tree-value/
//binary search
//BST
struct ClosestBinarySearchTreeValue {
    
    //Time: O(log n)
    static func closestValue(_ root: TreeNode?, _ target: Double) -> Int {
        guard let root = root else {
            return -1
        }
        
        var closetNode = root
        var currentNode: TreeNode? = root
        while currentNode != nil {
            let currentDelta = abs(Double(currentNode!.val) - target)
            let closetDelta = abs(Double(closetNode.val) - target)
            
            if currentDelta < closetDelta {
                closetNode = currentNode!
            }
            
            if Double(currentNode!.val) >= target {
                currentNode = currentNode!.left
            } else {
                currentNode = currentNode!.right
            }
        }
        
        return closetNode.val
    }
}
