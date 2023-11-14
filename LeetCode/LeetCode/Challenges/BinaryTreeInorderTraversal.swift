//
//  BinaryTreeInorderTraversal.swift
//  LeetCode
//
//  Created by William Boles on 22/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/binary-tree-inorder-traversal/
struct BinaryTreeInorderTraversal {
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(n) where n is the number of nodes in the tree
    //binary tree
    //DFS
    //recursive
    //
    //Solution Description:
    //Using recursion we perform a DFS traversal through the tree. As we visit nodes, we add them to the `order` array
    //only once we have exhausted all left (lesser) child nodes and before all right (greater) nodes.
    static func inorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
            return []
        }

        var order = [Int]()

        inorderTraversal(root, &order)

        return order
    }

    private static func inorderTraversal(_ node: TreeNode?, _ order: inout [Int]) {
        guard let node = node else {
            return
        }

        inorderTraversal(node.left, &order)
        order.append(node.val)
        inorderTraversal(node.right, &order)
    }
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(n) where n is the number of nodes in the tree
    //DFS
    //iterative
    //
    //Solution Description:
    //Using an array as a stack we iteratively perform a DFS traversal through the tree. As we visit nodes, we add them
    //to the `order` array only once we have exhausted all left (lesser) child nodes and before all right (greater) nodes.
    static func inorderTraversalIterative(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
            return []
        }
        
        var order = [Int]()
        var stack = [TreeNode]()
        var current: TreeNode? = root
        
        while !stack.isEmpty || current != nil {
            if let c = current {
                stack.append(c)
                current = c.left
            } else {
                let popped = stack.removeLast()
                order.append(popped.val)
                current = popped.right
            }
        }
        
        return order
    }
}
