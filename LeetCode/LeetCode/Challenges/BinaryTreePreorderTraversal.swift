//
//  BinaryTreePreorderTraversal.swift
//  LeetCode
//
//  Created by William Boles on 22/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/binary-tree-preorder-traversal/
//binary tree
struct BinaryTreePreorderTraversal {
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(n) where n is the number of nodes in the tree
    //DFS
    //recursion
    static func preorderTraversal(_ root: BinaryTreeNode?) -> [Int] {
        guard let root = root else {
            return []
        }

        var visited = [Int]()

        preorderTraversal(node: root, visited: &visited)

        return visited
    }

    private static func preorderTraversal(node: BinaryTreeNode?, visited: inout [Int]) {
        guard let node = node else {
            return
        }

        visited.append(node.val)
        preorderTraversal(node: node.left, visited: &visited)
        preorderTraversal(node: node.right, visited: &visited)
    }
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(n) where n is the number of nodes in the tree
    //DFS
    //iterative
    static func preorderTraversalIterative(_ root: BinaryTreeNode?) -> [Int] {
        guard let root = root else {
            return []
        }
        
        var stack = [root]
        var visited = [Int]()
        
        while !stack.isEmpty {
            let popped = stack.removeLast()
            visited.append(popped.val)
            
            if let right = popped.right {
                stack.append(right)
            }

            if let left = popped.left {
                stack.append(left)
            }
        }
        
        return visited
    }
}
