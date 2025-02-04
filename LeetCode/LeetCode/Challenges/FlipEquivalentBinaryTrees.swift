//
//  FlipEquivalentBinaryTrees.swift
//  LeetCode
//
//  Created by William Boles on 17/11/2023.
//

import Foundation

//https://leetcode.com/problems/flip-equivalent-binary-trees/
struct FlipEquivalentBinaryTrees {
    
    //Time: O(min(n, m)) where n is the number of nodes in tree1
    //                   where m is the number of nodes in tree2
    //Space: O(min(h1, h2)) where h1 is the height of tree1
    //                      where h2 is the height of tree2
    //binary tree
    //DFS
    //recursive
    //top-down
    //
    //Solution Description:
    //Using DFS we traverse both trees at once. At each stage we check that left and right child are either:
    //
    //1. All nil
    //2. An exact non-nil match
    //3. A flipped non-nil match
    //
    //Any other configuration of nodes at the same stage shows that the trees don't match. If the nodes match we pass the matching
    //pairs of child nodes down to the next recursive call to have their childern checked. We repeat this process until we either
    //get a mismatch with the above criteria or we visit all nodes.
    func flipEquiv(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
        guard root1?.val == root2?.val else {
            return false
        }
        
        return dfs(root1, root2)
    }
    
    private func dfs(_ node1: TreeNode?, _ node2: TreeNode?) -> Bool {
        guard let node1 = node1, let node2 = node2 else { //basecase
            return node1 == nil && node2 == nil //do they match in both being nil?
        }
        
        if node1.left?.val == node2.left?.val && node1.right?.val == node2.right?.val { //exact match
            return dfs(node1.left, node2.left) && dfs(node1.right, node2.right)
        } else if node1.left?.val == node2.right?.val && node1.right?.val  == node2.left?.val { //flipped
            return dfs(node1.left, node2.right) && dfs(node1.right, node2.left)
        }
        
        return false
    }
}
