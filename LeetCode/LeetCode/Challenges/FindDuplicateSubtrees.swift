//
//  FindDuplicateSubtrees.swift
//  LeetCode
//
//  Created by William Boles on 19/11/2023.
//

import Foundation

//https://leetcode.com/problems/find-duplicate-subtrees/
struct FindDuplicateSubtrees {
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(h + n) where h is the height of the tree
    //                where n is the number of nodes in the tree
    //DFS
    //recursive
    //bottom-up
    //dictionary
    //inout
    //
    //Solution Description:
    //Using DFS we traverse to the leaf nodes and then start to build up our trees subtrees as the recursive stack unwinds - this
    //way we are able to build all subtrees in O(n) rather than the more expensive top-down approach. As we unwind the stack we
    //convert the (sub)tree into a string to be used as the key for `subtrees`, because we are matching on both the values of the
    //subtree and it's structure we need to bake the structure into our keys which we do with "L" and "R". We repeat this process
    //for all subtrees and then we iterate through `subtrees` - any subtree patterns that have multiple root nodes are duplicates
    //so we add the first root to `roots`. Once all subtrees have been checked we return `duplicates`.
    static func findDuplicateSubtrees(_ root: TreeNode?) -> [TreeNode?] {
        guard let root = root else {
            return []
        }
        
        var subtrees = [String: [TreeNode]]()
        
        _ = dfs(root, &subtrees)
        
        var duplicates = [TreeNode]()
        
        for roots in subtrees.values {
            if roots.count > 1 {
                duplicates.append(roots[0])
            }
        }
        
        return duplicates
    }
    
    private static func dfs(_ node: TreeNode?, _ subtrees: inout [String: [TreeNode]]) -> String {
        guard let node = node else {
            return ""
        }
        
        let leftSubTree = dfs(node.left, &subtrees)
        let rightSubTree = dfs(node.right, &subtrees)
        
        //L and R are used to track the child each subtree comes from as order is important
        let subtree = "\(node.val)" + "L" + leftSubTree + "R" + rightSubTree
        
        subtrees[subtree, default: [TreeNode]()].append(node)
        
        return subtree
    }
}
