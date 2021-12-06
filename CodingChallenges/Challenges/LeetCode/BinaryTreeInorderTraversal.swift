//
//  BinaryTreeInorderTraversal.swift
//  CodingChallenges
//
//  Created by William Boles on 22/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/binary-tree-inorder-traversal/
//binary tree
//DFS
struct BinaryTreeInorderTraversal {
    
    //Time: O(n)
    //Space: O(n)
    //recursion
    static func inorderTraversal(_ root: BinaryTreeNode?) -> [Int] {
        guard let root = root else {
            return []
        }

        var visited = [Int]()

        inorderTraversal(node: root, visited: &visited)

        return visited
    }

    private static func inorderTraversal(node: BinaryTreeNode?, visited: inout [Int]) {
        guard let node = node else {
            return
        }

        inorderTraversal(node: node.left, visited: &visited)
        visited.append(node.val)
        inorderTraversal(node: node.right, visited: &visited)
    }
    
    //Time: O(n)
    //Space: O(n)
    //iterative
    static func inorderTraversalIterative(_ root: BinaryTreeNode?) -> [Int] {
        guard let root = root else {
            return []
        }
        
        var visited = [Int]()
        var stack = [BinaryTreeNode]()
        var current: BinaryTreeNode? = root
        
        while !stack.isEmpty || current != nil {
            if let c = current {
                stack.append(c)
                current = c.left
            } else {
                let popped = stack.removeLast()
                visited.append(popped.val)
                current = popped.right
            }
        }
        
        return visited
    }
}
