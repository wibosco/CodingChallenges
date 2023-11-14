//
//  RootEqualsSumOfChildren.swift
//  LeetCode
//
//  Created by William Boles on 09/11/2023.
//

import Foundation

//https://leetcode.com/problems/root-equals-sum-of-children/
struct RootEqualsSumOfChildren {
    
    //Time: O(1)
    //Space: O(1)
    //binary tree
    //
    //Solution Description:
    //We sum the `root` node's left and right child nodes and compare that value against the value of root.
    static func checkTree(_ root: TreeNode?) -> Bool {
        guard let root = root, let left = root.left, let right = root.right else {
            return false
        }
        
        return root.val == (left.val + right.val)
    }
}
