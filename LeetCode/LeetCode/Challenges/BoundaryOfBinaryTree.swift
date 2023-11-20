//
//  BoundaryOfBinaryTree.swift
//  LeetCode
//
//  Created by William Boles on 20/11/2023.
//

import Foundation

//https://leetcode.com/problems/boundary-of-binary-tree/
struct BoundaryOfBinaryTree {
    
    //Time: O(n) where n is the number of nodoes in the tree
    //Space: O(h) where h is the height of the tree
    //binary tree
    //DFS
    //recursive
    //top-down
    //bottom-up
    //inout
    //
    //Solution Description:
    //Using DFS we first build up the left boundary (and any leaf nodes that fall on that side) by searching the lef subtree
    //of root. It important to note that while left child nodes are favoured when building the left boundary, right child
    //nodes can form part of it if there is no left child node so as we traverse we need to be checking for that scenario.
    //To get the ordering we want we add any bounday nodes we encounter to `boundary` before going deeper - top-down. Once
    //the left boundary has been built we switch over to building the right boundary - it's very similar to how we built the
    //left boundary but with `findRightBoundary` set to true this time. To get the ordering we want we add any bounday nodes
    //we encounter to `boundary` as the recursive calls unwind which will order that boundary bottom-up. With both
    //traversals if we encounter a leaf node we add it immediately to `boundary` without checking if it is part of the left
    //or right boundary. Once the left, right and leaf boundaries have been built we add in the root node and return the
    //combined array.
    static func boundaryOfBinaryTree(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
            return []
        }
        
        var leftBoundary = [Int]()
        var rightBoundary = [Int]()
        
        dfs(root.left, true, false, &leftBoundary)
        dfs(root.right, false, true, &rightBoundary)
        
        return [root.val] + leftBoundary + rightBoundary
    }
    
    private static func dfs(_ node: TreeNode?, _ findLeftBoundary: Bool, _ findRightBoundary: Bool, _ boundary: inout [Int]) {
        guard let node = node else {
            return
        }
        
        //leaf nodes are always treated as such even if they form part of the left or right boundary
        if node.left == nil && node.right == nil {
            boundary.append(node.val)
            return
        }
        
        if findLeftBoundary { //add left boundary in-order i.e. top-down
            boundary.append(node.val)
        }
        
        //when attempting to find the right boundary, if no right child exists treat the left child as the boundary
        dfs(node.left, findLeftBoundary, (findRightBoundary && node.right == nil), &boundary)
        //when attempting to find the left boundary, if no left child exists treat the right child as the boundary
        dfs(node.right, (findLeftBoundary && node.left == nil), findRightBoundary, &boundary)
        
        if findRightBoundary { //add right boundary nodes in reverse order i.e. bottom-up
            boundary.append(node.val)
        }
    }
}
