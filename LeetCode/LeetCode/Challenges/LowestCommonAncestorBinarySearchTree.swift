//
//  LowestCommonAncestorBinarySearchTree.swift
//  LeetCode
//
//  Created by William Boles on 16/01/2022.
//  Copyright © 2022 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-search-tree/
struct LowestCommonAncestorBinarySearchTree {
    
    //Time: O(h) where h is the height of the tree
    //Space: O(1)
    //binary tree
    //binary search tree
    //iterative
    //
    //Solution Description:
    //Using an iterative approach we traverse the tree. At each node we compare the `val` of `node` against that of `p` and `q`;
    //if the `node` value is greater than both then continue search down left branch only; if the root value is less than both
    //then continue search down the right branch only; if the both are different then we have found the lowest common ancestor
    //as one of p and q is in the left branch and one in the right branch or one is in fact the node itself.
    //
    //N.B. As we are able to make informed choices due the nature of a BST we only need to hold onto one node at any given time.
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let root, let p, let q else {
            return nil
        }
        
        var node: TreeNode? = root
        
        while let n = node {
            if n.val > p.val && n.val > q.val { // node is greater than p & q so search left
                node = n.left
            } else if n.val < p.val && n.val < q.val { // node is less than p & q so search right
                node = n.right
            } else { // p & q are going down different branches or node is either one so this is the lca
                return n
            }
        }
    
        return nil
    }
    
    //Time: O(h) where h is the height of the tree
    //Space: O(h)
    //binary tree
    //binary search tree
    //DFS
    //stack
    //recursive
    //
    //Solution Description:
    //Using DFS traverse the tree. Compare the `val` of `root` against that of `p` and `q`; if the root value is greater than both
    //then continue search down left branch only; if the root value is less than both then continue search down the right branch
    //only; else we have found the lowest common ancestor as one of p and q is in the left branch and one in the right branch or
    //one is in fact the root itself.
    func lowestCommonAncestor2(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let root = root, let p = p, let q = q else {
            return nil
        }
        
        if root.val > p.val && root.val > q.val { // root is greater than p & q so search left
            return lowestCommonAncestor(root.left, p, q)
        } else if root.val < p.val && root.val < q.val { // root is less than p & q so search right
            return lowestCommonAncestor(root.right, p, q)
        }
        
        // p & q are going down different branches or node is either one so this is the lca
        return root
    }
    
    //Time: O(h) where h is the number of nodes in the tree
    //Space: O(1) there will only ever be one node in the queue
    //binary tree
    //binary search tree
    //BFS
    //queue
    //iterative
    //
    //Solution Description:
    //Using BFS traverse the tree. Compare the `val` of `root` against that of `p` and `q`; if the root value is greater than both
    //then continue search down left branch only; if the root value is less than both then continue search down the right branch
    //only; else we have found the lowest common ancestor as one of p and q is in the left branch and one in the right branch or
    //one is in fact the root itself.
    func lowestCommonAncestor3(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let root = root, let p = p, let q = q else {
            return nil
        }
        
        var queue = [root]
        
        while !queue.isEmpty {
            var newQueueItems = [TreeNode]()
            
            for node in queue {
                if node.val > p.val && node.val > q.val { // node is greater than p & q so search left
                    if let left = node.left {
                        newQueueItems.append(left)
                    }
                } else if node.val < p.val && node.val < q.val { // node is less than p & q so search right
                    if let right = node.right {
                        newQueueItems.append(right)
                    }
                } else {
                    // p & q are going down different branches or node is either one so this is the lca
                    return node
                }
            }
            
            queue = newQueueItems
        }
    
        return nil
    }
}
