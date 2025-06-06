//
//  ClosestBinarySearchTreeValue.swift
//  LeetCode
//
//  Created by William Boles on 19/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/closest-binary-search-tree-value/
struct ClosestBinarySearchTreeValue {
    
    //Time: O(log n) where n is the number of nodes in the tree
    //Space: O(h) where h is the height of the tree
    //binary tree
    //binary search tree
    //DFS
    //recursive
    //
    //Solution Description:
    //We traverse the tree in a DFS manner, at each level we compare the delta of that levels node value with the `target`.
    //If that delta is less than `closet` then that nodes delta becomes the closet. As this is BST we then choose which
    //node to traverse next (left or right)
    func closestValue(_ root: TreeNode?, _ target: Double) -> Int {
        var closet = (-1, Double(Int.max))
        
        dfs(root, target, &closet)
        
        return closet.0
    }
    
    private func dfs(_ node: TreeNode?, _ target: Double, _ closet: inout (Int, Double)) {
        guard let node = node else {
            return
        }
        
        let delta = abs(Double(node.val) - target)
        
        if delta < closet.1 {
            closet = (node.val, delta)
        }
        
        if target < Double(node.val) {
            dfs(node.left, target, &closet)
        } else if target > Double(node.val) {
            dfs(node.right, target, &closet)
        }
    }
    
    //Time: O(log n) where n is the number of nodes in the tree
    //Space: O(1)
    //binary tree
    //binary search tree
    //DFS
    //iterative
    //
    //Solution Description:
    //We traverse the tree at each node we calculate the delta between the target and the current node. If the delta is
    //less than (in absolute terms) the current delta then we replace it with that node. We then check if that node has
    //any children nodes and select which one to search down depending on if that nodes val is less than or
    //greater than the target
    func closestValueIterative(_ root: TreeNode?, _ target: Double) -> Int {
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
            
            if Double(currentNode!.val) >= target { //decide which path to go down
                currentNode = currentNode!.left
            } else {
                currentNode = currentNode!.right
            }
        }
        
        return closetNode.val
    }
}
