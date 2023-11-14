//
//  BinaryTreeRightSideView.swift
//  LeetCode
//
//  Created by William Boles on 09/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/binary-tree-right-side-view/
struct BinaryTreeRightSideView {
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(n) where n is the number of nodes in the tree
    //binary tree
    //BFS
    //array
    //
    //Solution description:
    //Traverse through the tree using BFS. At each level get the right-most node and add it to the `rightSideView` array.
    static func rightSideView(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
            return [Int]()
        }

        var rightSideView = [Int]()
        var queue = [root]
        
        while !queue.isEmpty {
            rightSideView.append(queue.last!.val)
            
            var newQueueItems = [TreeNode]()
            
            for node in queue {                
                if let left = node.left {
                    newQueueItems.append(left)
                }
                
                if let right = node.right {
                    newQueueItems.append(right)
                }
            }
            
            queue = newQueueItems
        }
        
        return rightSideView
    }
}
