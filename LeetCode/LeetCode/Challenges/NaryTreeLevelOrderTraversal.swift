//
//  N-aryTreeLevelOrderTraversal.swift
//  LeetCode
//
//  Created by William Boles on 06/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/n-ary-tree-level-order-traversal/
struct NaryTreeLevelOrderTraversal { //N-aryTreeLevelOrderTraversal
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(n) where n is the number of nodes in the tree
    //graph theory
    //BFS
    //
    //Solution Description:
    //Traverse the tree using BFS, storing the nodes at each level in an array before adding them to a tree wide levels array.
    //
    //NB: As this is an N-ary tree rather than a binary tree, the BFS contains 3 loops rather than 2. The extra loop is to
    //work through the neighbors of a nodes - don't confuse this with the actual level traversal loop which is the second loop.
    func levelOrder(_ root: NaryTreeNode?) -> [[Int]] {
        guard let root = root else {
            return [[Int]]()
        }
        
        var queue = [root]
        var levels = [[root.val]]
        
        while !queue.isEmpty {
            var level = [Int]()
            var newQueueItems = [NaryTreeNode]()
            
            for node in queue {
                for child in node.children {
                    level.append(child.val)
                    newQueueItems.append(child)
                }
            }
            
            queue = newQueueItems
            
            if !level.isEmpty {
                levels.append(level)
            }
        }
        
        return levels
    }
}
