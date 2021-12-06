//
//  ConstructBinaryTreePreorderInorderTraversal.swift
//  CodingChallenges
//
//  Created by William Boles on 24/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/
//binary tree
//divide and conquer
//DFS
//array
struct ConstructBinaryTreePreorderInorderTraversal {
    //preorder = root, left, right
    //inorder = left, root, right
    
    //Time: O(n)
    //Space: O(n)
    //pointers
    static func buildTree(_ preorder: [Int], _ inorder: [Int]) -> BinaryTreeNode? {
        var preorderIndex = 0 //preorder so we go from start to end
        
        var inorderMapping = [Int: Int]() //to speed up retrieve of root from inorder array
        for (index, val) in inorder.enumerated() {
            inorderMapping[val] = index
        }
        
        return buildTree(preorder, &preorderIndex, inorderMapping, 0, (inorder.count - 1))
    }
    
    private static func buildTree(_ preorder: [Int], _ preorderIndex: inout Int, _ inorderMapping: [Int: Int], _ inorderStart: Int, _ inorderEnd: Int) -> BinaryTreeNode? {
        guard inorderEnd >= inorderStart else { //are we working inside the range of inorder elements
            return nil
        }
        
        let rootVal = preorder[preorderIndex]
        let root = BinaryTreeNode(rootVal)
        preorderIndex += 1 //preorder so we go from start to end
        
        if inorderEnd == inorderStart { //there are no left or right subtrees
            return root
        }
        
        let inorderRootIndex = inorderMapping[rootVal]! //this index will be used to split the inorder array into left and right subtrees
        
        // as preorder is being used as a guide, we must build the left branch first
        root.left = buildTree(preorder, &preorderIndex, inorderMapping, inorderStart, (inorderRootIndex - 1))
        root.right = buildTree(preorder, &preorderIndex, inorderMapping, (inorderRootIndex + 1), inorderEnd)
        
        return root
    }
    
    // MARK: -
    
    //Time: O(n)
    //Space: O(n)
    //removal
    static func buildTreeRemoval(_ preorder: [Int], _ inorder: [Int]) -> BinaryTreeNode? {
        var preorder = preorder
        return buildTreeRemoval(&preorder, inorder)
    }

    private static func buildTreeRemoval(_ preorder: inout [Int], _ inorder: [Int]) -> BinaryTreeNode? {
        guard !preorder.isEmpty, !inorder.isEmpty else {
            return nil
        }

        let rootVal = preorder.removeFirst() //O(n)
        let root = BinaryTreeNode(rootVal)

        var inorderIndex = 0
        for (index, val) in inorder.enumerated() where val == rootVal {
            inorderIndex = index
            break
        }

        if inorderIndex > 0 {
            let inorder = Array(inorder[0..<inorderIndex])
            root.left = buildTreeRemoval(&preorder, inorder)
        }

        if (inorderIndex + 1) < inorder.count {
            let inorder = Array(inorder[(inorderIndex + 1)...])
            root.right = buildTreeRemoval(&preorder, inorder)
        }

        return root
    }
}
