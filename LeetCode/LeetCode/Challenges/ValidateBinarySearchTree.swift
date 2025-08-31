//
//  ValidateBinarySearchTree.swift
//  LeetCode
//
//  Created by William Boles on 22/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/validate-binary-search-tree/
struct ValidateBinarySearchTree {
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(n) - stack calls
    //binary tree
    //binary search tree
    //pre-order
    //recursive
    //DFS
    //
    //Solution Description:
    //In order for a BST to be valid, all nodes on the right of a particular node need to be greater invalue and all nodes
    //on the left need to be lesser in value. So to validate a BST we can't just compare a root node with its left and
    //right nodes instead we need to also compare it with its predecessors value as well which we can do using a DFS. At
    //each iteration of the DFS we pass in the lower and bounds that the current nodes value must fit within in order to
    //be valid. If at any point the current nodes value is outside that bounds then we know this tree isn't a BST and can
    //return false else we return true for that particular node. We repeat this process for all nodes in the tree,
    //adjusting the `lower` and `upper` value depending on if we are going down the left or right child branch.
    //
    //Similar to: https://leetcode.com/problems/construct-binary-search-tree-from-preorder-traversal/
    func isValidBST(_ root: TreeNode?) -> Bool {
        guard let root = root else {
            return true
        }
        
        return preOrder(root, Int.min, Int.max)
    }
    
    private func preOrder(_ node: TreeNode?, _ lower: Int, _ upper: Int) -> Bool {
        guard let node = node else {
            return true
        }
        
        guard node.val > lower && node.val < upper else {
            return false
        }
        
        return preOrder(node.left, lower, node.val) && preOrder(node.right, node.val, upper) //both need to be valid
    }
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(n)
    //binary tree
    //binary search tree
    //in-order
    //sorted
    //recursive
    //DFS
    //inout
    //
    //Solution Description:
    //A binary search tree has the property that all nodes to the left of root are less than root and all nodes to the right
    //of root are greater. This property means that an in-order traversal of a binary tree should result in an ascending
    //sorted array of that trees nodes if it is a binary search tree. So we perform an in-order traversal of this tree and
    //check if it's nodes are in ascending order by comparing to the node that is immediately before it. As the node that
    //is immediately before the current node in an in-order traversal might be "far" away from it we use an `inout`
    //parameter to hold that predecessor node. If the current node is less than or equal to it's predecessor then we know
    //that this tree is not a BST and can return false.
    //
    //Similar to: https://leetcode.com/problems/convert-binary-search-tree-to-sorted-doubly-linked-list/
    func isValidBST2(_ root: TreeNode?) -> Bool {
        var last: TreeNode?
        return dfs(root, &last)
    }

    private func dfs(_ node: TreeNode?, _ last: inout TreeNode?) -> Bool {
        guard let node else {
            return true
        }

        if !dfs(node.left, &last) {
            return false
        }

        if last?.val ?? Int.min >= node.val {
            return false
        }
        last = node

        return dfs(node.right, &last)
    }
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(n)
    //binary tree
    //binary search tree
    //in-order
    //sorted
    //recursive
    //DFS
    //
    //Solution Description:
    //A binary search tree has the property that all nodes to the left of root are less than root and all nodes to the right
    //of root are greater. This property means that an in-order traversal of a binary tree should result in an ascending
    //sorted array of that trees nodes if it is a binary search tree. So we perform an in-order traversal of this tree and
    //check if it's nodes are in ascending order by comparing each element against it's neighbor. If that neighbor is smaller
    //then we know this tree isn't a BST and can return false. If we get to the end of `visited` we can return true.
    func isValidBST3(_ root: TreeNode?) -> Bool {
        guard let root = root else {
            return true
        }
        
        var visited = [Int]()
        
        inOrder(root, &visited) //Time: O(n)
        
        for i in 0..<(visited.count - 1) {
            if visited[i] >= visited[(i + 1)] {
                return false
            }
        }
    
        return true
    }
    
    private func inOrder(_ node: TreeNode?, _ visited: inout [Int]) {
        guard let node = node else {
            return
        }
        
        inOrder(node.left, &visited)
        visited.append(node.val)
        inOrder(node.right, &visited)
    }
}
