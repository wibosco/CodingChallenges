//
//  SecondMinimumNodeInBinaryTree.swift
//  LeetCode
//
//  Created by William Boles on 28/01/2022.
//  Copyright © 2022 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/second-minimum-node-in-a-binary-tree/
struct SecondMinimumNodeInBinaryTree {
    
    //Time: O(n log n) where n is the number of nodes in the tree
    //Space: O(n) where n is the number of nodes in the tree
    //binary tree
    //DFS
    //recursion
    //sorted
    //
    //Solution Description:
    //Traverse the tree using DFS and insert every node into the `values` set, then sort that set and return the
    //second element (if it exists else return -1)
    func findSecondMinimumValue(_ root: TreeNode?) -> Int {
        var values = Set<Int>()
        
        dfs(root, &values)
        
        guard values.count > 1 else {
            return -1
        }
        
        let sorted = Array(values).sorted { $0 < $1 } // O(n log n)
        
        return sorted[1]
    }
    
    private func dfs(_ root: TreeNode?, _ values: inout Set<Int>) {
        guard let root = root else {
            return
        }
        
        dfs(root.left, &values)
        values.insert(root.val)
        dfs(root.right, &values)
    }
}
