//
//  MaximumDepthBinaryTree.swift
//  LeetCode
//
//  Created by William Boles on 23/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/maximum-depth-of-binary-tree/
//binary tree
struct MaximumDepthBinaryTree {
    
    //Time: O(n)
    //Space: O(log n) - best, O(n) - worse
    //DFS
    //recursive
    //
    //Solution Description:
    //Using DFS, traverse the the end of each branch of the tree. As we return from that traverse we start counting the
    //levels (bottom-up counting). We then compare the depth at each branch and return the the largest + 1 (for the
    //current level). Once there are no more calls, we are back at the root.
    //
    //N.B. see https://stackoverflow.com/questions/2603692/what-is-the-difference-between-tree-depth-and-height/2603707#2603707
    //for difference between height and depth
    static func maxDepth(_ root: BinaryTreeNode?) -> Int {
        guard let root = root else { //base when we go beyond a leaf
            return 0
        }
        
        let leftHeight = maxDepth(root.left)
        let rightHeight = maxDepth(root.right)

        return max(leftHeight, rightHeight) + 1 // we add 1 for the current level
    }
    
    //Time: O(n)
    //Space: O(log n) - best, O(n) - worse
    //DFS
    //recursive
    //
    //Solution Description:
    //Using DFS, traverse down the tree adding 1 to the `depth` for level we encounter until we go beyond the leaf nodes
    //(top-down counting). When this happens we return the depth on that branch. We then compare the "depth" the depth of
    //each branch and keep the larger depth.
    //
    //N.B. see https://stackoverflow.com/questions/2603692/what-is-the-difference-between-tree-depth-and-height/2603707#2603707
    //for difference between height and depth
    static func maxDepthDFS(_ root: BinaryTreeNode?) -> Int {
        return maxDepthDFS(root, 0)
    }
    
    private static func maxDepthDFS(_ root: BinaryTreeNode?, _ depth: Int) -> Int {
        guard let root = root else {
            return depth
        }
        
        let leftDepth = maxDepthDFS(root.left, depth + 1) // we add 1 for the current level
        let rightDepth = maxDepthDFS(root.right, depth + 1)

        return max(leftDepth, rightDepth)
    }
    
    //Time: O(n)
    //Space: O(n) worst/average (O(1) for best)
    //BFS
    //iterative
    //queue
    //
    //Solution Description:
    //Using BFS, traverse down the tree adding 1 to the `depth` for level we encounter. When the queue is empty we have
    //the maximum depth.
    static func maxDepthBFS(_ root: BinaryTreeNode?) -> Int {
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
