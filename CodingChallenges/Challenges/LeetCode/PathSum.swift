//
//  PathSum.swift
//  CodingChallenges
//
//  Created by William Boles on 24/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/path-sum/
//binary tree
struct PathSum {
    
    //Time: O(n)
    //Space: O(h) where h is the height of the tree
    //DFS
    //substitution
    static func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        guard let root = root else {
            return false
        }
        
        let sum = targetSum - root.val
        if (root.left == nil) && (root.right == nil) { //only leaf nodes should be checked
            return sum == 0
        }
        
        return hasPathSum(root.left, sum) || hasPathSum(root.right, sum)
    }
    
    
    //Time: O(n)
    //Space: O(h) where h is the height of the tree
    //DFS
    //addition
    static func hasPathSumAddition(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        return hasPathSum(root, 0, targetSum)
    }
    
    private static func hasPathSum(_ root: TreeNode?, _ runningTotal: Int, _ targetSum: Int) -> Bool {
        guard let root = root else {
            return false
        }
        
        let updatedRunningTotal = runningTotal + root.val
    
        if (root.left == nil && root.right == nil) { //only leaf nodes should be checked
            return updatedRunningTotal == targetSum
        }
        
        return hasPathSum(root.left, updatedRunningTotal, targetSum) || hasPathSum(root.right, updatedRunningTotal, targetSum)
    }
}
