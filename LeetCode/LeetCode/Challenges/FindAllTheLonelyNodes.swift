//
//  FindAllTheLonelyNodes.swift
//  LeetCode
//
//  Created by William Boles on 20/11/2023.
//

import Foundation

//https://leetcode.com/problems/find-all-the-lonely-nodes/
struct FindAllTheLonelyNodes {
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(h) where h is the height of the tree
    //binary tree
    //DFS
    //recursive
    //top-down
    //inout
    //
    //Solution Description:
    //Using DFS we visit each node in the tree and check if that node only has one child, if so we add that child node to
    //`lonelyNodes` else we skip over it.
    static func getLonelyNodes(_ root: TreeNode?) -> [Int] {
        var lonelyNodes = [Int]()
        
        dfs(root, &lonelyNodes)
        
        return lonelyNodes
    }
    
    private static func dfs(_ node: TreeNode?, _ lonelyNodes: inout [Int]) {
        guard let node = node else {
            return
        }
        
        if node.left != nil && node.right == nil {
            lonelyNodes.append(node.left!.val)
        } else if node.left == nil && node.right != nil {
            lonelyNodes.append(node.right!.val)
        }
        
        dfs(node.left, &lonelyNodes)
        dfs(node.right, &lonelyNodes)
    }
}
