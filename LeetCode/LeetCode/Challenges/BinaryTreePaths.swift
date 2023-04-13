//
//  BinaryTreePaths.swift
//  LeetCode
//
//  Created by William Boles on 31/03/2023.
//

import Foundation

//https://leetcode.com/problems/binary-tree-paths/
//binary tree
struct BinaryTreePaths {
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(d) where d is the depth of the tree
    //DFS
    //recursive
    //backtracking
    //
    //Solution Description:
    //Using DFS, we recursively traverse the tree adding the current (non-nil) node to the `path` array. If the current
    //node is a leaf node we combine the `path` elements into a string and add that combined value to `paths`; if the
    //node has child nodes we traverse those nodes. Once all child nodes have been explored we remove the current node
    //from `paths`.
    //
    //N.B. A node is only considered a leaf node if it has no children nodes - a node with only one child is not a leaf
    //node.
    static func binaryTreePaths(_ root: BinaryTreeNode?) -> [String] {
        guard let root = root else {
            return []
        }
        
        var paths = [String]()
        var path = [String]()
            
        dfs(root, &path, &paths)
        
        return paths
    }
    
    private static func dfs(_ node: BinaryTreeNode?, _ path: inout [String], _ paths: inout [String]) {
        guard let node = node else {
            return
        }
        
        path.append("\(node.val)")
        
        if node.left == nil && node.right == nil { //goal
            //found leaf node
            let strPath = path.joined(separator: "->")
            paths.append(strPath)
        } else {
            dfs(node.left, &path, &paths)
            dfs(node.right, &path, &paths)
        }
        
        path.removeLast() //backtrack
    }
}
