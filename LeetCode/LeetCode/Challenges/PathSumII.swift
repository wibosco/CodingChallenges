//
//  PathSumII.swift
//  LeetCode
//
//  Created by William Boles on 13/11/2023.
//

import Foundation

//https://leetcode.com/problems/path-sum-ii/
struct PathSumII {
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(n)
    //binary tree
    //DFS
    //recursive
    //backtracking
    //inout
    //
    //Solution Description:
    //Using DFS we traverse the tree, subtracting the value of the current node from `targetSum` and keeping track of the
    //path of nodes that got as to that node. Once we get to a leaf node we check if `targetSum` is 0, meaning that the
    //same of the path to that leaf node is equal to `targetSum` then we add the `path` to our overall `paths` array. As
    //we unwind the recursive stack we remove the current node from `path` so that `path` can be reused with another path.
    static func pathSum(_ root: BinaryTreeNode?, _ targetSum: Int) -> [[Int]] {
        var path = [Int]()
        var paths = [[Int]]()
        
        dfs(root, targetSum, &path, &paths)
        
        return paths
    }
    
    private static func dfs(_ node: BinaryTreeNode?, _ targetSum: Int, _ path: inout [Int], _ paths: inout [[Int]]) {
        guard let node = node else {
            return
        }
        
        let newTarget = targetSum - node.val
        path.append(node.val)
        
        if node.left == nil && node.right == nil {
            if newTarget == 0 {
                paths.append(path)
            }
        }
        
        dfs(node.left, newTarget, &path, &paths)
        dfs(node.right, newTarget, &path, &paths)
        
        path.removeLast() //backtracking
    }
}
