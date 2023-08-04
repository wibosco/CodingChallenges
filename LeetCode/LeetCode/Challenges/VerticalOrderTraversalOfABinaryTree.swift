//
//  VerticalOrderTraversalOfABinaryTree.swift
//  LeetCode
//
//  Created by William Boles on 04/03/2022.
//

import Foundation

//https://leetcode.com/problems/vertical-order-traversal-of-a-binary-tree/
struct VerticalOrderTraversalOfABinaryTree {
 
    //Time: O(n log n) where n is the number of nodes in the tree (due to the sorting)
    //Space: O(n) where n is the number of nodes in the tree
    //binary tree
    //BFS
    //array
    //dictionary
    //sorting
    //
    //Solution Description:
    //To end up with the desired order we need to sort by using the below criteria:
    //
    //1. Column
    //2. Row/Level
    //3. Value
    //
    //Using BFS we traverse the tree level by level storing each node we encounter in a dictionary with the column as the key with
    //the level and node val as a tuple in the value array. Starting with the root node at column 0 when we move left we subtract 1
    //and when we move right we add 1 to to the column value. After each level traversal we increment the level/row counter. To avoid
    //having to sort the dictionary keys we track the min and max column value which then allows to quickly extract each columns in
    //the correct order (i.e. columns are ordered correctly). Next we need to sort each columns data: we sort in ascending
    //order by level/row value, where two elements have the same level/row value we then further sort by value (agains in ascending)
    //order. Finally we then stripped the level/row information from the column and store the value-only array our `result` array.
    static func verticalTraversal(_ root: BinaryTreeNode?) -> [[Int]] {
        guard let root = root else {
           return [[Int]]()
       }
       
       var queue = [(0, root)] //[column, node]
       var ordering = [Int: [(Int, Int)]]() //[column: [row, val]]
       
       var minColumn = 0
       var maxColumn = 0
       var level = 0
       
       while !queue.isEmpty {
           var newQueueItems = [(Int, BinaryTreeNode)]()
           
           for (column, node) in queue {
               ordering[column, default: [(Int, Int)]()].append((level, node.val))

               minColumn = min(minColumn, column)
               maxColumn = max(maxColumn, column)

               if let left = node.left {
                   newQueueItems.append(((column - 1), left))
               }

               if let right = node.right {
                   newQueueItems.append(((column + 1), right))
               }
           }
           
           queue = newQueueItems
           
           level += 1
       }
       
       var result = [[Int]]()
       //using min and max values avoids us having to sort the keys
       for key in minColumn...maxColumn {
           var column = ordering[key]!
           column.sort {
               if $0.0 == $1.0 {
                   return $0.1 < $1.1
               }
               
               return $0.0 < $1.0
           }
           
           let values = column.map { $0.1 }
           
           result.append(values)
       }
       
       return result
   }
}
