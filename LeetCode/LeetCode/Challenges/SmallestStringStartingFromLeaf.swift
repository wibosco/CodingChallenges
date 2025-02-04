//
//  SmallestStringStartingFromLeaf.swift
//  LeetCode
//
//  Created by William Boles on 05/12/2023.
//

import Foundation

//https://leetcode.com/problems/smallest-string-starting-from-leaf/
struct SmallestStringStartingFromLeaf {
    
    //Time: O(n^2) where n is the numbser of nodes in the tree.
    //Space: O(n)
    //binary tree
    //string
    //sorting
    //DFS
    //recursive
    //two pointers
    //top-down
    //bottom-up
    //
    //Solution Description:
    //Using DFS we build the path from the the root to each leaf node then as the callstack unwinds we compare the paths 
    //returned from left and right child nodes and take the lexicographically smaller path and return that path as the
    //smallest on this branch. We repeat this process for each branch in the tree until we return to the root - we then
    //convert the smallest array into a string and return that string.
    func smallestFromLeaf(_ root: TreeNode?) -> String {
        let smallestPath = dfs(root, [])
        
        let startingValue = Int(UnicodeScalar("a").value)
        let smallest = smallestPath.reduce("") { $0 + String(Unicode.Scalar($1 + startingValue)!) }
                
        return smallest
    }
    
    private func dfs(_ node: TreeNode?, _ path: [Int]) -> [Int] {
        guard let node = node else {
            return []
        }
        
        var path = path
        path.append(node.val)
        
        if node.left == nil && node.right == nil { //leaf node?
            return Array(path.reversed())
        }
        
        let left = dfs(node.left, path)
        let right = dfs(node.right, path)
        
        guard left.count > 0, right.count > 0 else {
            return left.count == 0 ? right : left
        }
        
        return smallest(left, right)
    }
    
    private func smallest(_ a: [Int], _ b: [Int]) -> [Int] {
        var p1 = 0
                
        while p1 < a.count && p1 < b.count {
            if a[p1] == b[p1] {
                p1 += 1
            } else if a[p1] < b[p1] {
                return a
            } else {
                return b
            }
        }
        
        //can only get there is `a` and `b` have the same prefix so return the smaller of the two
        return a.count > b.count ? b : a
    }
}
