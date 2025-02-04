//
//  CousinsInBinaryTree.swift
//  LeetCode
//
//  Created by William Boles on 10/11/2023.
//

import Foundation

//https://leetcode.com/problems/cousins-in-binary-tree/
struct CousinsInBinaryTree {
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(m) where m is the maximum nodes at the largest level
    //binary tree
    //BFS
    //iterative
    //level traversal
    //
    //Solution Description:
    //Using BFS we are able to traverse the tree level-by-level. At each level we can compare the current node against `x` and
    //`y`, if either is found then the other must also be present in order for them to (potentially) be cousins. In order to
    //know if they are presents we need to check if they share a parent so as well as storing the next nodes in the queue we
    //also store the parent of that node in the queue. This way at the end of levels iteration we check if either `x` or `y`
    //was found and if and only if they where found if they share a parent. We repeat this process until we find either or both
    //`x` and `y` or we run out of nodes to search.
    func isCousins(_ root: TreeNode?, _ x: Int, _ y: Int) -> Bool {
        guard let root = root else {
            return false
        }
        
        var queue = [(Int, TreeNode)]() //parent, child
        queue.append((-1, root)) //-1 means no parent
        
        while !queue.isEmpty {
            var nextIteration = [(Int, TreeNode)]()
            
            var foundX = -1
            var foundY = -1
            
            for (parent, child) in queue {
                if child.val == x {
                    foundX = parent
                } else if child.val == y {
                    foundY = parent
                }
                
                if let left = child.left {
                    nextIteration.append((child.val, left))
                }
                
                if let right = child.right {
                    nextIteration.append((child.val, right))
                }
            }
            
            if foundX != -1 || foundY != -1 {
                //need to have found both at the same level and for them not to have the same parent,
                //the first condition checks both have been found if either has been found and the
                //second condition checks that they don't have the same parent
                return (foundX != -1 && foundY != -1 ) && foundX != foundY
            }
            
            queue = nextIteration
        }
        
        return false
    }
}
