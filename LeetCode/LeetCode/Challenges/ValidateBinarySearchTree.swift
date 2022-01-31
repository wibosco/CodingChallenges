//
//  ValidateBinarySearchTree.swift
//  CodingChallenges
//
//  Created by William Boles on 22/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/validate-binary-search-tree/
//binary search tree
struct ValidateBinarySearchTree {
    
    //Time: O(n)
    //Space: O(n) - stack calls
    //pre-order
    //
    //Solution Description:
    //
    static func isValidBST(_ root: BinaryTreeNode?) -> Bool {
        guard let root = root else {
            return true
        }
        
        return preOrder(root, Int.min, Int.max)
    }
    
    private static func preOrder(_ n: BinaryTreeNode?, _ lower: Int, _ upper: Int) -> Bool {
        guard let n = n else {
            return true
        }
        
        guard n.val > lower && n.val < upper else {
            return false
        }
        
        return preOrder(n.left, lower, n.val) && preOrder(n.right, n.val, upper) //both need to be valid
    }
    
    //Time: O(n), actually O(2n)
    //Space: O(n), actually O(2n) - stack calls and visited array
    //in-order
    //sorted
    //
    //Solution Description:
    //A binary search tree follows the princple that nodes to the left of root are less and nodes to the right are greater.
    //This property means that an in-order traversal of a binary tree should result in an ascending sorted array of that
    //trees nodes if it is a binary search tree. So we perform an in-order traversal of this tree and check if it's nodes
    //are in ascending order
    static func isValidBSTOrder(_ root: BinaryTreeNode?) -> Bool {
        guard let root = root else {
            return true
        }
        
        var visited = [Int]()
        
        inOrder(n: root, visited: &visited) //Time: O(n)
        
        for i in 0..<(visited.count - 1) {
            if visited[i] > visited[(i + 1)] {
                return false
            }
        }
    
        return true
    }
    
    private static func inOrder(n: BinaryTreeNode?, visited: inout [Int]) {
        guard let n = n else {
            return
        }
        
        inOrder(n: n.left, visited: &visited)
        visited.append(n.val)
        inOrder(n: n.right, visited: &visited)
    }
}
