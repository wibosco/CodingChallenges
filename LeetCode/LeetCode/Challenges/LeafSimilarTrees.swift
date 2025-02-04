//
//  LeafSimilarTrees.swift
//  LeetCode
//
//  Created by William Boles on 10/11/2023.
//

import Foundation

//https://leetcode.com/problems/leaf-similar-trees/
struct LeafSimilarTrees {
    
    //Time: O(n + m) where n is the number of nodes in tree1
    //               where m is the number of nodes in tree2
    //Space: O(n + m)
    //binary tree
    //DFS
    //recursive
    //inout
    //
    //Solution Description:
    //
    func leafSimilar(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
        var order1 = [Int]()
        dfs(root1, &order1)
        
        var order2 = [Int]()
        dfs(root2, &order2)
    
        return order1 == order2
    }
    
    private func dfs(_ node: TreeNode?, _ order: inout [Int]) {
        guard let node = node else {
            return
        }
        
        if node.left == nil && node.right == nil {
            order.append(node.val)
        }
        
        dfs(node.left, &order)
        dfs(node.right, &order)
    }
}
