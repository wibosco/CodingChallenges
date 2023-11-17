//
//  LongestUnivaluePath.swift
//  LeetCode
//
//  Created by William Boles on 17/11/2023.
//

import Foundation

//https://leetcode.com/problems/longest-univalue-path/
struct LongestUnivaluePath {
    
    //Time: O(n) where n is the number of nodes on the tree
    //Space: O(h) where h is the height of the tree
    //binary tree
    //DFS
    //recursive
    //bottom-up
    //greedy
    //inout
    //
    //Solution Description:
    //It's important to understand that we are finding the longest univalue path not longest univalue subtree so if a
    //path forks then it's now two paths not the same path. With this mind when we encounter a node that has two
    //childern that share it's value we need to treat that parent node in two ways:
    //
    //1. As the root of the path that joins there length
    //2. As a continuation in the path of one of the two child paths.
    //
    //As a root node we sum the length of the two paths to get the total length of that combined path - note that this
    //path is now "complete". As a continuation node we node we take the longest of the two child paths and add the
    //parent node to it - it's this continuation length that we pass up to this nodes parent to continue the process.
    //So using a bottom-up DFS approach we compare the value of the parent against that of its childern values and track
    //the length of the univalue path. We track the longest univalue path that we have encountered so far in `longest.`
    //The current univalue length based on that nodes value is passed up as the recursive stack unwinds for the process
    //to be repeated. Eventually we return to the root node and so can return `longest`.
    static func longestUnivaluePath(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        
        var longest = 0
        
        _ = dfs(root, &longest)
        
        return longest - 1 //-1 because we return the edges not the nodes in the sequence
    }
    
    private static func dfs(_ node: TreeNode?, _ longest: inout Int) -> Int {
        guard let node = node else { //basecase
            return 0
        }
        
        let leftContinuationLength = dfs(node.left, &longest)
        let rightContinuationLength = dfs(node.right, &longest)
        
        var asRootLength = 1 //treat node as the root of this tree
        var asContinuationLength = 0 //treat node as non-root of this tree
        
        if let left = node.left {
            if left.val == node.val {
                asRootLength += leftContinuationLength
                asContinuationLength = max(asContinuationLength, leftContinuationLength)
            }
        }
        
        if let right = node.right {
            if right.val == node.val {
                asRootLength += rightContinuationLength
                asContinuationLength = max(asContinuationLength, rightContinuationLength)
            }
        }
        
        longest = max(longest, asRootLength) //asRootLength >= asContinuationLength
        
        return asContinuationLength + 1
    }
}
