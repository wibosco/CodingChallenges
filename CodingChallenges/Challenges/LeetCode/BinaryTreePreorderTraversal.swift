//
//  BinaryTreePreorderTraversal.swift
//  CodingChallenges
//
//  Created by William Boles on 22/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/binary-tree-preorder-traversal/
//binary tree
//DFS
struct BinaryTreePreorderTraversal {
    
    //Time: O(n)
    //Space: O(n)
    static func preorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
            return [Int]()
        }
        
        var visited = [Int]()
        
        preorderTraversal(node: root, visited: &visited)
        
        return visited
    }
    
    private static func preorderTraversal(node: TreeNode?, visited: inout [Int]) {
        guard let node = node else {
            return
        }
        
        visited.append(node.val)
        preorderTraversal(node: node.left, visited: &visited)
        preorderTraversal(node: node.right, visited: &visited)
    }
}
