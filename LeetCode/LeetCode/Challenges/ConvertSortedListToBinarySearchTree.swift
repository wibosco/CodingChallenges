//
//  ConvertSortedListToBinarySearchTree.swift
//  LeetCode
//
//  Created by William Boles on 11/11/2023.
//

import Foundation

//https://leetcode.com/problems/convert-sorted-list-to-binary-search-tree/
struct ConvertSortedListToBinarySearchTree {
    
    //Time: O(n log n) where n is the number of nodes in the list
    //Space: O(h) where h is the height of the tree
    //linked list
    //binary tree
    //binary search tree
    //DFS
    //recursive
    //sorted
    //fast and slow pointers
    //divide and conquer
    //three pointers
    //
    //Solution Description:
    //As the linked list is sorted, we can use a divide and conquer technique to recursively split the linked list into smaller
    //lists and build out the binary tree around the middle node of each sublist. we know that if we take the middle node then
    //there should be equal number of nodes on each side (-/+ 1). So we can take that middle node as the root of the (sub)tree.
    //After which we can split the linked list into two linked lists around that middle node and repeat the process until all
    //nodes in the linked list have been converted into binary tree nodes - this uses DFS as the left tree is fully built
    //before the right tree. To find the middle node we use a fast and slow pointer as we don't know in advance how many nodes
    //are in the linked list.
    static func sortedListToBST(_ head: ListNode?) -> BinaryTreeNode? {
        guard let head = head else {
            return nil
        }
        
        let root = dfs(head)
        
        return root
    }
    
    static func dfs(_ node: ListNode?) -> BinaryTreeNode? {
        //base case
        guard let node = node else {
            return nil
        }
        
        //base case for where node is the only item in this list
        guard node.next != nil else {
            return BinaryTreeNode(node.val)
        }
        
        var previous: ListNode?
        var slow: ListNode? = node
        var fast: ListNode? = node
        
        while fast != nil && fast?.next != nil {
            previous = slow
            slow = slow?.next
            fast = fast?.next?.next
        }
        
        guard let listNode = slow else {
            return nil
        }
        
        //split list into two by detaching the linked-list node used as root of this tree
        previous?.next = nil
        
        let root = BinaryTreeNode(listNode.val)
        
        root.left = dfs(node)
        root.right = dfs(listNode.next)
        
        return root
    }
}
