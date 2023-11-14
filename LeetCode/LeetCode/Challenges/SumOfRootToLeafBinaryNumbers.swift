//
//  SumOfRootToLeafBinaryNumbers.swift
//  LeetCode
//
//  Created by William Boles on 10/11/2023.
//

import Foundation

//https://leetcode.com/problems/sum-of-root-to-leaf-binary-numbers/
struct SumOfRootToLeafBinaryNumbers {
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(n)
    //binary tree
    //DFS
    //recursive
    //bit shifting
    //bit manipulation
    //
    //Solution Description:
    //Using DFS we gradually build up the value of the nodes as we descend each level. Once we get to the leaf nodes we 
    //return the completed value. As the call stack unwinds we sum the values of the left and right child together and pass
    //that summed value up to the next level. We repeat this process until all we are back at the root at which point we
    //that final summed value.
    static func sumRootToLeaf(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        
        return dfs(root, 0)
    }
    
    private static func dfs(_ node: TreeNode, _ value: Int) -> Int {
        let nextValue = value << 1 + node.val //bit shift
        
        if node.left == nil && node.right == nil { //leaf node
            return nextValue
        }
        
        var leftValue = 0
        if let left = node.left {
            leftValue = dfs(left, nextValue)
        }
        
        var rightValue = 0
        if let right = node.right {
            rightValue = dfs(right, nextValue)
        }
        
        return leftValue + rightValue
    }
}
