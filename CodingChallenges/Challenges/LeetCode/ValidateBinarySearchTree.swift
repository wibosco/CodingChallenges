//
//  ValidateBinarySearchTree.swift
//  CodingChallenges
//
//  Created by William Boles on 22/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/validate-binary-search-tree/
//bst
struct ValidateBinarySearchTree {
    
    //Time: O(n)
    //Space: O(n) - stack calls
    //pre-order
    static func isValidBST(_ root: TreeNode?) -> Bool {
        guard let root = root else {
            return true
        }
        
        return preOrderValidate(n: root, lower: Int.min, upper: Int.max)
    }
    
    private static func preOrderValidate(n: TreeNode?, lower: Int?, upper: Int?) -> Bool {
        guard let n = n, let lower = lower, let upper = upper else {
            return true
        }
        
        guard n.val > lower && n.val < upper else {
            return false
        }
        
        return preOrderValidate(n: n.left, lower: lower, upper: n.val) &&
            preOrderValidate(n: n.right, lower: n.val, upper: upper) //both need to be valid
    }
    
    //Time: O(n), actually O(2n)
    //Space: O(n), actually O(2n) - stack calls and visited array
    //in-order
    static func isValidBSTOrder(_ root: TreeNode?) -> Bool {
        guard let root = root else {
            return true
        }
        
        var visited = [Int]()
        inOrder(n: root, visited: &visited) //Time: O(n)
        
        var i = 1
        while i < visited.count { //Time: O(n)
            let v = visited[i]
            let pre = visited[(i - 1)]
            if v <= pre {
                return false
            }
            
            i += 1
        }
        
        return true
    }
    
    private static func inOrder(n: TreeNode?, visited: inout [Int]) {
        guard let n = n else {
            return
        }
        
        inOrder(n: n.left, visited: &visited)
        visited.append(n.val)
        inOrder(n: n.right, visited: &visited)
    }
}
