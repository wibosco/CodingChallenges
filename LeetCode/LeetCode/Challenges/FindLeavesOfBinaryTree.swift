//
//  FindLeavesOfBinaryTree.swift
//  LeetCode
//
//  Created by William Boles on 05/08/2022.
//

import Foundation

//https://leetcode.com/problems/find-leaves-of-binary-tree/
//binary tree
struct FindLeavesOfBinaryTree {
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(h) where h is the height of the tree
    //DFS
    //recursive
    //stack
    //
    //Solution Description:
    //Uses DFS we traverse the tree until we reach the end of each branch, as we recursively return back up the tree we use the
    //max height of the child nodes at each level to determine what height the current node is at. Using this `height` value we
    //then place the current node into `leaves` at the correct location. By using the height that a node appears at we ensure
    //that all leaf nodes are treated as equal regardless of how deep they are or the order in which we got to them. Once that
    //node has been placed in `leaves` we add 1 to the height and continue back up the recursive call stack
    //
    //Tree height vs depth:
    //
    //The depth of a node is the number of edges from the node to the tree's root node - a root node will have a depth of 0.
    //
    //The height of a node is the number of edges on the longest path from the node to a leaf - a leaf node will have a height
    //of 0.
    static func findLeaves(_ root: BinaryTreeNode?) -> [[Int]] {
        var leaves = [[Int]]()
        
        dfs(root, &leaves)
        
        return leaves
    }
    
    @discardableResult
    private static func dfs(_ node: BinaryTreeNode?, _ leaves: inout [[Int]]) -> Int {
        guard let node = node else {
            return 0
        }
        
        let leftHeight = dfs(node.left, &leaves)
        let rightHeight = dfs(node.right, &leaves)
        
        let currentHeight = max(leftHeight, rightHeight)
        
        if currentHeight == leaves.count {
            leaves.append([])
        }
        
        leaves[currentHeight].append(node.val)
        
        return currentHeight + 1
    }
}
