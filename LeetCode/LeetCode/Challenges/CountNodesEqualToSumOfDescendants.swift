//
//  CountNodesEqualToSumOfDescendants.swift
//  LeetCode
//
//  Created by William Boles on 07/12/2023.
//

import Foundation

//https://leetcode.com/problems/count-nodes-equal-to-sum-of-descendants/
struct CountNodesEqualToSumOfDescendants {
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(h) where h is the height of the tree
    //binary tree
    //DFS
    //recursive
    //bottom-up
    //
    //Solution Description:
    //Using DFS we traverse down to the leaf nodes of the tree, then as we unwind the recursive stack we sum the values of a nodes
    //left and right child and compare it against that nodes value - if they match we increment `count`. Then we return the sum
    //of that nodes value and the left and right child summed value to be used in the next comparison. We repeat this process until
    //we fully unwind the stack.
    static func equalToDescendants(_ root: TreeNode?) -> Int {
        var count = 0
        
        _ = dfs(root, &count)
        
        return count
    }
    
    private static func dfs(_ node: TreeNode?, _ count: inout Int) -> Int {
        guard let node = node else {
            return 0
        }
        
        let left = dfs(node.left, &count)
        let right = dfs(node.right, &count)
        
        let sum = left + right
        if node.val == sum {
            count += 1
        }

        return node.val + sum
    }
}
