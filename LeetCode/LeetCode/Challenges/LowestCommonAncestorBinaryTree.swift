//
//  LowestCommonAncestorBinaryTree.swift
//  LeetCode
//
//  Created by William Boles on 27/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-tree/
struct LowestCommonAncestorBinaryTree {
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(h) where h is the height of the tree
    //binary tree
    //DFS
    //recursive
    //inout
    //top-down
    //
    //Solution description:
    //Traverse the tree using DFS. In order for a node to be a common ancestor it needs 2 of the 3 below to be true:
    //
    //1. be either be `p` or `q` itself
    //2. contain `p` in it's right or left branches
    //3. contain `q` in it's right or left branch
    //
    //As we are only interested in the lowest-common-ancestor rather than any common ancestor we need to ensure that we
    //pass back the first node that is true for 2 of the above 3 scenarios. When we find this node we set it to `lca`.
    //
    //Similar to: https://leetcode.com/problems/find-distance-in-a-binary-tree/
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        var lca: TreeNode?

        findLowestCommonAncestor(root, p, q, &lca)
        
        return lca
    }
    
    @discardableResult
    private func findLowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?, _ lca: inout TreeNode?) -> Bool {
        //checking lca here prevents us falsely reporting a higher common-ancestor node as the lowest-common-ancestor
        guard let root = root, let p = p, let q = q, lca == nil else {
            return false
        }
        
        let mid = (root.val == p.val) || (root.val == q.val) //is the current node `p` or `q`
        
        let left = findLowestCommonAncestor(root.left, p, q, &lca)
        //need two matches for the current node to be lca
        if mid && left {
            lca = root
            
            return true
        }
        
        let right = findLowestCommonAncestor(root.right, p, q, &lca)
        //need two matches for the current node to be lca
        if mid && right {
            lca = root
            
            return true
        }
        
        //the current node is neither `p` or `q` but is the first node to have
        //both `p` and `q` found among it children nodes so is the lca
        if left && right {
            lca = root
            
            return true
        }
    
        return mid || left || right
    }
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(n)
    //binary tree
    //DFS
    //recursive
    //backtracking
    //array
    //top-down
    //
    //Solution description:
    //Using DFS we can track the path to both `p` and `q` nodes - storing this each path in an array. We then iterate through
    //those paths and when we find the same node in both paths we return that node.
    func lowestCommonAncestorArrays(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let root = root, let p = p, let q = q else {
            return nil
        }
        
        var pathToP = [TreeNode]()
        var pathToQ = [TreeNode]()
        
        findPath(to: p, from: root, path: &pathToP)
        findPath(to: q, from: root, path: &pathToQ)
        
        var lca = root
        var i = 0
        
        while i < pathToP.count && i < pathToQ.count {
            guard pathToP[i].val == pathToQ[i].val else {
                break
            }
            
            lca = pathToP[i] //could have been pathToQ as they both contain the same node
            i += 1
        }
    
        return lca
    }
    
    @discardableResult
    private func findPath(to target: TreeNode, from root: TreeNode?, path: inout [TreeNode]) -> Bool {
        guard let root = root else {
            return false
        }
        
        path.append(root)
        
        guard target.val != root.val else {
            return true
        }
        
        let found = findPath(to: target, from: root.left, path: &path) || findPath(to: target, from: root.right, path: &path)
        
        if !found {
            path.removeLast() //backtracking
        }
        
        return found
    }
}
