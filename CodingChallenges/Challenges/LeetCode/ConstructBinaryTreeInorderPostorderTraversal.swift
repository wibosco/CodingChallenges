//
//  ConstructBinaryTreeInorderPostorderTraversal.swift
//  CodingChallenges
//
//  Created by William Boles on 24/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/construct-binary-tree-from-inorder-and-postorder-traversal/
//binary tree
//divide and conquer
//DFS
struct ConstructBinaryTreeInorderPostorderTraversal {
    //postorder = left, right, root
    //inorder = left, root, right
    
    //Time: O(n)
    //Space: O(n)
    static func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        var postorder = postorder
        return buildTree(inorder, &postorder)
    }
    
    private static func buildTree(_ inorder: [Int], _ postorder: inout [Int]) -> TreeNode? {
        guard !postorder.isEmpty, !inorder.isEmpty else {
            return nil
        }
        
        let rootVal = postorder.removeLast()
        let root = TreeNode(rootVal)
        
        var inorderIndex = 0 //will be used to split the inorder array into left and right values around the root
        for (index, val) in inorder.enumerated() where val == rootVal {
            inorderIndex = index
            break
        }
        
        // as postorder is being used as a guide, we must build the right branch first
        if (inorderIndex + 1) < inorder.count {
            let inorder = Array(inorder[(inorderIndex + 1)...])
            root.right = buildTree(inorder, &postorder)
        }
        
        if inorderIndex > 0 {
            let inorder = Array(inorder[0..<inorderIndex])
            root.left = buildTree(inorder, &postorder)
        }
        
        return root
    }
}
