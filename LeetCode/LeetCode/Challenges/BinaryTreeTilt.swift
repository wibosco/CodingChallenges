//
//  BinaryTreeTilt.swift
//  LeetCode
//
//  Created by William Boles on 10/11/2023.
//

import Foundation

//https://leetcode.com/problems/binary-tree-tilt/
struct BinaryTreeTilt {
    
    //Time: O(
    //Space: O(
    //binary tree
    //DFS
    //recursive
    //inout
    //
    //Solution Description:
    //Using DFS we calculate the left and right child sum for each node in the tree using a bottom-up approach. Once we
    //the left and right sum we can calculate the tilt for the current node and add that tilt to our `totalTilt` sum.
    func findTilt(_ root: TreeNode?) -> Int {
        var totalTilt = 0
        _ = dfs(root, &totalTilt)
        
        return totalTilt
    }
    
    private func dfs(_ node: TreeNode?, _ totalTilt: inout Int) -> Int {
        guard let node = node else {
            return 0
        }
        
        let sumLeft = dfs(node.left, &totalTilt)
        let sumRight = dfs(node.right, &totalTilt)
        
        //no need to store the tilt for each individual node, just calculate and add to total so we only need one pass
        let tilt = abs(sumLeft - sumRight)
        totalTilt += tilt
        
        return sumLeft + sumRight  + node.val //add current nodes value for next node up
    }
}
