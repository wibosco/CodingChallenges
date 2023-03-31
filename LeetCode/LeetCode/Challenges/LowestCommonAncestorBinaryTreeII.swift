//
//  LowestCommonAncestorBinaryTreeII.swift
//  LeetCode
//
//  Created by William Boles on 16/01/2022.
//  Copyright © 2022 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-tree-ii/
//binary tree
struct LowestCommonAncestorBinaryTreeII {
    
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
        
        dfs(root, p, q, &lca)
        
        return lca
    }
    
    @discardableResult
    private static func dfs(_ root: BinaryTreeNode?, _ p: BinaryTreeNode?, _ q: BinaryTreeNode?, _ lca: inout BinaryTreeNode?) -> Bool {
        guard let root = root, let p = p, let q = q, lca == nil else { //check lca to determine if we have found it already
            return false
        }
        
        let isCurrentNodePOrQ = (root.val == p.val) || (root.val == q.val)
        
        let isPOrQInLeftBranch = dfs(root.left, p, q, &lca)
        if isCurrentNodePOrQ && isPOrQInLeftBranch {
            lca = root
            return true
        }
        
        let isPOrQInRightBranch = dfs(root.right, p, q, &lca)
        if isCurrentNodePOrQ && isPOrQInRightBranch {
            lca = root
            return true
        }
        
        if isPOrQInLeftBranch && isPOrQInRightBranch {
            lca = root
            return true
        }
         
        return isCurrentNodePOrQ || isPOrQInLeftBranch || isPOrQInRightBranch
    }
}
