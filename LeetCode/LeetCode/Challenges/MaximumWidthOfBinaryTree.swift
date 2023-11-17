//
//  MaximumWidthOfBinaryTree.swift
//  LeetCode
//
//  Created by William Boles on 17/11/2023.
//

import Foundation

//https://leetcode.com/problems/maximum-width-of-binary-tree/
struct MaximumWidthOfBinaryTree {
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(n)
    //binary tree
    //BFS
    //iterative
    //level traversal
    //relative indexing
    //
    //Solution Description:
    //Using BFS we traverse the tree level-by-level and left-to-right within that level. The twist here is that we also index each node
    //within a level relative to the other nodes i.e. the first node will have an index of either 0 or 1 (left or right child) regardless
    //of what it's index would actually be in a full level - remember we only care about the gap between the nodes not their position. At
    //each level is calculate the widest gap between the nodes by taking the difference between first and last nodes and compare that
    //against `maxWidth` - updating if need be. We repeat this process for all levels.
    static func widthOfBinaryTree(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return -1
        }
        
        var queue = [(TreeNode, Int)]()
        queue.append((root, 0))
        
        var maxWidth = 0
        
        while !queue.isEmpty {
            var nextIteration = [(TreeNode, Int)]()
            
            let leftMost = queue[0].1
            let rightMost = queue[(queue.count - 1)].1
            
            maxWidth = max(maxWidth, ((rightMost - leftMost) + 1)) //+1 as we are counting how many nodes are in this range
            
            for (node, index) in queue {
                if let left = node.left {
                    //need to frame index in this level to avoid int overflow
                    let levelIndex = ((index - leftMost) * 2)
                    
                    nextIteration.append((left, levelIndex))
                }
                
                if let right = node.right {
                    //need to frame index in this level to avoid int overflow
                    let levelIndex = ((index - leftMost) * 2) + 1 //+1 to differ left and right child
                    
                    nextIteration.append((right, levelIndex))
                }
            }
            
            queue = nextIteration
        }
        
        return maxWidth
    }
}
