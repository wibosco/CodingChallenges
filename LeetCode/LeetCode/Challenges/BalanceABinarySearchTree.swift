//
//  BalanceABinarySearchTree.swift
//  LeetCode
//
//  Created by William Boles on 07/11/2023.
//

import Foundation

//https://leetcode.com/problems/balance-a-binary-search-tree/
struct BalanceABinarySearchTree {
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(n)
    //binary tree
    //binary search tree
    //in-order
    //recursive
    //
    //Solution Description:
    //Binary search trees (BST) by nature are sorted, all nodes to the left of a given node are less than that given node, all nodes 
    //to the right of a given are greater than that given node. We use this characteristic to re-balance a tree. First we convert the
    //tree into an in-order array (nodes are ascending in value), then we sort that array back into a tree. We take the mid element
    //of that array and use that as the (sub)root of the other nodes in the tree - all nodes to the left of that mid element are less
    //than and all nodes to the right are greater than. We recursively repeat this sorting process on a smaller and smaller set of
    //nodes until we run out of nodes, at which point our call stack starts to return and we assign those returned nodes to either
    //the left or right child node of the call higher up the stack. Once all nodes have been nodes have been processed we have our
    //balanced binary search tree.
    func balanceBST(_ root: TreeNode?) -> TreeNode? {
        var nodes = [TreeNode]()
        inorderTraversal(root, &nodes)
        
        return balance(nodes, 0, (nodes.count - 1))
    }
    
    private func inorderTraversal(_ root: TreeNode?, _ array: inout [TreeNode]) {
        guard let root = root else {
            return
        }
        
        inorderTraversal(root.left, &array)
        array.append(root)
        inorderTraversal(root.right, &array)
    }
    
    private func balance(_ nodes: [TreeNode], _ start: Int, _ end: Int) -> TreeNode? {
        guard end >= start else {
            return nil
        }
        
        let mid = (start + end) / 2
        
        let root = nodes[mid]
        
        root.left = balance(nodes, start, (mid - 1)) //mid has been sorted so omit it
        root.right = balance(nodes, (mid + 1), end)
        
        return root
    }
}
