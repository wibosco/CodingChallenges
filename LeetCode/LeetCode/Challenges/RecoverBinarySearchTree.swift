//
//  RecoverBinarySearchTree.swift
//  LeetCode
//
//  Created by William Boles on 23/01/2022.
//  Copyright © 2022 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/recover-binary-search-tree/
struct RecoverBinarySearchTree {
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(n) where n is the number of nodes in the tree stored in `inorder` array
    //binary tree
    //binary search tree
    //array
    //DFS
    //in-order
    //
    //Solution Description:
    //Performing an inorder traversal of a binary search tree should result in an array of ordered/sorted nodes. We can use
    //this property to find which nodes are out-of-order in our tree and switch them. There are two possible scenarios for
    //out-of-order nodes:
    //
    //1. Adjacent nodes
    //2. Distant nodes
    //
    //To handle both these scenarios we set both the first and second nodes to be `i` and `i + 1` the first time we encounter
    //an out-of-order node. We then continue searching to see if the array has another out-of-order node. If it does we know
    //that the originally set second node isn't right and we instead set to this new out-of-order node i.e. we are in the
    //distant node scenario; if it doesn't then we are in the adjacent node scenario. Instead of having to actually switch the
    //nodes which would involve breaking their existing left and right connections we can instead merely change the `val` of
    //each node to the opposite nodes `val`.
    //
    //IMPORTANT NOTE: carefully read any data structure you are given as the `TreeNode` had it's `val` property as `var` -
    //hinting at updating `val` value rather than truly swapping the nodes (connections and all)
    static func recoverTree(_ root: BinaryTreeNode?) {
        var inorder = [BinaryTreeNode]()
        dfs(root, &inorder)
        
        var first: BinaryTreeNode?
        var second: BinaryTreeNode?
        
        for i in 0..<(inorder.count - 1) {
            if inorder[i].val > inorder[(i + 1)].val {
                second = inorder[(i + 1)]
                if first == nil {
                    first = inorder[i]
                } else {
                    break //second time we have encountered an out-of-order node i.e. distant nodes scenario
                }
            }
        }
        
        guard let f = first, let s = second else {
            return
        }
        
        let tmp = f.val
        f.val = s.val
        s.val = tmp
    }
    
    private static func dfs(_ node: BinaryTreeNode?, _ inorder: inout [BinaryTreeNode]) {
        guard let node = node else {
            return
        }
        
        dfs(node.left, &inorder)
        inorder.append(node)
        dfs(node.right, &inorder)
    }
}
