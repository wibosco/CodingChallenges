//
//  BinaryTreeLevelOrderTraversal.swift
//  CodingChallenges
//
//  Created by William Boles on 22/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/binary-tree-level-order-traversal/
//binary tree
//BFS
struct BinaryTreeLevelOrderTraversal {
    
    //Time: O(n)
    //iterative
    static func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else {
            return []
        }
        
        var queue = [root]
        var levels = [[Int]]()
        
        while !queue.isEmpty {
            let levelCount = queue.count //how many node pairs are in this level
            var levelValues = [Int]()
            
            for _ in 0..<levelCount {
                let node = queue.removeFirst()
                levelValues.append(node.val)
                
                if let left = node.left {
                    queue.append(left)
                }
                
                if let right = node.right {
                    queue.append(right)
                }
            }
            
            levels.append(levelValues)
        }
        
        return levels
    }
}
