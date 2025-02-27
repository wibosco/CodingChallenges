//
//  SymmetricTree.swift
//  LeetCode
//
//  Created by William Boles on 23/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/symmetric-tree/
struct SymmetricTree {
    
    //Time: O(n)
    //Space: O(log n) - best, O(h) - worse (height of the tree)
    //binary tree
    //DFS
    //recursive
    //matching
    //
    //Solution Description:
    //Using DFS we traverse the opposite branches i.e. left and right or right and left, comparing the value of each
    //node against its opposite to ensure they match
    //
    //Similar to: https://leetcode.com/problems/subtree-of-another-tree/
    //Similar to: https://leetcode.com/problems/same-tree/
    func isSymmetric(_ root: TreeNode?) -> Bool {
        guard let root = root else {
            return false
        }
        
        return isSymmetric(root.left, root.right)
    }
    
    private func isSymmetric(_ a: TreeNode?, _ b: TreeNode?) -> Bool {
        guard let a = a, let b = b else {
           return a == nil && b == nil
        }
        
        return (a.val == b.val) && isSymmetric(a.left, b.right) && isSymmetric(a.right, b.left)
    }
    
    //Time: O(n)
    //Space: O(log n) - best, O(h) - worse
    //binary tree
    //BFS
    //two pointers
    //iterative
    //
    //Solution Description:
    //1. Perform a level traversal
    //2. At each level perform a comparison that levels outer most elements and then move inwards (repeat until
    //   no more elements to compare)
    //3. Ensure that parent element is the same for any subtree
    func isSymmetricComplex(_ root: TreeNode?) -> Bool {
        guard let root = root else {
            return false
        }
        
        guard root.left != nil && root.right != nil else {
            return root.left == nil && root.right == nil
        }
        
        //0 - left, 1 - right
        var queue = [(node: TreeNode, parent: TreeNode, side: Int)]()
        
        queue.append((node: root.left!, parent: root, side: 0))
        queue.append((node: root.right!, parent: root, side: 1))
        
        while !queue.isEmpty {
            let levelCount = queue.count
            
            //symmetric checking
            if !levelCount.isMultiple(of: 2) {
                return false
            }
            
            var left = 0
            var right = levelCount - 1
            
            while left < right {
                let ln = queue[left]
                let rn = queue[right]
                
                if ln.node.val != rn.node.val || ln.parent.val != rn.parent.val || ln.side == rn.side {
                    return false
                }
                
                left += 1
                right -= 1
            }
            
            var newQueueItems = [(node: TreeNode, parent: TreeNode, side: Int)]()
            
            //add child nodes for next iteration
            for queued in queue {
                if let left = queued.node.left {
                    newQueueItems.append((node: left, parent: queued.node, side: 0))
                }
                
                if let right = queued.node.right {
                    newQueueItems.append((node: right, parent: queued.node, side: 1))
                }
            }
            
            queue = newQueueItems
        }
        
        return true
    }
}
