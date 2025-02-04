//
//  InvertBinaryTree.swift
//  LeetCode
//
//  Created by William Boles on 12/04/2023.
//

import Foundation

//https://leetcode.com/problems/invert-binary-tree/
struct InvertBinaryTree {
    
    //Time: O(n) where n is nodes in the tree
    //Space: O(h) where h is the height of the tree
    //binary tree
    //DFS
    //recursive
    //
    //Solution Description:
    //Using DFS, we first traverse fully down the right subtree (could have been the left subtree first) and assign those
    //right child to the nodes left property. We repeat this process for the left subtree.
    //
    //N.B. We need to traverse both subtrees without making any changes so as not to override one of the branches before we
    //can traverse it.
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else {
            return nil
        }
        
        //invert from the leaf nodes up
        let left = invertTree(root.left)
        let right = invertTree(root.right)
        
        root.left = right
        root.right = left
        
        return root
    }
}
