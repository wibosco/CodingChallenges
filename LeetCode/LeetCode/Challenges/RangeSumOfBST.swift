//
//  RangeSumOfBST.swift
//  CodingChallenges
//
//  Created by William Boles on 17/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/range-sum-of-bst/
//binary search tree
struct RangeSumOfBST {
    
    //Time: O(n) where `n` is the number of nodes in the tree
    //Space: O(n) where `n` is the size of the largest level
    //BFS
    //
    //Solution Description:
    //Using BFS to traverse the tree, compare each node's value to determine if it is between `low` and `high`. If
    //it is then add the value to the `result`. Then add the nodes left and right nodes to the queue and repeat.
    static func rangeSumBST(_ root: BinaryTreeNode?, _ low: Int, _ high: Int) -> Int {
        guard let root = root else {
            return 0
        }
        
        var sum = 0
        var queue = [root]
        
        while !queue.isEmpty {
            let count = queue.count
            
            for _ in 0..<count {
                let node = queue.removeFirst()
                let val = node.val
                
                if val >= low && val <= high {
                    sum += val
                }
                
                if let left = node.left {
                    queue.append(left)
                }
                
                if let right = node.right {
                    queue.append(right)
                }
            }
        }
        
        return sum
    }
    
    //Time: O(n) where `n` is the number of nodes in the tree
    //Space: O(n)
    //DFS
    //recusive
    //
    //Solution Description:
    //Using DFS to recusively traverse the tree, compare each node's value to determine if it is between `low` and
    //`high`. If it is then add the value to the `result`. Then add the nodes left and right nodes to the queue
    //and repeat.
    static func rangeSumBSTDFSRecusive(_ root: BinaryTreeNode?, _ low: Int, _ high: Int) -> Int {
        var sum = 0
        dfs(root, low, high, &sum)
        return sum
    }
    
    private static func dfs(_ root: BinaryTreeNode?, _ low: Int, _ high: Int, _ sum: inout Int) {
        guard let root = root else {
            return
        }
        
        let val = root.val
        if val >= low && val <= high {
            sum += val
        }
        
        dfs(root.left, low, high, &sum)
        dfs(root.right, low, high, &sum)
    }
    
    //Time: O(n) where `n` is the number of nodes in the tree
    //Space: O(n)
    //DFS
    //iterative
    //
    //Solution Description:
    //Using DFS to iteratively traverse the tree, compare each node's value to determine if it is between `low` and
    //`high`. If it is then add the value to the `result`. Then add the nodes left and right nodes to the queue
    //and repeat.
    static func rangeSumBSTDFSIterative(_ root: BinaryTreeNode?, _ low: Int, _ high: Int) -> Int {
        guard let root = root else {
            return 0
        }
        
        var sum = 0
        var stack = [root]
        while !stack.isEmpty {
            let node = stack.removeLast()
            
            if node.val >= low && node.val <= high {
                sum += node.val
            }
            
            if let left = node.left {
                stack.append(left)
            }
            
            if let right = node.right {
                stack.append(right)
            }
        }
        
        return sum
    }
}
