//
//  EvenOddTree.swift
//  LeetCode
//
//  Created by William Boles on 08/12/2023.
//

import Foundation

//https://leetcode.com/problems/even-odd-tree/
struct EvenOddTree {
    
    //Time: O(
    //Space: O(
    //binary tree
    //BFS
    //iterative
    //level traversal
    //modulo
    //
    //Solution Description:
    //Using BFS we traverse the tree level-by-level ensuring that each level meets the characteristics of that level even a
    //level does not we immediately return false. If after checking all nodes in the tree we haven't returned false we know
    //that this tree is "Even Odd" and can return true.
    static func isEvenOddTree(_ root: TreeNode?) -> Bool {
        guard let root = root else {
            return false
        }
        
        var queue = [TreeNode]()
        queue.append(root)
        
        var level = 0
        
        while !queue.isEmpty {
            var nextIteration = [TreeNode]()
            
            for i in 0..<queue.count {
                let node = queue[i]
                if level % 2 == 0 { //levels: 0,2,4,6,etc
                    if node.val % 2 == 0 { //needs to be odd
                        return false
                    }
                    
                    if i > 0 {
                        let prevNode = queue[(i-1)]
                        if prevNode.val >= node.val { //needs to be decending
                            return false
                        }
                    }
                } else { //levels: 1,3,5,7,etc
                    if node.val % 2 != 0 { //needs to be even
                        return false
                    }
                    
                    if i > 0 {
                        let prevNode = queue[(i-1)]
                        if prevNode.val <= node.val { //needs to be ascending
                            return false
                        }
                    }
                }
                
                if let left = node.left {
                    nextIteration.append(left)
                }
                
                if let right = node.right {
                    nextIteration.append(right)
                }
            }
            
            level += 1
            queue = nextIteration
        }
        
        return true
    }
}
