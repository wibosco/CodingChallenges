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
    
    //Time: O(n)
    //Space: O(n)
    static func postorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
            return []
        }
        
        var visited = [Int]()
        
        postorderTraversal(node: root, visited: &visited)
        
        return visited
    }
    
    private static func postorderTraversal(node: TreeNode?, visited: inout [Int]) {
        guard let node = node else {
            return
        }
        
        postorderTraversal(node: node.left, visited: &visited)
        postorderTraversal(node: node.right, visited: &visited)
        visited.append(node.val)
    }
}
