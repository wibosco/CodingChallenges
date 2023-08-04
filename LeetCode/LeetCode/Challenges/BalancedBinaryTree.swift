//
//  BalancedBinaryTree.swift
//  LeetCode
//
//  Created by William Boles on 08/05/2023.
//

import Foundation

//https://leetcode.com/problems/balanced-binary-tree/
struct BalancedBinaryTree {
    
    //Time: O(n) where n is the number of noes in the tree
    //Space: O(h) where h is the height of the tree
    //binary tree
    //DFS
    //recursive
    //
    //Solution Description:
    //Using DFS we traverse to the leaf nodes of the tree and then moving up the tree determine the height of each node. We then
    //compare the height of the `left` and `right` nodes of a node/root to determine if that node/root is balanced which we
    //define as "a difference in height of nodes of no more than 1".  If the height of the child nodes differ by more than 1
    //then we know the tree is unbalanced and we return -1; if the hight difference is 1 or 0 we take the max height and add 1
    //to it and return that increased height as the node/root height. We repeat this process until we reach the root of the tree
    //or have -1 returned.
    static func isBalanced(_ root: BinaryTreeNode?) -> Bool {
        let balanced = dfs(root)
        
        return balanced != -1
    }
    
    private static func dfs(_ node: BinaryTreeNode?) -> Int {
        guard let node = node else {
            return 0
        }
        
        let leftHeight = dfs(node.left)
        let rightHeight = dfs(node.right)
        
        guard leftHeight != -1, rightHeight != -1 else {
            return -1
        }
        
        guard abs(leftHeight - rightHeight) < 2 else {
            return -1
        }
        
        return (max(leftHeight, rightHeight) + 1)
    }
}
