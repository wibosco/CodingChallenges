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
    //Space: O(h) `h` is the height of the tree
    //binary tree
    //recursive
    //
    //Solution Description:
    //Starting we traverse down the tree until we encounter the left nodes and then as we recurse back, we being to invert
    //any child nodes.
    static func invertTree(_ root: BinaryTreeNode?) -> BinaryTreeNode? {
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
