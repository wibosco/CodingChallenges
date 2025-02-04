//
//  CountCompleteTreeNodes.swift
//  LeetCode
//
//  Created by William Boles on 08/11/2023.
//

import Foundation

//https://leetcode.com/problems/count-complete-tree-nodes/
struct CountCompleteTreeNodes {
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(h) where h is the height of the tree
    //binary tree
    //DFS
    //recursive
    //
    //Solution Description:
    //Using DFS we traverse to the leaf nodes than gradually add the value of each branch together as we unwind the recursive
    //call stack.
    func countNodes(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        
        let leftCount = countNodes(root.left)
        let rightCount = countNodes(root.right)
        
        return leftCount + rightCount + 1 //+1 for current node
    }
}
