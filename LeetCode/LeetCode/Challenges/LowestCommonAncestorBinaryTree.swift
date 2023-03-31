//
//  LowestCommonAncestorBinaryTree.swift
//  LeetCode
//
//  Created by William Boles on 27/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-tree-ii/
//binary tree
struct LowestCommonAncestorBinaryTree {
    
    //Time: O(n) where `n` is the number of nodes in the tree
    //Space: O(log n) where `log n` is the number of levels in the tree
    //DFS
    //
    //Solution description:
    //Traverse the tree using DFS. In order for a node to be a common ancestor it needs 2 of the 3 below to
    //be true:
    //
    //1. be either be `p` or `q` itself
    //2. contain `p` in it's right or left branches
    //3. contain `q` in it's right or left branch
    //
    //As we are only interested in the lowest common ancestor rather than any common ancestor we need to
    //ensure that we pass back the first node that is true for 2 of the above 3 scenarios. When we find this
    //node we set it to `lca`
    static func lowestCommonAncestor(_ root: BinaryTreeNode?, _ p: BinaryTreeNode?, _ q: BinaryTreeNode?) -> BinaryTreeNode? {
        var lca: BinaryTreeNode?

        findLowestCommonAncestor(root, p, q, &lca)
        
        return lca
    }
    
    @discardableResult
    private static func findLowestCommonAncestor(_ root: BinaryTreeNode?, _ p: BinaryTreeNode?, _ q: BinaryTreeNode?, _ lca: inout BinaryTreeNode?) -> Bool {
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
    
    //Time: O(n^2)
    //Space: O(n)
    //array
    //
    //Solution description:
    //1. Using DFS find the path to `p` and `q`
    //2. Compare paths and return first common node
    static func lowestCommonAncestorArray(_ root: BinaryTreeNode?, _ p: BinaryTreeNode?, _ q: BinaryTreeNode?) -> BinaryTreeNode? {
        guard let root = root, let p = p, let q = q else {
            return nil
        }
        
        var pathToP = [BinaryTreeNode]()
        var pathToQ = [BinaryTreeNode]()
        
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
    private static func findPath(to node: BinaryTreeNode, from root: BinaryTreeNode?,  path: inout [BinaryTreeNode]) -> Bool {
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
