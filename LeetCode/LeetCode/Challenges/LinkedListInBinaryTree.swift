//
//  LinkedListInBinaryTree.swift
//  LeetCode
//
//  Created by William Boles on 16/12/2023.
//

import Foundation

//https://leetcode.com/problems/linked-list-in-binary-tree/
struct LinkedListInBinaryTree {
    
    //Time: O(n * min(l, h)) where n is the number of nodes in the tree
    //                       where l is the number of nodes in the list
    //                       where h is the height of the tree
    //Space: O(h)
    //binary tree
    //linked list
    //DFS
    //recursive
    //
    //Solution Description:
    //We use DFS twice to attempt to find the linked list inside the binary tree. The first use of DFS is to traverse the tree
    //and kick off the matching process for each node against the head of the linked list. The second use of DFS is to match
    //(or at least attempt to match) a path from that node against the full linked list. If that second DFS traversal matches
    //a path against the linked list we never go deeper in the tree. We need to kick a DFS off from each node in case we have
    //repeating values.
    //
    //In Swift the second operation/statement of an `OR` statement is only executed if the first operations value is `FALSE`,
    //so in the below code if we find the linked list in the tree then the search stops at that point without has having to
    //explicitly add that code in (similar thing happens with an `AND` statement but the first operations value must be `TRUE`
    //).
    func isSubPath(_ head: ListNode?, _ root: TreeNode?) -> Bool {
        return findStart(head, root)
    }
    
    private func findStart(_ linkedListNode: ListNode?, _ treeNode: TreeNode?) -> Bool {
        guard let linkedListNode = linkedListNode, let treeNode = treeNode else {
            return false
        }
        
        //note how we call `match` against the current node and recurse the nodes children using `findStart`
        return match(linkedListNode, treeNode) || findStart(linkedListNode, treeNode.left) || findStart(linkedListNode, treeNode.right)
    }
    
    private func match(_ linkedListNode: ListNode?, _ treeNode: TreeNode?) -> Bool {
        guard let linkedListNode = linkedListNode else {
            return true
        }
        
        guard let treeNode = treeNode else {
            return false
        }
        
        return linkedListNode.val == treeNode.val &&
               (match(linkedListNode.next, treeNode.left) || match(linkedListNode.next, treeNode.right))
    }
}
