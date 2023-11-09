//
//  SumRootToLeafNumbers.swift
//  LeetCode
//
//  Created by William Boles on 09/11/2023.
//

import Foundation

//https://leetcode.com/problems/sum-root-to-leaf-numbers/
struct SumRootToLeafNumbers {
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(h) where h is the height of the tree
    //binary tree
    //DFS
    //recursive
    //
    //Solution Description:
    //Using DFS, we traverse our tree to each leaf node, at which point we know the full `value` and can return that value. We then
    //unwind our call stack and sum up the left and right branches of each node that we unwind to until eventually getting to the root
    //node where we can return the total sum.
    static func sumNumbers(_ root: BinaryTreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        
        return dfs(root, 0)
    }
    
    private static func dfs(_ node: BinaryTreeNode?, _ value: Int) -> Int {
        guard let node = node else {
            return 0
        }
        
        let newValue = (value * 10) + node.val
        
        if node.left == nil && node.right == nil { //is a leaf node?
            return newValue
        }
        
        let leftValue = dfs(node.left, newValue)
        let rightValue = dfs(node.right, newValue)
        
        return leftValue + rightValue
    }
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(h) where h is the height of the tree
    //binary tree
    //DFS
    //recursive
    //inout
    //
    //Solution Description:
    //Using DFS, we traverse our tree to each leaf node, at which point we know the full `value` for that branch and can add to our
    //ongoing `sum` value. Once all nodes have been searched we return `sum` as the final value.
    //
    //N.B. we have to be careful not to accidentally count each leaf nodes value twice by letting our DFS method take an optional node
    //and return `newValue` inside a guard checking for `nil` (as I did the first time I wrote the DFS method).
    static func sumNumbersInOut(_ root: BinaryTreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        
        var sum = 0
        
        dfsInOut(root, 0, &sum)
        
        return sum
    }
    
    private static func dfsInOut(_ node: BinaryTreeNode, _ value: Int, _ sum: inout Int) {
        let newValue = (value * 10) + node.val
        
        if node.left == nil && node.right == nil { //is a leaf node?
            sum += newValue
            return
        }
        
        if let left = node.left {
            dfsInOut(left, newValue, &sum)
        }
        
        if let right = node.right {
            dfsInOut(right, newValue, &sum)
        }
    }
}
