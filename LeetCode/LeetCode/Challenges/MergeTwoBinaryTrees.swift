//
//  MergeTwoBinaryTrees.swift
//  LeetCode
//
//  Created by William Boles on 11/04/2022.
//

import Foundation

//https://leetcode.com/problems/merge-two-binary-trees/
struct MergeTwoBinaryTrees {
    
    //Time: O(n + m) where n is the number of nodes in `root1`
    //               where m is the number of nodes in `root2`
    //Space: O(log n + log m)
    //Alternative space: O(d) where d is the maximum depth of `root1` or `root2`
    //binary tree
    //DFS
    //recursive
    //
    //Solution Description:
    //Traversing DFS through `root1` and `root2` if both trees at the current level are non-nil we merge their values and
    //create a new node - this new node is returned as the result of the of merge. We then attempt to traverse deeper in
    //both trees by selecting the same branch in both and recursively calling `mergeTrees`. If only one tree at the current
    //level is non-nil we take that tree and supplant it into our merged tree. If both trees at that level are nil then we
    //have reach the end of that branch and return nil as the result of the merge.
    func mergeTrees(_ root1: TreeNode?, _ root2: TreeNode?) -> TreeNode? {
        if let root1 = root1, let root2 = root2 {
            let val = root1.val + root2.val
            let node = TreeNode(val)
            
            node.left = mergeTrees(root1.left, root2.left)
            node.right = mergeTrees(root1.right, root2.right)
            
            return node
        } else if let root1 = root1 {
            return root1
        } else if let root2 = root2 {
            return root2
        }
        
        return nil
    }
}
