//
//  CountNodesEqualToAverageOfSubtree.swift
//  LeetCode
//
//  Created by William Boles on 10/11/2023.
//

import Foundation

//https://leetcode.com/problems/count-nodes-equal-to-average-of-subtree/
struct CountNodesEqualToAverageOfSubtree {
    
    //Time: O(n) where n is the number of nodes in the tree.
    //Space: O(h) where h is the height of the tree
    //binary tree
    //DFS
    //recursive
    //inout
    //
    //Solution Description:
    //Using DFS we perform a traversal that is very similar to a post-order traversal but with the twist that as we unwind the call
    //stack we pass back up with sum of that subtree and the count of the nodes that make up that subtree. We then add the current
    //node to that sum and count and check if once the average is calculated that nodes value matches the average - if it does we
    //increment `matchCount`. We repeat this process until all nodes have been checked.
    static func averageOfSubtree(_ root: BinaryTreeNode?) -> Int {
        var matchCount = 0
        _ = dfs(root, &matchCount)
        
        return matchCount
    }
    
    private static func dfs(_ node: BinaryTreeNode?, _ matchCount: inout Int) -> (Int, Int) { //sum, count
        guard let node = node else {
            return (0, 0)
        }
        
        let leftValues = dfs(node.left, &matchCount)
        let rightValues = dfs(node.right, &matchCount)
        
        let sum = leftValues.0 + rightValues.0 + node.val
        let count = leftValues.1 + rightValues.1 + 1
        let average = sum / count
        
        if node.val == average {
            matchCount += 1
        }
        
        return (sum, count)
    }
}
