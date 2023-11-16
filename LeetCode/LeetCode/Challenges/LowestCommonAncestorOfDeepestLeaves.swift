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
    //As we are only interested in the deepest leaves but we don't know the depth of the tree, using DFS we first finnd the
    //deepest node on that DFS branch and return it, we then compare that branch with the other branch from that parent node (if
    //another branch exists). If those two branches have nodes at the same depth then we know that this node is the `lca` for
    //those two branches and return that alongside the max depth we on that combined branch - we don't yet know if the branch
    //max depth is the tree max depth so need to pass it back up as we unwind the recursive stack to ensure we are finding the
    //lca of tge deepest leaves. If one of those branches is deeper than the other we take the deepest ones `lca` and
    //`maxDepthFound` and return that. We repeat this process, until all branches have been compared and can return the `lca`.
    static func lcaDeepestLeaves(_ root: TreeNode?) -> TreeNode? {
        let (node, _) = dfs(root, 0)
        
        return node
    }
    
    private static func dfs(_ node: TreeNode?, _ depth: Int) -> (lca: TreeNode?, maxDeepFound: Int) {
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
