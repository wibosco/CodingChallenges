//
//  SumOfLeftLeaves.swift
//  LeetCode
//
//  Created by William Boles on 09/11/2023.
//

import Foundation

//https://leetcode.com/problems/sum-of-left-leaves/
struct SumOfLeftLeaves {
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(h) where h is the height of the tree
    //binary tree
    //DFS
    //recursive
    //
    //Solution Description:
    //Performing a DFS traversal of the tree, we attempt ot find all left leaf nodes. As `TreeNode` does not contain
    //a parent property, during the DFS we pass if that node is a left chld of it's parent or not. Once we find a left child
    //leaf node we return its value and add that value to other left child leaf nodes as the the callstack unwinds. Once all
    //nodes have been checked we return the sum.
    static func sumOfLeftLeaves(_ root: TreeNode?) -> Int {
        return dfs(root, false)
    }
    
    private static func  dfs(_ node: TreeNode?, _ leftChild: Bool) -> Int {
        guard let node = node else {
            return 0
        }
        
        if node.left == nil && node.right == nil {
            let val = leftChild ? node.val : 0
            return val
        }
        
        return dfs(node.left, true) + dfs(node.right, false)
    }
}
