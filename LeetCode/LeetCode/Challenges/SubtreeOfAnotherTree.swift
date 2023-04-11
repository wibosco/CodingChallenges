//
//  SubtreeOfAnotherTree.swift
//  LeetCode
//
//  Created by William Boles on 26/01/2022.
//  Copyright © 2022 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/subtree-of-another-tree/
//binary tree
struct SubtreeOfAnotherTree {
    
    //Time: O(n * m) `n` is the number of nodes in `t1`, `m` is the number of nodes in `t2`
    //Space: O(m)
    //DFS
    //recursion
    //matching
    //multi-source
    //
    //Solution Description:
    //Using DFS we search through `t1` attempting to find a node with the same value of the root of `t2`. If we find that
    //node we traverse deeper down that path checking the values of each subsequent node pairing (from `t1` and `t2`) and
    //ensuring that they match. If the subtrees don't match we search again from the original "kickoff" node in t1, going
    //down the left and right branches - this also ensures that if `t1` has duplicate `t2` root node values we attempt to
    //match with `t2` on all those duplicates.
    //
    //Similar to: https://leetcode.com/problems/symmetric-tree/
    //Similar to: https://leetcode.com/problems/same-tree/
    static func isSubtree(_ t1: BinaryTreeNode?, _ t2: BinaryTreeNode?) -> Bool {
        guard let t1 = t1, let t2 = t2 else {
            return false
        }

        if isMatch(t1, t2) {
            return true
        }
        
        return isSubtree(t1.left, t2) || isSubtree(t1.right, t2)
    }
    
    private static func isMatch(_ n1: BinaryTreeNode?, _ n2: BinaryTreeNode?) -> Bool {
        guard let n1 = n1, let n2 = n2 else {
           return n1 == nil && n2 == nil
        }
        
        return n1.val == n2.val && isMatch(n1.left, n2.left) && isMatch(n1.right, n2.right)
    }
    
    //Time: O(
    //Space: O(
    //DFS
    //recursion
    //BFS
    //iterative
    //matching
    //
    //Solution Description:
    //Using DFS search for all possible nodes in `t1` of the root of `t2`. Then iterate through each possible root checking
    //if from that point it is match for all of the nodes in `t2`. We do this by comparing the value of each node and ensure
    //that it falls in the same position (left or right).
    static func isSubtreeDFSBFS(_ t1: BinaryTreeNode?, _ t2: BinaryTreeNode?) -> Bool {
        guard let t1 = t1, let t2 = t2 else {
            return false
        }
        
        var matches = [BinaryTreeNode]()
        
        findMatches(t1, t2, &matches)
        
        for match in matches {
            var q1 = [match]
            var q2 = [t2]
            
            var mismatch = false
            
            while !q1.isEmpty && !q2.isEmpty {
                let n1 = q1.removeFirst()
                let n2 = q2.removeFirst()
                
                if n1.left?.val == n2.left?.val {
                    if let next = n1.left {
                        q1.append(next)
                    }
                    
                    if let next = n2.left {
                        q2.append(next)
                    }
                } else {
                    mismatch = true
                    break
                }
                
                if n1.right?.val == n2.right?.val {
                    if let next = n1.right {
                        q1.append(next)
                    }
                    
                    if let next = n2.right {
                        q2.append(next)
                    }
                } else {
                    mismatch = true
                    break
                }
            }
            
            if !mismatch {
                return true
            }
        }
        
        return false
    }
    
    private static func findMatches(_ root: BinaryTreeNode?, _ target: BinaryTreeNode, _ matches: inout [BinaryTreeNode]) {
        guard let root = root else {
            return
        }
        
        if root.val == target.val {
            matches.append(root)
        }
        
        findMatches(root.left, target, &matches)
        findMatches(root.right, target, &matches)
    }
}
