//
//  LargestBSTSubtree.swift
//  LeetCode
//
//  Created by William Boles on 20/11/2023.
//

import Foundation

//https://leetcode.com/problems/largest-bst-subtree/
struct LargestBSTSubtree {
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(h) where h is the height of the tree
    //binary tree
    //binary search tree
    //DFS
    //recursive
    //bottom-up
    //inout
    //
    //Solution Description:
    //Using DFS we traverse to the leaf nodes on the tree then as recursive stack unwinds we compare the left and right 
    //branches/subtrees witht he current node to see if that node could be the root of a BST. As we are looking for a BST
    //we want the left branch to only contain values that are less than the current node and the right branch to only
    //contain values that greater than the current node (values that are equal are treated as invalid.) So checking the
    //left branch we want to compare against the maximum value found in that branch and when checking the right branch
    //we want to compare agains the minimum value found in that branch. So we unwinding our stack we need to pass back:
    //
    //1. Is the subtree a valid BST
    //2. What the size of that subtree is
    //3. What the minimum value of that subtree is
    //4. What the maximum value of that subtree is
    //
    //If both branches are valid BSTs and adding the current node makes a larger BST then we potentially update `maxSize`
    //with the combined size. We also update the `min` and `max` values for this tree and pass it up. It's important to
    //note that of the values returned `isBST` is the most important as a tree can't be a BST unless of it's subtress are
    //also BSTs.
    func largestBSTSubtree(_ root: TreeNode?) -> Int {
        var maxSize = 0
        
        _ = dfs(root, &maxSize)
        
        return maxSize
    }
    
    private func dfs(_ node: TreeNode?, _ maxSize: inout Int) -> (Bool, Int, Int, Int) { //isBST, treeSize, minValue, maxValue
        guard let node = node else {
            return (true, 0, Int.max, Int.min)
        }
        
        let (isLeftTreeValidBST, leftTreeSize, leftMin, leftMax) = dfs(node.left, &maxSize)
        let (isRightTreeValidBST, rightTreeSize, rightMin, rightMax) = dfs(node.right, &maxSize)
        
        let isLeftBranchValidBST = (isLeftTreeValidBST && node.val > leftMax)
        let isRightBranchValidBST = (isRightTreeValidBST && node.val < rightMin)
        
        let validBST = isLeftBranchValidBST && isRightBranchValidBST
        let treeSize = leftTreeSize + rightTreeSize + 1
        
        let newMin = min(leftMin, node.val)
        let newMax = max(rightMax, node.val)
        
        if validBST {
            maxSize = max(maxSize, treeSize)
        }
        
        return (validBST, treeSize, newMin, newMax)
    }
}
