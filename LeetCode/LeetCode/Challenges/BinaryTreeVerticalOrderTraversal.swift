//
//  BinaryTreeVerticalOrderTraversal.swift
//  CodingChallenges
//
//  Created by William Boles on 29/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/binary-tree-vertical-order-traversal/
//binary tree
struct BinaryTreeVerticalOrderTraversal {
    
    //Time: O(n) where `n` is the number of nodes in the tree
    //Space: O(n) where `n` is the number of nodes in the tree
    //BFS
    //
    //Solution Description:
    //Using BFS we traverse the tree level by level storing each node we encounter in a dictionary with the column as the key and
    //the node val as an element in the value array. Starting with at `column` the root node as 0 when we move left we subtract 1
    //and when we move right we add 1 to to the column value. As we are traversing level by level, when we add it node it will
    //already be in the correct order - top to bottom then column by column. To avoid having to sort the dictionary keys we track
    //the min and max column value which then allows to quickly extracted to already sorted value arrays from the dictionary.
    static func verticalOrder(_ root: BinaryTreeNode?) -> [[Int]] {
        guard let root = root else {
            return [[Int]]()
        }
        
        var queue = [(0, root)]
        var ordering = [Int: [Int]]()
        
        var minColumn = 0
        var maxColumn = 0
        
        while !queue.isEmpty {
            let (column, node) = queue.removeFirst()
            
            ordering[column, default: [Int]()].append(node.val)
            
            minColumn = min(minColumn, column)
            maxColumn = max(maxColumn, column)
            
            if let left = node.left {
                queue.append(((column - 1), left))
            }
            
            if let right = node.right {
                queue.append(((column + 1), right))
            }
        }
        
        var result = [[Int]]()
        //using min and max values avoids us having to sort the keys
        for key in minColumn...maxColumn {
            result.append(ordering[key]!)
        }
        
        return result
    }
    
    //Time: O(w * h log h) where `w` is the width of the tree and `h` the height
    //Space: O(n) where `n` is the number of nodes in the tree
    //DFS
    //
    //Solution Description:
    //Using BFS we traverse the tree level by level storing each node we encounter in a dictionary with the column as the key and
    //the node val as an element in the value array. Starting with at `column` the root node as 0 when we move left we subtract 1
    //and when we move right we add 1 to to the column value. To avoid having to sort the dictionary keys we track the min and max
    //column value which then allows to quickly extracted to already sorted value arrays from the dictionary. As we are traversing
    //the tree depth first, it is possible that we will encounter nodes with the same column value at "deeper" in the tree than
    //other nodes with that same column value - this means that our value arrays will not be in the correct order (top to bottom
    //then column by column) so will require further sorting before being added to the result array.
    static func verticalOrderDFS(_ root: BinaryTreeNode?) -> [[Int]] {
        guard let root = root else {
            return [[Int]]()
        }

        var ordering = [Int: [(Int, Int)]]()
        var minColumn = 0
        var maxColumn = 0
        dfs(root, &ordering, 0, 0, &minColumn, &maxColumn)
        
        var result = [[Int]]()
        //using min and max values avoids us having to sort the keys
        for key in minColumn...maxColumn { // O(w)
            let values = ordering[key]!.sorted { $0.0 < $1.0 }.map { $0.1 } // O(h log h)
            result.append(values)
        }
    
        return result
    }
    
    private static func dfs(_ node: BinaryTreeNode?, _ order: inout [Int: [(Int, Int)]], _ column: Int, _ depth: Int, _ minColumn: inout Int, _ maxColumn: inout Int) {
        guard let node = node else {
            return
        }
        
        minColumn = min(minColumn, column)
        maxColumn = max(maxColumn, column)
        
        order[column, default: [(Int, Int)]()].append((depth, node.val))
        dfs(node.left, &order, (column  - 1), (depth + 1), &minColumn, &maxColumn)
        dfs(node.right, &order, (column  + 1), (depth + 1), &minColumn, &maxColumn)
    }
}
