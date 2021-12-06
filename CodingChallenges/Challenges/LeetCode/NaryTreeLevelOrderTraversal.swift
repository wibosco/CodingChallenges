//
//  N-aryTreeLevelOrderTraversal.swift
//  CodingChallenges
//
//  Created by William Boles on 06/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/n-ary-tree-level-order-traversal/
//graph theory
struct NaryTreeLevelOrderTraversal { //N-aryTreeLevelOrderTraversal
    
    //Time: O(
    //Space: O(
    //BFS
    //
    //Solution Description:
    //Traverse the tree using BFS, storing the nodes at each level in
    //an arry before adding them to a tree wide levels array.
    static func levelOrder(_ root: NaryTreeNode?) -> [[Int]] {
        guard let root = root else {
            return [[Int]]()
        }
        
        var queue = [root]
        var levels = [[root.val]]
        
        while !queue.isEmpty {
            let count = queue.count
            var level = [Int]()
            
            for _ in 0..<count {
                let node = queue.removeFirst()
                
                for child in node.children {
                    level.append(child.val)
                    queue.append(child)
                }
            }
            
            if !level.isEmpty {
                levels.append(level)
            }
        }
        
        return levels
    }
}
