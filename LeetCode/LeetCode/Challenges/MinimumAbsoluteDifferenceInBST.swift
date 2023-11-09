//
//  MinimumAbsoluteDifferenceInBST.swift
//  LeetCode
//
//  Created by William Boles on 09/11/2023.
//

import Foundation

//https://leetcode.com/problems/minimum-absolute-difference-in-bst/
struct MinimumAbsoluteDifferenceInBST {
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(n)
    //binary tree
    //binary search tree
    //DFS
    //recursive
    //inorder
    //
    //Solution Description:
    //Traversing the tree in-order results in an array that is in ascending order - `order`. This sorted array means that when
    //attempting to find the minimum difference we only need to compare an element with it's immediate neighbors and then
    //compare that local difference against the minimum overall difference. Once all differences have been calculated we return
    //`minDiff`.
    static func getMinimumDifference(_ root: BinaryTreeNode?) -> Int {
        var order = [Int]()
        inorder(root, &order)
        
        var minDiff = Int.max
        for i in 0..<(order.count - 1) {
            let diff = order[(i + 1)] - order[i]
            minDiff = min(minDiff, diff)
        }
        
        return minDiff
    }
    
    private static func inorder(_ node: BinaryTreeNode?, _ order: inout [Int]) {
        guard let node = node else {
            return
        }
        
        inorder(node.left, &order)
        order.append(node.val)
        inorder(node.right, &order)
    }
}
