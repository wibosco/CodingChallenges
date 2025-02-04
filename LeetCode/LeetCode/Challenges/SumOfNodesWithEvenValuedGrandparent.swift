//
//  SumOfNodesWithEvenValuedGrandparent.swift
//  LeetCode
//
//  Created by William Boles on 14/11/2023.
//

import Foundation

//https://leetcode.com/problems/sum-of-nodes-with-even-valued-grandparent/
struct SumOfNodesWithEvenValuedGrandparent {
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(h) where h is the height of the tree
    //binary tree
    //DFS
    //recursive
    //
    //Solution Description:
    //Using DFS we traverse the tree. At each node we check if the grandparent node was even, if it was we add the current nodes
    //value to `sum`, we then "promote" the current nodes parent to grandparent, and set the parent to be the current node. We
    //then repeat this on the current nodes childern. Eventually once all nodes have been traversed we return the accumulated sum.
    func sumEvenGrandparent(_ root: TreeNode?) -> Int {
        return dfs(root, false, false)
    }
    
    private func dfs(_ node: TreeNode?, _ parentEven: Bool, _ grandParentEven: Bool) -> Int {
        guard let node = node else {
            return 0
        }
        
        var sum = 0
        if grandParentEven {
            sum += node.val
        }
        
        let newParentEven = (node.val % 2 == 0)
        let left = dfs(node.left, newParentEven, parentEven)
        let right = dfs(node.right, newParentEven, parentEven)
        
        return  left + right + sum
    }
}
