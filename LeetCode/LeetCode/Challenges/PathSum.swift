//
//  PathSum.swift
//  LeetCode
//
//  Created by William Boles on 24/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/path-sum/
struct PathSum {
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(h) where h is the height of the tree
    //binary tree
    //DFS
    //recursive
    //substitution
    //
    //Solution Description:
    //Using DFS move through the tree, substituting the nodes value from the target at each stage. Once we get to a leaf
    //node, a check is performed to determine if sum is equal to 0 i.e. the path does indeed equal the target.
    //
    //NB. no need for a helper method as zero acts as the target.
    func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        guard let root = root else {
            return false
        }
        
        let sum = targetSum - root.val
        if (root.left == nil) && (root.right == nil) { //only leaf nodes should be checked
            return sum == 0
        }
        
        return hasPathSum(root.left, sum) || hasPathSum(root.right, sum)
    }
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(h) where h is the height of the tree
    //binary tree
    //DFS
    //recursive
    //addition
    //
    //Solution Description:
    //Using DFS move through the tree, adding the nodes value together at each stage. Once we get to a leaf node, a check
    //if performed to determine if sum is equal to the target.
    func hasPathSumAddition(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        return hasPathSum(root, 0, targetSum)
    }
    
    private func hasPathSum(_ root: TreeNode?, _ runningTotal: Int, _ targetSum: Int) -> Bool {
        guard let root = root else {
            return false
        }
        
        let updatedRunningTotal = runningTotal + root.val
    
        if root.left == nil && root.right == nil { //only leaf nodes should be checked
            return updatedRunningTotal == targetSum
        }
        
        return hasPathSum(root.left, updatedRunningTotal, targetSum) || hasPathSum(root.right, updatedRunningTotal, targetSum)
    }
}
