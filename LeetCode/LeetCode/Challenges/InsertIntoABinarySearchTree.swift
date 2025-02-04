//
//  InsertIntoABinarySearchTree.swift
//  LeetCode
//
//  Created by William Boles on 15/11/2023.
//

import Foundation

//https://leetcode.com/problems/insert-into-a-binary-search-tree/
struct InsertIntoABinarySearchTree {
    
    //Time: O(h) where h is the height of the tree
    //Space: O(h)
    //binary tree
    //binary search tree
    //
    //Solution Description:
    //As a BST has an order, when inserting a new value into the tree we are able to make choices at each node as to if we
    //should go left or right - left if `val` is less than the current node's value or right if `val` is greater than the
    //current nodes value. As a subtree has the same properties as tree we can use a recursive approach to find where in the
    //tree `val` should go. We recursively search the tree until we find a node without a child on the side that we want to
    //go down, at this moment we have found the position that `val` should be inserted into and we do so.
    func insertIntoBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        guard let root = root else {
            return TreeNode(val)
        }
        
        insert(root, val)
        
        return root
    }
    
    private func insert(_ root: TreeNode?, _ val: Int) {
        guard let root = root else {
            return
        }
        
        if val < root.val {
            if let left = root.left {
                insert(left, val)
            } else {
                root.left = TreeNode(val)
            }
        } else {
            if let right = root.right {
                insert(right, val)
            } else {
                root.right = TreeNode(val)
            }
        }
    }
}
