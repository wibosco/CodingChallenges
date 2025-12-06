// Created 09/12/2023.

import Foundation

//https://leetcode.com/problems/binary-tree-longest-consecutive-sequence/
struct BinaryTreeLongestConsecutiveSequence {
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(h) where h is the height of the tree
    //binary tree
    //DFS
    //recursive
    //top-down
    //inout
    //
    //Solution Description:
    //Using DFS we go top-down to find the longest sequence. At each level of the tree we comapre the current node against
    //it's parent node to determine if the child node is continuation of the previous sequence or the start of a new
    //sequence. When we reach the end of a sequence we compare it's length against `longest` and update if necessary. Once
    //all nodes have been checked we return `longest`.
    func longestConsecutive(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        
        var longest = 0
        
        dfs(root.left, root, 1, &longest)
        dfs(root.right, root, 1, &longest)
        
        return longest
    }
    
    private func dfs(_ node: TreeNode?, _ parent: TreeNode, _ length: Int, _ longest: inout Int) {
        guard let node = node else {
            longest = max(longest, length)
            return
        }
        
        var length = length
        if node.val - parent.val == 1 {
            length += 1
        } else {
            longest = max(longest, length)
            length = 1
        }
        
        dfs(node.left, node, length, &longest)
        dfs(node.right, node, length, &longest)
    }
}
