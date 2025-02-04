//
//  UnivaluedBinaryTree.swift
//  LeetCode
//
//  Created by William Boles on 10/11/2023.
//

import Foundation

//https://leetcode.com/problems/univalued-binary-tree/
struct UnivaluedBinaryTree {
    
    //Time: O(n) where n is the number of nodes in the tree.
    //Space: O(h) where h is the height of the tree
    //binary tree
    //DFS
    //recursive
    //
    //Solution Description:
    //Using DFS, we traverse through the tree comparing the nodes we encounter with the value of the root node. If the current
    //nodes value and the root nodes value don't match we return false else we continue on the check the next nodes down.
    func isUnivalTree(_ root: TreeNode?) -> Bool {
        guard let root = root else {
            return false
        }
        
        return dfs(root, root.val)
    }
    
    private func dfs(_ node: TreeNode?, _ matcher: Int) -> Bool {
        guard let node = node else {
            return true
        }
        
        guard node.val == matcher else {
            return false
        }
        
        return dfs(node.left, matcher) && dfs(node.right, matcher)
    }
}
