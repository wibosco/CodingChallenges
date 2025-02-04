//
//  DistributeCoinsInBinaryTree.swift
//  LeetCode
//
//  Created by William Boles on 16/11/2023.
//

import Foundation

//https://leetcode.com/problems/distribute-coins-in-binary-tree/
struct DistributeCoinsInBinaryTree {
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(h) where h is the height of the tree
    //binary tree
    //DFS
    //recursive
    //bottom-up
    //inout
    //
    //Solution Description:
    //Every node needs to end up with 1 coin, at the root we don't know how many coins to distribute or receive from the child
    //branches. Instead we need to start at the leaf nodes and work our way towards the root. Using DFS we traverse to each
    //root node and then in the leaf nodes parent we determine how many coins needs to move from parent->child or child->parent
    //for the child to end up with 1 coin - this might result in the parent getting into "debt" in the short-term. We don't
    //care which way the transaction happens we just care about the number of coin movements so when tracking the coin
    //movements we do so as an absolute value. We repeat this process for both left and right child of every node until we
    //have visited and adjusted each node.
    func distributeCoins(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        
        var moved = 0
        
        dfs(root, &moved)
        
        return moved
    }
    
    private func dfs(_ node: TreeNode, _ moved: inout Int) {
        if let left = node.left {
            dfs(left, &moved)
            
            var toMove = 0
            if left.val != 1 {
                toMove = left.val - 1 //left.val is either negative or 0
            }
            
            node.val += toMove
            
            moved += abs(toMove)
        }
        
        if let right = node.right {
            dfs(right, &moved)
            
            var toMove = 0
            if right.val != 1 {
                toMove = right.val - 1 //right.val is either negative or 0
            }
            
            node.val += toMove
            
            moved += abs(toMove)
        }
    }
}
