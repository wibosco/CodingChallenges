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
    //Space: O(n) where n is the recursion stack
    //binary tree
    //binary search tree
    //sorting
    //linked list
    //doubly linked list
    //in-line
    //
    //Solution Description:
    //Performing an inorder traversal we pass the fake-head node to the bottom of the left tree as the tail of the linked
    //list. Once we reach the end we associate that left most node with the linked lists tail node (fake head) by updating
    //the left-most node's left value to point at the tail node and the tails right value to the node. We then update the
    //tail to be the node we just processed and traversal the right tree. We repeat this process until all the nodes have
    //been processed, at which point we take the right value of the fake-head and return it as the head of the linked list
    static func treeToDoublyList(_ root: BinaryTreeNode?) -> BinaryTreeNode? {
        let head = BinaryTreeNode(0)
        var tail = head
        
        dfs(root, &tail)
        
        return head.right
    }
    
    private static func dfs(_ root: BinaryTreeNode?, _ tail: inout BinaryTreeNode) {
        guard let root = root else {
            return
        }
        
        dfs(root.left, &tail)
        root.left = tail
        tail.right = root
        tail = root
        dfs(root.right, &tail)
    }
}
