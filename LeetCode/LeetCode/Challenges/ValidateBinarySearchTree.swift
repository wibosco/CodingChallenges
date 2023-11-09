//
//  ValidateBinarySearchTree.swift
//  LeetCode
//
//  Created by William Boles on 22/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/validate-binary-search-tree/
struct ValidateBinarySearchTree {
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(n) - stack calls
    //binary search tree
    //pre-order
    //recursive
    //DFS
    //
    //Solution Description:
    //In order for a BST to be valid, all nodes on the right of a particular node need to be greater (not just it's
    //immediate right but the tree to its right) and all nodes on the left are less than (not just it's immediate left
    //but the tree to its left). So to validate a BST we can't just compare a root node with its left and right nodes
    //instead we need to also compare it with its predecessors value as well.
    static func isValidBST(_ root: BinaryTreeNode?) -> Bool {
        guard let root = root else {
            return true
        }
        
        return preOrder(root, Int.min, Int.max)
    }
    
    private static func preOrder(_ node: BinaryTreeNode?, _ lower: Int, _ upper: Int) -> Bool {
        guard let node = node else {
            return true
        }
        
        guard node.val > lower && node.val < upper else {
            return false
        }
        
        return preOrder(node.left, lower, node.val) && preOrder(node.right, node.val, upper) //both need to be valid
    }
    
    //Time: O(n) where n is the number of nodes in the tree (actually O(2n))
    //Space: O(n) actually O(2n) - stack calls and visited array
    //binary search tree
    //in-order
    //sorted
    //recursive
    //DFS
    //
    //Solution Description:
    //A binary search tree follows the principle that nodes to the left of root are less and nodes to the right are greater.
    //This property means that an in-order traversal of a binary tree should result in an ascending sorted array of that
    //trees nodes if it is a binary search tree. So we perform an in-order traversal of this tree and check if it's nodes
    //are in ascending order
    static func isValidBSTOrder(_ root: BinaryTreeNode?) -> Bool {
        guard let root = root else {
            return true
        }
        
        var visited = [Int]()
        
        inOrder(root, &visited) //Time: O(n)
        
        for i in 0..<(visited.count - 1) {
            if visited[i] >= visited[(i + 1)] {
                return false
            }
        }
    
        return true
    }
    
    private static func inOrder(_ node: BinaryTreeNode?, _ visited: inout [Int]) {
        guard let node = node else {
            return
        }
        
        inOrder(node.left, &visited)
        visited.append(node.val)
        inOrder(node.right, &visited)
    }
}
