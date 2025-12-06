// Created 28/01/2022.

import Foundation

//https://leetcode.com/problems/kth-smallest-element-in-a-bst/
struct KthSmallestElementInBinarySearchTree {
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(h) where h is the height of the tree
    //binary tree
    //binary search tree
    //DFS
    //i-norder
    //recursive
    //inout
    //
    //Solution Description:
    //An inorder traversal of a binary search tree results in an ordered ascending array of nodes. Using this we can
    //perform an inorder traversal until we get to the `k`th element in the sorted array, at which point we can return its
    //value
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        var k = k
        var kthSmallestNode: TreeNode?
        
        dfs(root, &k, &kthSmallestNode)
        
        guard let kthSmallestNode = kthSmallestNode else {
            return -1
        }
        
        return kthSmallestNode.val
    }
    
    private func dfs(_ root: TreeNode?, _ k: inout Int, _ kthSmallestNode: inout TreeNode?) {
        guard let root = root, kthSmallestNode == nil else {
            return
        }
        
        dfs(root.left, &k, &kthSmallestNode)
        
        k -= 1
        if k == 0 {
            kthSmallestNode = root
        }
        
        dfs(root.right, &k, &kthSmallestNode)
    }
}
