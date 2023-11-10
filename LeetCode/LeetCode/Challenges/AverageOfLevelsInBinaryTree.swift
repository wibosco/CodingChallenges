//
//  AverageOfLevelsInBinaryTree.swift
//  LeetCode
//
//  Created by William Boles on 10/11/2023.
//

import Foundation

//https://leetcode.com/problems/average-of-levels-in-binary-tree/
struct AverageOfLevelsInBinaryTree {
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(m) where m is the number of levels in the tree
    //binary tree
    //BFS
    //iterative
    //level traversal
    //
    //Solution Description:
    //Using BFS we traversal the tree level-by-level. At each level we calculate the average of that level and add it to the
    //`averages` array. Once all levels have been traversed we return `averages`.
    static func averageOfLevels(_ root: BinaryTreeNode?) -> [Double] {
        guard let root = root else {
            return [Double]()
        }
        
        var averages = [Double]()
        
        var queue = [BinaryTreeNode]()
        queue.append(root)
        
        while !queue.isEmpty {
            var nextIteration = [BinaryTreeNode]()
            var sum = 0
            
            for node in queue {
                sum += node.val
                
                if let left = node.left {
                    nextIteration.append(left)
                }
                
                if let right = node.right {
                    nextIteration.append(right)
                }
            }
            
            let average = Double(sum) / Double(queue.count)
            averages.append(average)
            
            queue = nextIteration
        }
        
        return averages
    }
}
