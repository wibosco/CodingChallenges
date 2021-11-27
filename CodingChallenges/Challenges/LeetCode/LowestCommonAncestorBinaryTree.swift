//
//  LowestCommonAncestorBinaryTree.swift
//  CodingChallenges
//
//  Created by William Boles on 27/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-tree/
//binary tree
//DFS
struct LowestCommonAncestorBinaryTree {
    
    //Time: O(n)
    //Space: O(n) - if calll stack is counted otherwise O(1)
    //
    //Solution description:
    //1. Using DFS find the path to `p` and `q` in the same call stack
    //2. When we have found both `p` and `q` in the same call, return that node as the lca
    static func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let root = root, let p = p, let q = q else {
            return nil
        }
        
        var lca: TreeNode?

        findLowestCommonAncestor(root, p, q, &lca)
        
        return lca
    }
    
    @discardableResult
    private static func findLowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?, _ lca: inout TreeNode?) -> Bool {
        guard let root = root, let p = p, let q = q, lca == nil else {
            return false
        }
        
        let mid = (root.val == p.val) || (root.val == q.val) //is the current node p or q
        
        let left = findLowestCommonAncestor(root.left, p, q, &lca)
        //need two matches for the current node  to be lca
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
    
    //Time: O(n^2)
    //Space: O(n)
    //array
    //
    //Solution description:
    //1. Using DFS find the path to `p` and `q`
    //2. Compare paths and return first common node
    static func lowestCommonAncestorArray(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let root = root, let p = p, let q = q else {
            return nil
        }
        
        var pathToP = [TreeNode]()
        var pathToQ = [TreeNode]()
        
        findPath(to: p, from: root, path: &pathToP)
        findPath(to: q, from: root, path: &pathToQ)
        
        for pNode in pathToP { // `pathToP` and `pathToQ` are already in reverse order
            for qNode in pathToQ {
                if pNode.val == qNode.val {
                    return pNode
                }
            }
        }
        
        return root
    }
    
    @discardableResult
    private static func findPath(to node: TreeNode, from root: TreeNode?,  path: inout [TreeNode]) -> Bool {
        guard let root = root else {
            return false
        }
        
        if node.val == root.val {
            path.append(node)
            return true
        }
        
        let foundLeft = findPath(to: node, from: root.left, path: &path)
        if foundLeft {
            path.append(root)
            return true
        }
        
        let foundRight = findPath(to: node, from: root.right, path: &path)
        if foundRight {
            path.append(root)
            return true
        }
        
        return false
    }
}
