//
//  EvaluateBooleanBinaryTree.swift
//  LeetCode
//
//  Created by William Boles on 10/11/2023.
//

import Foundation

//https://leetcode.com/problems/evaluate-boolean-binary-tree/
struct EvaluateBooleanBinaryTree {
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(h) where h is the height of the tree
    //binary tree
    //full binary tree
    //DFS
    //recursive
    //
    //Solution Description:
    //Using DFS we traverse the tree until we get to the leaf nodes then we begin to unwind the call stack passing a boolean
    //value of the evaluation which is then used in next higher evaluation.
    static func evaluateTree(_ root: BinaryTreeNode?) -> Bool {
        guard let root = root else {
            return false
        }
        
        return dfs(root)
    }
    
    private static func dfs(_ node: BinaryTreeNode) -> Bool {
        //Values:
        //0 - false
        //1 - true
        //2 - OR
        //3 - AND
        
        //this is a full binary tree so a node either has 2 children or 0
        guard let left = node.left, let right = node.right else {
            return node.val == 1 ? true : false
        }
        
        let leftOutcome = dfs(left)
        let rightOutcome = dfs(right)
        
        if node.val == 2 {
            return leftOutcome || rightOutcome
        } else {
            return leftOutcome && rightOutcome
        }
    }
}
