//
//  LowestCommonAncestorOfDeepestLeaves.swift
//  LeetCode
//
//  Created by William Boles on 16/11/2023.
//

import Foundation

//https://leetcode.com/problems/lowest-common-ancestor-of-deepest-leaves/
struct LowestCommonAncestorOfDeepestLeaves {
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(h) where h is the height of the tree
    //binary tree
    //DFS
    //recursive
    //bottom-up
    //
    //Solution Description:
    //As we are only interested in the deepest leaves but we don't know the depth of the tree, using DFS we first find the
    //deepest node on that DFS branch and return it, we then compare that deepest node with the deepest node found on other
    //sibling branches. If those two branches have differing depths then we take the deepest node and it's depth value and
    //return it. If those two branches have the same depth then we know that this parent node is the `lowest-common-ancestor`
    //(lca) for those two branches and we return that parent node alongside the max depth value - we don't yet know if this max
    //depth value is the tree max depth so need to keep passing it back up as we unwind the recursive stack to compare against
    //other depth values, this way we ensure we are finding the `lca` of the deepest leaves. We repeat this process, until all
    //branches have been compared and can return the `lca`.
    //
    //Same as: https://leetcode.com/problems/smallest-subtree-with-all-the-deepest-nodes/
    func lcaDeepestLeaves(_ root: TreeNode?) -> TreeNode? {
        return dfs(root, 0).0
    }
    
    private func dfs(_ node: TreeNode?, _ depth: Int) -> (lca: TreeNode?, maxDeepFound: Int) {
        guard let node = node else {
            return (nil, (depth - 1)) //found this branches max depth
        }
        
        let left = dfs(node.left, (depth + 1))
        let right = dfs(node.right, (depth + 1))
        
        if left.maxDeepFound == right.maxDeepFound { //found new LCA of these two branches
            return (node, left.maxDeepFound)
        } else if left.maxDeepFound < right.maxDeepFound { //right is deeper
            return right
        } else { //left is deeper
            return left
        }
    }
}
