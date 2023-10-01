//
//  ConstructBinaryTreeInorderPostorderTraversal.swift
//  LeetCode
//
//  Created by William Boles on 24/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/construct-binary-tree-from-inorder-and-postorder-traversal/
struct ConstructBinaryTreeInorderPostorderTraversal {
    //postorder = left, right, root
    //inorder = left, root, right
    
    //Time: O(n)
    //Space: O(n)
    //pointers
    //binary tree
    //divide and conquer
    //DFS
    //array
    static func buildTree(_ inorder: [Int], _ postorder: [Int]) -> BinaryTreeNode? {
        var postorderIndex = (postorder.count - 1) //postorder so we go from end to start
        
        var inorderMapping = [Int: Int]() //to speed up retrieve of root from inorder array
        for (index, val) in inorder.enumerated() {
            inorderMapping[val] = index
        }
    
        return buildTree(inorderMapping, 0, (inorder.count - 1), postorder, &postorderIndex)
    }
    
    private static func buildTree(_ inorderMapping: [Int: Int], _ inorderStart: Int, _ inorderEnd: Int, _ postorder: [Int], _ postorderIndex: inout Int) -> BinaryTreeNode? {
        guard inorderEnd >= inorderStart else {
            return nil
        }
    
        let rootVal = postorder[postorderIndex]
        let root = BinaryTreeNode(rootVal)
        postorderIndex -= 1 //postorder so we go from end to start
        
        if inorderEnd == inorderStart { //there are no left or right subtrees
            return root
        }
        
        //this index will be used to split the inorder array into left and right subtrees
        let inorderRootIndex = inorderMapping[rootVal]!
        
        // as postorder is being used as a guide, we must build the right branch first
        root.right = buildTree(inorderMapping, (inorderRootIndex + 1), inorderEnd, postorder, &postorderIndex)
        root.left = buildTree(inorderMapping, inorderStart, (inorderRootIndex - 1), postorder, &postorderIndex)
        
        return root
    }
    
    //Time: O(n)
    //Space: O(n)
    //removal
    //binary tree
    //divide and conquer
    //DFS
    //array
    static func buildTreeRemoval(_ inorder: [Int], _ postorder: [Int]) -> BinaryTreeNode? {
        var postorder = postorder
        return buildTreeRemoval(inorder, &postorder)
    }
    
    private static func buildTreeRemoval(_ inorder: [Int], _ postorder: inout [Int]) -> BinaryTreeNode? {
        guard !postorder.isEmpty, !inorder.isEmpty else {
            return nil
        }
        
        let rootVal = postorder.removeLast()
        let root = BinaryTreeNode(rootVal)
        
        var inorderIndex = 0 //will be used to split the inorder array into left and right values around the root
        for (index, val) in inorder.enumerated() where val == rootVal {
            inorderIndex = index
            break
        }
        
        // as postorder is being used as a guide, we must build the right branch first
        if (inorderIndex + 1) < inorder.count {
            let inorder = Array(inorder[(inorderIndex + 1)...])
            root.right = buildTreeRemoval(inorder, &postorder)
        }
        
        if inorderIndex > 0 {
            let inorder = Array(inorder[0..<inorderIndex])
            root.left = buildTreeRemoval(inorder, &postorder)
        }
        
        return root
    }
}
