//
//  CountGoodNodesInBinaryTree.swift
//  LeetCode
//
//  Created by William Boles on 08/05/2023.
//

import Foundation

//https://leetcode.com/problems/count-good-nodes-in-binary-tree/
//binary trees
struct CountGoodNodesInBinaryTree {
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(h) where h is the height of the tree
    //DFS
    //pre-order
    //recursive
    //inout
    //
    //Solution Description:
    //Using a DFS pre-order traversal of the tree, we pass the largest/max value we have seen for that branch down to
    //any child nodes and compare their value against the largest/max. Where a nodes value is equal or greater than we
    //increment `count` as this is a "good node" and set `max` to that value. We repeat this process until all nodes
    //have checked.
    static func goodNodes(_ root: BinaryTreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        
        var count = 0
        
        dfs(root, root.val, &count)
        
        return count
    }
    
    private static func dfs(_ node: BinaryTreeNode?, _ max: Int, _ count: inout Int) {
        guard let node = node else {
            return
        }
        
        var max = max
        
        if node.val >= max {
            max = node.val
            count += 1
        }
        
        dfs(node.left, max, &count)
        dfs(node.right, max, &count)
    }
}
