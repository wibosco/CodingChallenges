//
//  FindModeInBinarySearchTree.swift
//  LeetCode
//
//  Created by William Boles on 09/11/2023.
//

import Foundation

//https://leetcode.com/problems/find-mode-in-binary-search-tree/
struct FindModeInBinarySearchTree {
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(n)
    //binary tree
    //DFS
    //recursive
    //in-order
    //
    //Solution Description:
    //As we have a binary search tree, we know that the nodes are already ordered so if perform a inorder traversal of the
    //tree then nodes with the same value will be beside each other. We can then iterate through that inorder traversal
    //array `nodes` and compare neighbor with neighbor - if two neighbors match then we increment `count`. Once the neighbors
    //either don't match or we run out of neighbors we compare the count of matching neighbors against the most frequent
    //count `maxCount` we have seen so far, if the two counts match then we add `node[i]` to `modes`; if `count` is greater
    //than `maxCount` then we remove all elements from `modes` and add `nodes[i]`; if `count` is less than `maxCount` we
    //move onto the next unique value in `nodes`. After all elements in `nodes` have been check we return `modes`.
     func findMode(_ root: TreeNode?) -> [Int] {
        let nodes = inorder(root)
        
        var modes = [Int]()
        var maxCount = 0
        
        var i = 0
        
        while i < nodes.count {
            var count = 1
            var j = (i + 1)
            
            while j < nodes.count {
                if nodes[i] == nodes[j] {
                    count += 1
                } else {
                    break
                }
                
                j += 1
            }
            
            if count == maxCount {
                modes.append(nodes[i])
            } else if count > maxCount {
                maxCount = count
                modes = [nodes[i]]
            }
            
            i = j
        }
        
        return modes
    }
    
    private func inorder(_ node: TreeNode?) -> [Int] {
        guard let node = node else {
            return [Int]()
        }
        
        return inorder(node.left) + [node.val] + inorder(node.right)
    }
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(n)
    //binary tree
    //DFS
    //recursive
    //dictionary
    //frequency
    //inout
    //
    //Solution Description:
    //Using DFS we traverse the tree and put the each that we encounter into `frequency`, if the value is already in we
    //increment its count otherwise we set the count to 1. Once all nodes in the tree have been visited we iterate
    //through the `frequency` dictionary and add each node/value that has a count of `maxCount` to `modes`. `modes` is
    //then returned.
    func findModeFrequency(_ root: TreeNode?) -> [Int] {
        var frequency = [Int: Int]()
        var maxCount = 0
        
        dfs(root, &frequency, &maxCount)
        
        var modes = [Int]()
        
        for (key, value) in frequency {
            if value == maxCount {
                modes.append(key)
            }
        }
        
        return modes
    }
    
    private func dfs(_ node: TreeNode?, _ frequency: inout [Int: Int], _ maxCount: inout Int) {
        guard let node = node else {
            return
        }
        
        frequency[node.val, default: 0] += 1
        
        maxCount = max(maxCount, frequency[node.val]!)
        
        dfs(node.left, &frequency, &maxCount)
        dfs(node.right, &frequency, &maxCount)
    }
}
