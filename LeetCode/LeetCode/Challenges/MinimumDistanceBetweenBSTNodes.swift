//
//  MinimumDistanceBetweenBSTNodes.swift
//  LeetCode
//
//  Created by William Boles on 10/11/2023.
//

import Foundation

//https://leetcode.com/problems/minimum-distance-between-bst-nodes/
struct MinimumDistanceBetweenBSTNodes {
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(n)
    //binary tree
    //binary search tree
    //DFS
    //recursive
    //in-order
    //inout
    //
    //Solution Description:
    //By performing an in-order traversal of a binary search tree we get an ascending ordered list of the nodes in that tree. We can
    //then iterate through that list and compare neighbors with each to find the smallest difference in the tree.
    static func minDiffInBST(_ root: TreeNode?) -> Int {
        var order = [Int]()
        inorder(root, &order)
        
        var minDiff = Int.max
        for i in 1..<order.count {
            let diff = abs((order[(i - 1)] - order[i]))
            
            minDiff = min(minDiff, diff)
        }
        
        return minDiff
    }
    
    private static func inorder(_ node: TreeNode?, _ order: inout [Int]) {
        guard let node = node else {
            return
        }
        
        inorder(node.left, &order)
        order.append(node.val)
        inorder(node.right, &order)
    }
}
