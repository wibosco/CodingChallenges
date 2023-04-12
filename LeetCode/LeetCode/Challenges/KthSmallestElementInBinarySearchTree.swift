//
//  KthSmallestElementInBinarySearchTree.swift
//  LeetCode
//
//  Created by William Boles on 28/01/2022.
//  Copyright © 2022 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/kth-smallest-element-in-a-bst/
//binary search tree
struct KthSmallestElementInBinarySearchTree {
    
    //Time: O(n) `n` is the number of nodes in the tree
    //Space: O(h) where `h` is the height of the tree
    //DFS
    //inorder
    //recursive
    //
    //Solution Description:
    //An inorder traversal of a binary search tree results in an ordered ascending array of nodes. Using this we can
    //perform an inorder traversal until we get to the `k`th element in the sorted array, at which point we can return its
    //value
    static func kthSmallest(_ root: BinaryTreeNode?, _ k: Int) -> Int {
        var k = k
        var kthSmallestNode: BinaryTreeNode?
        
        dfs(root, &k, &kthSmallestNode)
        
        guard let kthSmallestNode = kthSmallestNode else {
            return -1
        }
        
        return kthSmallestNode.val
    }
    
    private static func dfs(_ root: BinaryTreeNode?, _ k: inout Int, _ kthSmallestNode: inout BinaryTreeNode?) {
        guard let root = root, kthSmallestNode == nil else {
            return
        }
        
        dfs(root.left, &k, &kthSmallestNode)
        
        k -= 1
        if k == 0 {
            kthSmallestNode = root
        }
        
        dfs(root.right, &k, &kthSmallestNode)
    }
}
