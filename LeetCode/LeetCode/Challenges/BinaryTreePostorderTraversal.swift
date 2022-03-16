//
//  BinaryTreePostorderTraversal.swift
//  CodingChallenges
//
//  Created by William Boles on 22/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/binary-tree-postorder-traversal/
//binary tree
//DFS
struct BinaryTreePostorderTraversal {
    
    //Time: O(n) where `n` is the number of nodes in the tree
    //Space: O(n) where `n` is the number of nodes in the tree
    //recursion
    static func postorderTraversal(_ root: BinaryTreeNode?) -> [Int] {
        guard let root = root else {
            return []
        }

        var visited = [Int]()

        postorderTraversal(node: root, visited: &visited)

        return visited
    }

    private static func postorderTraversal(node: BinaryTreeNode?, visited: inout [Int]) {
        guard let node = node else {
            return
        }

        postorderTraversal(node: node.left, visited: &visited)
        postorderTraversal(node: node.right, visited: &visited)
        visited.append(node.val)
    }
    
    //Time: O(n) where `n` is the number of nodes in the tree
    //Space: O(n) where `n` is the number of nodes in the tree
    //iterative
    static func postorderTraversalIterative(_ root: BinaryTreeNode?) -> [Int] {
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

        return visited.reversed()
    }
    
}
