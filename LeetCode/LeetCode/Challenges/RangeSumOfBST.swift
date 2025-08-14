//
//  RangeSumOfBST.swift
//  LeetCode
//
//  Created by William Boles on 17/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/range-sum-of-bst/
struct RangeSumOfBST {
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(h) where h is the height of the tree
    //binary search tree
    //binary tree
    //DFS
    //recursive
    //bottom-up
    //
    //Solution Description:
    //Using DFS to recursively traverse the tree to each leaf. Once a leaf is enocunter the recursive stack starts to unwind
    //we check if the current nodes value is between `low` and `high` we add that value to the values returned from the left
    //and right banches. This combined sum is returned. We repeat this process until the stack has unwinded and can return
    //the final summed value. As this is a BST, we don't need to search all nodes just those that fall within the range `low`
    //to `high`.
    func rangeSumBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> Int {
        guard let root else {
            return 0
        }

        var sum = 0

        if low < root.val { //BST so all nodes to left are less than root
            sum += rangeSumBST(root.left, low, high)
        }

        if high > root.val { //BST so all nodes to right are greater than root
            sum += rangeSumBST(root.right, low, high)
        }
        
        if root.val >= low && root.val <= high {
            sum += root.val
        }

        return sum
    }
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(n) where n is the size of the largest level
    //binary tree
    //binary search tree
    //BFS
    //
    //Solution Description:
    //Using BFS to traverse the tree, compare each node's value to determine if it is between `low` and `high`. If
    //it is then add the value to the `result`. Then add the nodes left and right nodes to the queue and repeat.
    func rangeSumBST2(_ root: TreeNode?, _ low: Int, _ high: Int) -> Int {
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
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(n)
    //binary tree
    //binary search tree
    //DFS
    //recursive
    //inout
    //pre-order
    //
    //Solution Description:
    //Using DFS to recursively traverse the tree, compare each node's value to determine if it is between `low` and `high`.
    //If it is then add the value to the `result`. Then add the nodes left and right nodes to the queue and repeat.
    func rangeSumBST3(_ root: TreeNode?, _ low: Int, _ high: Int) -> Int {
        var sum = 0
        dfs(root, low, high, &sum)
        return sum
    }
    
    private func dfs(_ root: TreeNode?, _ low: Int, _ high: Int, _ sum: inout Int) {
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
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(n)
    //binary tree
    //binary search tree
    //DFS
    //iterative
    //
    //Solution Description:
    //Using DFS to iteratively traverse the tree, compare each node's value to determine if it is between `low` and `high`.
    //If it is then add the value to the `result`. Then add the nodes left and right nodes to the queue and repeat.
    func rangeSumBST4(_ root: TreeNode?, _ low: Int, _ high: Int) -> Int {
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
    
    //Time: O(n) where n the number of nodes in the tree
    //Space: O(h) where h is the height of the tree
    //binary tree
    //binary search tree
    //DFS
    //recusive
    //bottom up
    //
    //Solution Description:
    //Using DFS to recursively traverse the tree to each leaf. Once a leaf is enocunter the recursive stack starts to unwind
    //we check if the current nodes value is between `low` and `high` we add that value to the values returned from the left
    //and right banches. This combined value is returned. We repeat this process until the stack has unwinded and can return
    //the final summed value.
    func rangeSumBST5(_ root: TreeNode?, _ low: Int, _ high: Int) -> Int {
        guard let root else {
            return 0
        }

        let left = rangeSumBST5(root.left, low, high)
        let right = rangeSumBST5(root.right, low, high)

        let val = root.val >= low && root.val <= high ? root.val : 0
        let sum = left + right + val

        return sum
    }
}
