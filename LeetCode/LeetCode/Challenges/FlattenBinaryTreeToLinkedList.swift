// Created 08/12/2021.

import Foundation

//https://leetcode.com/problems/flatten-binary-tree-to-linked-list/
struct FlattenBinaryTreeToLinkedList {

    //Time: O(n) where n is the number of nodes
    //Space: O(n) where n is the number of nodes
    //binary tree
    //linked list
    //array
    //DFS
    //
    //Solution Description:
    //Using DFS perform a preorder traversal of the tree adding the nodes that we come across to an array. After the array is
    //populated we iterate through, setting the current nodes right node to the next node in the array. We also remove any
    //existing left and right associations
    func flatten(_ root: TreeNode?) {
        guard let root = root else {
            return
        }
        
        var ordering = [TreeNode]()
        dfs(root, &ordering)
        
        for i in 0..<(ordering.count - 1) {
            let curr = ordering[i]
            let next = ordering[(i + 1)]
            
            curr.left = nil
            curr.right = next
            
            next.right = nil
            next.left = nil
        }
    }
    
    private func dfs(_ root: TreeNode?, _ ordering: inout [TreeNode]) {
        guard let root = root else {
            return
        }
        
        ordering.append(root)
        dfs(root.left, &ordering)
        dfs(root.right, &ordering)
    }
}
