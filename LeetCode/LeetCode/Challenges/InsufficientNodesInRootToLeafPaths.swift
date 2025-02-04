//
//  InsufficientNodesInRootToLeafPaths.swift
//  LeetCode
//
//  Created by William Boles on 05/12/2023.
//

import Foundation

//https://leetcode.com/problems/insufficient-nodes-in-root-to-leaf-paths/
struct InsufficientNodesInRootToLeafPaths {
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(h) where h is the height of the tree
    //binary tree
    //DFS
    //recursive
    //top-down
    //bottom-up
    //
    //Solution Description:
    //A non-leaf node is insufficent if it's subtrees are also insufficent (regardless of that nodes value), a leaf node is 
    //insufficent is it's value is less than limit. Using DFS when traversing down the tree we build up the sum of each node
    //in that path until we encounter a leaf node where we compare `sum` against `limit` and return whether that node is
    //insufficent. As the recursive stack unwinds we "nil" any child nodes that are deemed insufficent and then combine the
    //state of those child nodes into the state of the current node. Finally we reach the root we decide if we should return
    //it or nil.
    func sufficientSubset(_ root: TreeNode?, _ limit: Int) -> TreeNode? {
        let lessThan = dfs(root, limit, 0)
        
        return lessThan ? nil : root
    }
    
    private func dfs(_ node: TreeNode?, _ limit: Int, _ sum: Int) -> Bool {
        guard let node = node else {
            return true
        }
        
        var sum = sum
        sum += node.val
        
        if node.left == nil && node.right == nil {
            return sum < limit
        }
        
        let left = dfs(node.left, limit, sum)
        let right = dfs(node.right, limit, sum)
        
        if left {
            node.left = nil
        }
        
        if right {
            node.right = nil
        }
        
        return left && right
    }
}
