//
//  ConvertBinarySearchTreeToSortedDoublyLinkedList.swift
//  LeetCode
//
//  Created by William Boles on 11/01/2022.
//  Copyright © 2022 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/convert-binary-search-tree-to-sorted-doubly-linked-list/
struct ConvertBinarySearchTreeToSortedDoublyLinkedList {
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(h) where h is the height of the tree
    //binary tree
    //binary search tree
    //DFS
    //recursive
    //sentinel head
    //sorting
    //linked list
    //doubly linked list
    //in-line
    //inout
    //in-order
    //
    //Solution Description:
    //Performing an in-order traversal we pass the sentinel node to the bottom of the left tree as the tail of the linked list
    //Once we reach the end we associate that left most node with the linked lists tail node (sentinel) by updating the
    //left-most node's left value to point at the tail node and the tails right value to the node. We then update the tail to
    //be the node we just processed and traversal the right tree. We repeat this process until all the nodes have been
    //processed, at which point we take the right value of the sentinel and return it as the head of the linked list.
    //
    //N.B. How `tail` is an inout parameter as this allows it to "travel" across different levels of the tree as the
    //recursive stack unwinds.
    func treeToDoublyList(_ root: TreeNode?) -> TreeNode? {
        let sentinel = TreeNode(0)
        var tail = sentinel
        
        dfs(root, &tail)
        
        return sentinel.right
    }
    
    private func dfs(_ root: TreeNode?, _ tail: inout TreeNode) {
        guard let root = root else {
            return
        }
        
        dfs(root.left, &tail)
        
        root.left = tail
        tail.right = root
        tail = root
        
        dfs(root.right, &tail)
    }
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(n)
    //binary tree
    //binary search tree
    //DFS
    //recursive
    //array
    //sorting
    //linked list
    //doubly linked list
    //in-line
    //inout
    //in-order
    //
    //Solution Description:
    //We perform an in-order traversal pf the tree, adding each node encounter to the `order` array. We then iterate through
    //the nodes and reconnect their `left` and `right` properties based on the order of the nodes in the `order` array. Once
    //all nodes have be reconnected we then connect the first and last nodes together and return that first node.
    func treeToDoublyList2(_ root: TreeNode?) -> TreeNode? {
        guard let root else {
            return nil
        }
        
        var order = [TreeNode]()
        dfs(root, &order)
        
        for i in 1..<order.count {
            let n1 = order[(i - 1)]
            let n2 = order[i]
            
            n1.right = n2
            n2.left = n1
        }
        
        order.first?.left = order.last
        order.last?.right = order.first
        
        return order.first
    }
    
    private func dfs(_ root: TreeNode?, _ order: inout [TreeNode]) {
        guard let root else {
            return
        }
        
        dfs(root.left, &order)
        order.append(root)
        dfs(root.right, &order)
    }
}
