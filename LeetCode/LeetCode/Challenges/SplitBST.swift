//
//  SplitBST.swift
//  LeetCode
//
//  Created by William Boles on 23/11/2023.
//

import Foundation

//https://leetcode.com/problems/split-bst/
struct SplitBST {
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(h) where h is the height of the tree
    //DFS
    //recursive
    //bottom-up
    //
    //Solution Description:
    //Using DFS we traverse the tree and determine if a node is less-than-or-equal-to `target` or greater-than `target`.
    //With this information we know which tree node should go into. It's important to note that just because a node is
    //less-than-or-equal-to `target` or greater-than `target` doesn't mean that all of it's child nodes are. So once
    //which tree the current node should be in we need to adjust it's child subtrees to match the pattern. So if the
    //node is less-than-or-equal-to `target` we know that all it's left childern are as well but we can't say the same
    //for it's right childern which could join either tree. So we recursively check the nodes in that tree - any nodes
    //that are less-than-or-equal-to `target` are added as the right child of the node, any that are greater-than
    //`target` are returned in the array but not touched. By going recursively and assign to right (or left) child we
    //maintain the "order" of the tree where removing those nodes that don't fit in this new tree. We repeat this
    //process for greater-than to `target` but this time we select the left child to search nodes that are greater-than
    //`target` there. Once we have searched all nodes in the tree we should have our two trees which can be returned.
    //
    //Similar to: https://leetcode.com/problems/trim-a-binary-search-tree/
    static func splitBST(_ root: TreeNode?, _ target: Int) -> [TreeNode?] {
        guard let root = root else {
            return [nil, nil] //lessThanOrEqualTree, GreaterThanTree
        }
        
        if root.val <= target {
            let splitTreeRoots = splitBST(root.right, target)
            //assign any deeper nodes/subtree that are greater than root but less thanto target to the right child
            root.right = splitTreeRoots[0] //could be nil
            
            return [root, splitTreeRoots[1]]
        } else {
            let splitTreeRoots = splitBST(root.left, target)
            //assign any deeper nodes/subtree that are less than root and less than to target to the left child child
            root.left = splitTreeRoots[1] //could be nil
            
            return [splitTreeRoots[0], root]
        }
    }
}
