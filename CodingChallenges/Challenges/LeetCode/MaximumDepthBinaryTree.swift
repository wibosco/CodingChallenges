//
//  MaximumDepthBinaryTree.swift
//  CodingChallenges
//
//  Created by William Boles on 23/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/maximum-depth-of-binary-tree/
struct MaximumDepthBinaryTree {
    
    //Time: O(n)
    //Space: O(log n) - best, O(n) - worse
    //DFS
    //recusive
    static func maxDepth(_ root: TreeNode?) -> Int {
        return maxDepth(root, depth: 0)
    }
    
    private static func maxDepth(_ root: TreeNode?, depth: Int) -> Int {
        guard let root = root else {
            return depth
        }
        
        let leftDepth = maxDepth(root.left, depth: depth + 1)
        let rightDepth = maxDepth(root.right, depth: depth + 1)

        return max(leftDepth, rightDepth)
    }
    
    //Time: O(n)
    //Space: O(n) worst/average (O(1) for best)
    //BFS
    //iterative
    static func maxDepthBFS(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        
        var queue = [root]
        var depth = 0
        
        while !queue.isEmpty {
            let levelCount = queue.count
            
            for _ in 0..<levelCount {
                let node = queue.removeFirst()
                
                if let left = node.left {
                    queue.append(left)
                }
                
                if let right = node.right {
                    queue.append(right)
                }
            }
            
            depth += 1
        }
        
        return depth
    }
}
