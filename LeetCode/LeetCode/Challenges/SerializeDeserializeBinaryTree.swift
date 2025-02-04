//
//  SerializeDeserializeBinaryTree.swift
//  LeetCode
//
//  Created by William Boles on 03/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/serialize-and-deserialize-binary-tree/
struct SerializeDeserializeBinaryTree {
    
    //Time: O(n) where n is the number of elements in data
    //Space: O(n) where n is the nodes in the tree
    //binary tree
    //BFS
    //level traversal
    //
    //Solution Description:
    //Traverse the tree level-by-level (BFS) adding the value (or lack of value) of each node encountered to an array. At the end
    //of the traversal remove any trailing `nil` values.
    func serialize(_ root: TreeNode?) -> [Int?] {
        guard let root = root else {
            return [Int?]()
        }
        
        var queue = [TreeNode?]()
        queue.append(root)
        var values = [Int?]()
        
        while !queue.isEmpty {
            var newQueueItem = [TreeNode?]()
            
            for node in queue {
                guard let node = node else {
                    values.append(nil)
                    continue
                }
                
                values.append(node.val)
                
                newQueueItem.append(node.left)
                newQueueItem.append(node.right)
            }
            
            queue = newQueueItem
        }
        
        //trim `nil` from end
        var i = (values.count - 1)
        while i > 0 {
            if values[i] != nil {
                break
            }
            i -= 1
        }
        
        return Array(values[0...i])
    }
    
    //Time: O(n) where n is the number of elements in data
    //Space: O(n) where n is the nodes in the tree
    //binary tree
    //BFS
    //level traversal
    //
    //Solution Description:
    //Iterate through the array using BFS, taking the elements in pairs as the left and right of the first tree node of the queue
    func deserialize(_ data: [Int?]) -> TreeNode? {
        guard !data.isEmpty, data[0] != nil else {
            return nil
        }
        
        let root = TreeNode(data[0]!)
        var queue = [root]
        var i = 1
        
        while i < data.count {
            let node = queue.removeFirst()
            
            if let leftValue = data[i] {
                let left = TreeNode(leftValue)
                node.left = left
                
                queue.append(left)
            }
            
            i += 1
            
            guard i < data.count else {
                continue
            }
            
            if let rightValue = data[i] {
                let right = TreeNode(rightValue)
                node.right = right
                
                queue.append(right)
            }
            
            i += 1
        }
        
        return root
    }
}
