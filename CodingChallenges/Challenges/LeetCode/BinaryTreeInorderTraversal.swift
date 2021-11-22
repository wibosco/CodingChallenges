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
struct BinaryTreeInorderTraversal {
    
    //Time: O(n)
    //Space: O(n)
    static func inorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
            return [Int]()
        }
        
        var visited = [Int]()
        
        inOrderTraversal(node: root, visited: &visited)
        
        return visited
    }
    
    private static func inOrderTraversal(node: TreeNode?, visited: inout [Int]) {
        guard let node = node else {
            return
        }
        
        inOrderTraversal(node: node.left, visited: &visited)
        visited.append(node.val)
        inOrderTraversal(node: node.right, visited: &visited)
    }
}
