//
//  FlattenBinaryTreeToLinkedList.swift
//  CodingChallenges
//
//  Created by William Boles on 08/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/flatten-binary-tree-to-linked-list/
//binary tree
//linked list
struct FlattenBinaryTreeToLinkedList {

    //Time: O(n) where n is the number of nodes
    //Space: O(n) where n is the number of nodes
    //array
    //DFS
    //
    //Solution Description:
    //Using dfs perform a preorder traversal of the tree adding the nodes that
    //we come across to an array. After the array is populated we iterate
    //through, setting the current nodes right node to the next node in the
    //array. We also remove any existing left and right associations
    static func flatten(_ root: BinaryTreeNode?) {
        guard let root = root else {
            return
        }
        
        var ordering = [BinaryTreeNode]()
        dfs(root, &ordering)
        
        for i in 0..<(ordering.count - 1) {
            let curr = ordering[i]
            let next = ordering[(i + 1)]
            
            curr.left = nil
            curr.right = next
            
            next.right = nil
            next.left = nil
        }
    }
    
    private static func dfs(_ root: BinaryTreeNode?, _ ordering: inout [BinaryTreeNode]) {
        guard let root = root else {
            return
        }
        
        ordering.append(root)
        dfs(root.left, &ordering)
        dfs(root.right, &ordering)
    }
}
