//
//  BinaryTreeZigzagLevelOrderTraversal.swift
//  LeetCode
//
//  Created by William Boles on 28/01/2022.
//  Copyright © 2022 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/binary-tree-zigzag-level-order-traversal/
//binary tree
struct BinaryTreeZigzagLevelOrderTraversal {
    
    //Time: O(n) where `n` is the number of nodes in the tree
    //Space: O(n) where `n` is the number of nodes in the tree (`levels` array)
    //BFS
    //array
    //
    //Solution Description:
    //Using BFS we traverse the tree adding the nodes at each level to a `level` array. At the end of each level we check the
    //ordering of that level and if it is meant to be right-to-left we reverse the `level` array before adding to the `levels`;
    //if the ordering is left-to-right we just add the `level` array without reversing. At the end of our traversal, `levels`
    //should contain all the nodes in the tree sorted in zigzag fashion
    static func zigzagLevelOrder(_ root: BinaryTreeNode?) -> [[Int]] {
        guard let root = root else {
            return [[Int]]()
        }
        
        var levels = [[Int]]()
        var queue = [root]
        var leftToRight = true
        
        while !queue.isEmpty {
            let count = queue.count
            var level = [Int]()
            
            for _ in 0..<count {
                let node = queue.removeFirst()
                
                level.append(node.val)
                
                if let left = node.left {
                    queue.append(left)
                }
                
                if let right = node.right {
                    queue.append(right)
                }
            }
            
            if !leftToRight {
                level.reverse()
            }
            
            levels.append(level)
            leftToRight.toggle()
        }
        
        return levels
    }
}
