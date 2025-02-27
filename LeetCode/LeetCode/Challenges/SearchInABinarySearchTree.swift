//
//  SearchInABinarySearchTree.swift
//  LeetCode
//
//  Created by William Boles on 19/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/search-in-a-binary-search-tree/
struct SearchInABinarySearchTree {
    
    //Time: O(h), where h is the tree height - O(log⁡ n) in the average case, and O(n) in the worst case.
    //Space: O(l), where l is the number of nodes in each level which in this case will be `1`
    //binary tree
    //binary search tree
    //BFS
    //iterative
    //queue
    //
    //Solution Description:
    //Using BFS we traverse the tree, whenever we encounter a node we check if it is equal to `val` and if so we return it, else
    //we compare `node.val` against `val` to determine whether to take the left or right node as our next search node.
    func searchBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        guard let root = root else {
            return nil
        }
        
        var queue = [root]
        
        while !queue.isEmpty {
            var newQueueItems = [TreeNode]()
            
            for node in queue {
                if node.val == val {
                    return node
                } else if node.val > val { //note that we compare against node not node.left
                    if let left = node.left {
                        newQueueItems.append(left)
                    }
                } else {
                    if let right = node.right {
                        newQueueItems.append(right)
                    }
                }
            }
            
            queue = newQueueItems
        }
        
        return nil
    }
    
    //Time: O(h), where h is the tree height - O(log⁡ n) in the average case, and O(n) in the worst case.
    //Space: O(1)
    //binary tree
    //binary search tree
    //DFS
    //iterative
    //
    //Solution Description:
    //Using DFS traverse the tree, whenever we encounter a node we check if it is equal to `val` and if so break out of the loop,
    //else we compare `node.val` against `val` to determine whether to take the left or right node as our next search node.
    func searchBSTDFSIterative(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        var node = root
        while node != nil && node?.val != val {
            if val <= node!.val { //note that we compare against node not node.left
                node = node!.left
            } else {
                node = node!.right
            }
        }
        
        return node
    }
    
    //Time: O(h), where h is the tree height - O(log⁡ n) in the average case, and O(n) in the worst case.
    //Space: O(h) where h is the tree height - O(log⁡ n) in the average case, and O(n) in the worst case.
    //binary tree
    //binary search tree
    //DFS
    //recursive
    //
    //Solution Description:
    //Using DFS traverse the tree, whenever we encounter a node we check if it is equal to `val` and if so return that node,
    //else we compare `node.val` against `val` to determine whether to recursively take the left or right node as our next root
    //in the search
    func searchBSTDFSRecursive(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        guard let root = root else {
            return nil
        }
        
        guard root.val != val else {
            return root
        }
        
        if val <= root.val { //note that we compare against root not root.left
            return searchBST(root.left, val)
        } else {
            return searchBST(root.right, val)
        }
    }
}
