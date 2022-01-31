//
//  SameTree.swift
//  CodingChallenges
//
//  Created by William Boles on 28/01/2022.
//  Copyright © 2022 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/same-tree/
//binary tree
struct SameTree {
    
    //Time: O(n) where `n` is the number of nodes in a matching tree
    //Space: O(h) where `h` is the number of levels in a matching tree
    //DFS
    //recursive
    //matching
    //
    //Solution Description:
    //Using DFS we traverse through both trees at once, checking that each level the nodes have the same value.
    //
    //Similar to https://leetcode.com/problems/symmetric-tree/
    //Similar to https://leetcode.com/problems/subtree-of-another-tree/
    static func isSameTree(_ p: BinaryTreeNode?, _ q: BinaryTreeNode?) -> Bool {
        guard p != nil, q != nil else {
            return p == nil && q == nil
        }
        
        guard let p = p, let q = q, p.val == q.val else {
            return false
        }
        
        return isSameTree(p.left, q.left) && isSameTree(p.right, q.right)
    }
}
