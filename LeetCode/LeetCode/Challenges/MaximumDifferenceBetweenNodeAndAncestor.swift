//
//  MaximumDifferenceBetweenNodeAndAncestor.swift
//  LeetCode
//
//  Created by William Boles on 15/11/2023.
//

import Foundation

//https://leetcode.com/problems/maximum-difference-between-node-and-ancestor/
struct MaximumDifferenceBetweenNodeAndAncestor {
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(h) where h is the height of the tree
    //DFS
    //recursive
    //bottom-up
    //
    //Solution Description:
    //Using DFS we traverse each branch of the tree, keeping track of the minimum and maximum value we have seen on that branch
    //- note only the minimum and maximum not the overall tree. When we go beyond a leaf node we calculate the largest
    //absolute difference between those two values and return it. We then compare it against the difference produced from other
    //branches further up the tree and take the largest value. At each level we check if we have found a new `minVal` or `maxVal`.
    //We repeat this process until we get to the root at which point we return.
    func maxAncestorDiff(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return -1
        }
        
        return dfs(root, root.val, root.val)
    }
    
    private func dfs(_ node: TreeNode?, _ minVal: Int, _ maxVal: Int) -> Int {
        guard let node = node else {
            return  maxVal - minVal
        }
        
        let newMinVal = min(minVal, node.val)
        let newMaxVal = max(maxVal, node.val)
        
        let leftDiff = dfs(node.left, newMinVal, newMaxVal)
        let rightDiff = dfs(node.right, newMinVal, newMaxVal)
        
        return max(leftDiff, rightDiff)
    }
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(h) where h is the height of the tree
    //DFS
    //recursive
    //top-down
    //inout
    //
    //Solution Description:
    //Using DFS we traverse each branch of the tree, keeping track of the minimum and maximum value we have seen on that branch
    //and calculating the absolute difference between those values at every node. `minVal` and `maxVal` are tried to the branch
    //or path the current node is on whereas `greatestDifference` is across the whole tree. At each level we check if we have
    //found a new `minVal` or `maxVal`. once all nodes have been checked with return `greatestDifference`.
    func maxAncestorDiffTopDown(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return -1
        }
        
        var greatestDifference = 0
        
        dfsTopDown(root.left, root.val, root.val, &greatestDifference)
        dfsTopDown(root.right, root.val, root.val, &greatestDifference)
        
        return greatestDifference
    }
    
    private func dfsTopDown(_ node: TreeNode?, _ minVal: Int, _ maxVal: Int, _ greatestDifference: inout Int) {
        guard let node = node else {
            return
        }
        
        let diffWithMin = abs((node.val - minVal))
        let diffWithMax = abs((node.val - maxVal))
        
        greatestDifference = max(greatestDifference, diffWithMin, diffWithMax)
        
        let newMin = min(minVal, node.val)
        let newMax = max(maxVal, node.val)
        
        dfsTopDown(node.left, newMin, newMax, &greatestDifference)
        dfsTopDown(node.right, newMin, newMax, &greatestDifference)
    }
}
