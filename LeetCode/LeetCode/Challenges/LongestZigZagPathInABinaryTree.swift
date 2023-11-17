//
//  LongestZigZagPathInABinaryTree.swift
//  LeetCode
//
//  Created by William Boles on 17/11/2023.
//

import Foundation

//https://leetcode.com/problems/longest-zigzag-path-in-a-binary-tree/
struct LongestZigZagPathInABinaryTree {
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(h) where h is the height of tree
    //bianry tree
    //DFS
    //recursive
    //top-down
    //inout
    //
    //Solution Description:
    //Using top-down DFS we traverse the tree taking the left and right child paths (if they exist) at each node regardless of if
    //doing so repeats the direction that got us to that node. Where a direction change has been made we increment `count` and
    //where the same direction is taken we reset count. This ensures that we test all unique zig-zag paths in the tree in the same
    //traversal. At each node we check if this path is the longest yet and if so we assign it to `maxCount`. Once all nodes in the
    //tree have been visited we are able to return `maxCount` as the result.
    static func longestZigZag(_ root: TreeNode?) -> Int {
        var maxCount = 0
        
        dfs(root?.left, true, 1, &maxCount)
        dfs(root?.right, false, 1, &maxCount)
        
        return maxCount
    }
    
    private static func dfs(_ node: TreeNode?, _ fromLeft: Bool, _ count: Int, _ maxCount: inout Int) {
        guard let node = node else {
            return
        }
        
        maxCount = max(maxCount, count)
        
        if fromLeft {
            dfs(node.left, true, 1, &maxCount) //going same direction as previous
            dfs(node.right, false, (count + 1), &maxCount)
        } else {
            dfs(node.left, true, (count + 1), &maxCount)
            dfs(node.right, false, 1, &maxCount) //going same direction as previous
        }
    }
}
