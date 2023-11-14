//
//  PathSumIII.swift
//  LeetCode
//
//  Created by William Boles on 14/11/2023.
//

import Foundation

//https://leetcode.com/problems/path-sum-iii/
struct PathSumIII {
    
    //Time: O(n^2) where n is the number of nodes in the tree.
    //Space: O(n)
    //binary tree
    //DFS
    //recursive
    //in-order
    //inout
    //
    //Solution Description:
    //First we do in inorder traversal of the tree to get all nodes in the tree. Then we do a DFS where we search the subtree of
    //each node and calculate if any path(s) on that subtree is equal to `targetSum`, if so we increment `pathsFound`. Once all
    //nodes have been searched as root, we return `pathsFound`.
    static func pathSum(_ root: TreeNode?, _ targetSum: Int) -> Int {
        var nodes = [TreeNode]()
        inorder(root, &nodes)
        
        var pathsFound = 0
        for node in nodes {
            dfs(node, targetSum, 0, &pathsFound)
        }
        
        return pathsFound
    }
    
    private static func inorder(_ node: TreeNode?, _ nodes: inout [TreeNode]) {
        guard let node = node else {
            return
        }
        
        inorder(node.left, &nodes)
        nodes.append(node)
        inorder(node.right, &nodes)
    }
    
    private static func dfs(_ node: TreeNode?, _ targetSum: Int, _ currentSum: Int, _ pathsFound: inout Int) {
        guard let node = node else {
            return
        }
        
        let newCurrentSum = currentSum + node.val
        
        if newCurrentSum == targetSum {
            pathsFound += 1
        }
        
        dfs(node.left, targetSum, newCurrentSum, &pathsFound)
        dfs(node.right, targetSum, newCurrentSum, &pathsFound)
    }
}
