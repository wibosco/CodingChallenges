//
//  DiameterOfBinaryTree.swift
//  CodingChallenges
//
//  Created by William Boles on 09/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/diameter-of-binary-tree/
//binary tree
struct DiameterOfBinaryTree {
    
    //Time: O(
    //Space: O(
    //DFS
    //bottom-up
    //
    //Solution Description:
    //Remembering that a tree is made up of smaller trees we use DFS to traverse to the end of each branch of those
    //trees. As the traversal calls returns we sum the left and right depth of that particular tree and compare it
    //against the deepest diameter that we current have. Eventually we get back to the root where we stop.
    //
    //See https://leetcode.com/problems/maximum-depth-of-binary-tree/ for details
    //on how to calculate the depth of a tree
    static func diameterOfBinaryTree(_ root: BinaryTreeNode?) -> Int {
        var longestDiameter = 0
        longestPath(root, &longestDiameter)
        return longestDiameter
    }

    @discardableResult
    private static func longestPath(_ root: BinaryTreeNode?, _ longestDiameter: inout Int) -> Int {
        guard let root = root else { //base when we go beyond a leaf
            return 0
        }

        let leftDepth = longestPath(root.left, &longestDiameter)
        let rightDepth = longestPath(root.right, &longestDiameter)

        let diameterFromCurrentNode = leftDepth + rightDepth

        longestDiameter = max(longestDiameter, diameterFromCurrentNode)

        return max(leftDepth, rightDepth) + 1 // we add 1 for the current level
    }
}

