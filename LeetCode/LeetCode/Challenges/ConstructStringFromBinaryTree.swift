//
//  ConstructStringFromBinaryTree.swift
//  LeetCode
//
//  Created by William Boles on 13/09/2023.
//

import Foundation

//https://leetcode.com/problems/construct-string-from-binary-tree/
struct ConstructStringFromBinaryTree {
  
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(h) where h is the height of the tree
    //binary tree
    //DFS
    //string
    //recursive
    //
    //Solution Description:
    //Using a pre-order traversal of the tree, we gradually build up the string representation of treem in a recursive
    //manner. Care must be taken when a node doesn't have a left or right child.
    static func tree2str(_ root: BinaryTreeNode?) -> String {
        guard let str = preorder(root) else {
            return ""
        }

        return str
    }

    private static func preorder(_ node: BinaryTreeNode?) -> String? {
        guard let node = node else {
            return nil
        }

        var str = "\(node.val)"
        let left = preorder(node.left)
        let right = preorder(node.right)

        if let left = left, let right = right {
            str += "(\(left))(\(right))"
        } else if let left = left {
            str += "(\(left))"
        } else if let right = right {
            str += "()(\(right))"
        }

        return str
    }
}
