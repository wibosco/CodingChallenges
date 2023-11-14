//
//  BinarySearchTreeToGreaterSumTree.swift
//  LeetCode
//
//  Created by William Boles on 13/11/2023.
//

import Foundation

//https://leetcode.com/problems/binary-search-tree-to-greater-sum-tree/
struct BinarySearchTreeToGreaterSumTree {
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(h) where h is the height of the tree
    //binary tree
    //binary search tree
    //DFS
    //recursive
    //inout
    //
    //Solution Description:
    //As we have a BST we know that all nodes to the right of the `root` are greater than it in value and all nodes to the
    //left are less than it in value. So using DFS, we can traverse the tree in such a manner so that we visit all `right`
    //nodes then `root` then `left` nodes. By doing so we can keep a sum of all the nodes we have encountered so far which
    //we can then use to get the `root` new GST value. As this is tree we can perform this in recursive manner as each
    //subtree is itself a full tree. We repeat this process until all nodes have been updated, at which point we can
    //return the `root` node.
    static func bstToGst(_ root: TreeNode?) -> TreeNode? {
        var total = 0
        dfs(root, &total)
        
        return root
    }
    
    private static func dfs(_ node: TreeNode?, _ total: inout Int) {
        guard let node = node else {
            return
        }
        
        dfs(node.right, &total)
        total += node.val
        node.val = total
        dfs(node.left, &total)
    }
}
