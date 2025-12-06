// Created 15/11/2023.

import Foundation

//https://leetcode.com/problems/convert-bst-to-greater-tree/
struct ConvertBSTToGreaterTree {
    
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
    //As this is a BST we know that nodes greater than the current node will be to the right of that node so if we perform a 
    //reverse in-order traversal of the tree then we can build up a sum of that comprimises of only those nodes that are
    //greater in value. This will allow us to perform a linear traversal and update each node with its GST value. It's
    //important to note that we don't attempt to re-create the tree rather we just re-assign the value of each node to it's
    //GST value.
    func convertBST(_ root: TreeNode?) -> TreeNode? {
        var sum = 0
        dfs(root, &sum)
        
        return root
    }
    
    private func dfs(_ node: TreeNode?, _ sum: inout Int) {
        guard let node = node else {
            return
        }
        
        dfs(node.right, &sum)
        
        sum += node.val
        node.val = sum
            
        dfs(node.left, &sum)
    }
}
