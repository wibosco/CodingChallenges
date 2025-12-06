// Created 10/11/2023.

import Foundation

//https://leetcode.com/problems/increasing-order-search-tree/
struct IncreasingOrderSearchTree {
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(n)
    //binary tree
    //binary search tree
    //DFS
    //recursive
    //inout
    //in-order
    //
    //Solution Description:
    //Using CFS we perform an in-order traversal of the tree, this will order the nodes into an ascending order array - ``order.
    //We then iterate through `order` and associated the current node with the previous node. Once all nodes have been reordered
    //we return the new root.
    func increasingBST(_ root: TreeNode?) -> TreeNode? {
        var order = [TreeNode]()
        inorder(root, &order)
        
        let newRoot = order[0]
        newRoot.left = nil
        newRoot.right = nil
        
        var parent = newRoot
        
        for node in order {
            parent.right = node
            
            node.left = nil
            node.right = nil
            
            parent = node
        }
        
        return newRoot
    }
    
    private func inorder(_ node: TreeNode?, _ order: inout [TreeNode]) {
        guard let node = node else {
            return
        }
        
        inorder(node.left, &order)
        order.append(node)
        inorder(node.right, &order)
    }
}
