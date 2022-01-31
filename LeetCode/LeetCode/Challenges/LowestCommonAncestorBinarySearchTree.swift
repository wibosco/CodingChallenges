//
//  LowestCommonAncestorBinarySearchTree.swift
//  CodingChallenges
//
//  Created by William Boles on 16/01/2022.
//  Copyright © 2022 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-search-tree/
//binary search tree
struct LowestCommonAncestorBinarySearchTree {
    
    //Time: O(log n) where `n` is the number of nodes in the tree
    //Space: O(log n) where `n` is the number of nodes in the tree
    //dfs
    //stack
    //recursive
    //
    //Solution Description:
    //Using DFS traverse the tree. Compare the `val` of `root` against that of `p` and `q`; if the root value is greater than both
    //then continue search down left branch only; if the root value is less than both then contine search down the right branch
    //only; else we have found the lowest common ancestor as one of p and q is in the left branch and one in the right branch or
    //one is infact the root itself.
    static func lowestCommonAncestor(_ root: BinaryTreeNode?, _ p: BinaryTreeNode?, _ q: BinaryTreeNode?) -> BinaryTreeNode? {
        guard let root = root, let p = p, let q = q else {
            return nil
        }
        
        if root.val > p.val && root.val > q.val { // root is greater than p & q so search left
            return lowestCommonAncestor(root.left, p, q)
        } else if root.val < p.val && root.val < q.val { // root is less than p & q so search right
            return lowestCommonAncestor(root.right, p, q)
        }
        
        return root
    }
    
    //Time: O(log n) where `n` is the number of nodes in the tree
    //Space: O(1) there will only ever be one node in the queue
    //bfs
    //queue
    //iterative
    //
    //Solution Description:
    //Using BFS traverse the tree. Compare the `val` of `root` against that of `p` and `q`; if the root value is greater than both
    //then continue search down left branch only; if the root value is less than both then contine search down the right branch
    //only; else we have found the lowest common ancestor as one of p and q is in the left branch and one in the right branch or
    //one is infact the root itself.
    static func lowestCommonAncestorBFS(_ root: BinaryTreeNode?, _ p: BinaryTreeNode?, _ q: BinaryTreeNode?) -> BinaryTreeNode? {
        guard let root = root, let p = p, let q = q else {
            return nil
        }
        
        var queue = [root]
        
        while !queue.isEmpty {
            let node = queue.removeFirst()
            
            if node.val > p.val && node.val > q.val { // node is greater than p & q so search left
                if let left = node.left {
                    queue.append(left)
                }
            } else if node.val < p.val && node.val < q.val { // node is less than p & q so search right
                if let right = node.right {
                    queue.append(right)
                }
            } else {
                return node
            }
        }
    
        return nil
    }
}
