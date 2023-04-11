//
//  DiameterOfBinaryTree.swift
//  LeetCode
//
//  Created by William Boles on 09/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/diameter-of-binary-tree/
//binary tree
struct DiameterOfBinaryTree {
    
    //Time: O(n) `n` is the number of nodes in the tree
    //Space: O(1)
    //DFS
    //bottom-up
    //recursive
    //
    //Solution Description:
    //Remembering that a tree is made up of smaller trees we use DFS to traverse to the end of each branch of those
    //trees. As the traversal calls returns we sum the left and right depth of that particular tree and compare it
    //against the deepest diameter that we currently have. Eventually we get back to the root where we stop.
    //
    //See: https://leetcode.com/problems/maximum-depth-of-binary-tree/ for details on how to calculate the depth of
    //a tree
    static func diameterOfBinaryTree(_ root: BinaryTreeNode?) -> Int {
        var longestDiameter = 0
        height(root, &longestDiameter)
        return longestDiameter
    }

    @discardableResult
    private static func height(_ root: BinaryTreeNode?, _ longestDiameter: inout Int) -> Int {
        guard let root = root else { //base when we go beyond a leaf
            return 0
        }

        let leftHeight = height(root.left, &longestDiameter)
        let rightHeight = height(root.right, &longestDiameter)

        let diameterFromCurrentNode = leftHeight + rightHeight

        longestDiameter = max(longestDiameter, diameterFromCurrentNode)

        //only interested in the longest branch here
        //we add 1 for the current level
        return max(leftHeight, rightHeight) + 1
    }
}
