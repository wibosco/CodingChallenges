//
//  BSTIterator.swift
//  LeetCode
//
//  Created by William Boles on 31/03/2022.
//

import Foundation

//https://leetcode.com/problems/binary-search-tree-iterator/
//design
//stack
//
//Time: average: O(1) and worse: O(n) where n is the number of nodes in the tree
//Space: O(n)
//
//Solution Description:
//Rather than preprocessing the full tree we only preprocess down to the first element that will be returned in an inorder
//traversal - the left most element. We store this element and all other elements than we have already seen in a stack.
//When `next` is called we return the element at the top of the stack and if that element has a `right` node we process the
//nodes on branch, again only until we reach the left most element. If the node has no `right` node then the next element is
//the stack is now the top - this is why sometimes this operation is O(1) and sometimes O(n). As we gradually run out of
//`right` nodes we pop more and more elements off the `stack` until we have no more to pop
final class BSTIterator {
    private var stack = [BinaryTreeNode]() //Space: O(n)
    
    init(_ root: BinaryTreeNode?) {
        leftMostInorder(root)
    }
    
    //Time: average: O(h), worse: O(n)
    private func leftMostInorder(_ node: BinaryTreeNode?) {
        var node = node
        while let n = node {
            stack.append(n)
            node = n.left
        }
    }
    
    //Time: average: O(1), worse O(n)
    func next() -> Int {
        let next = stack.removeLast()
        
        if let right = next.right {
            leftMostInorder(right)
        }
        
        return next.val
    }
    
    //Time: O(1)
    func hasNext() -> Bool {
        return !stack.isEmpty
    }
}

//https://leetcode.com/problems/binary-search-tree-iterator/
//design
//array
//
//Time: O(n) where n is the number of nodes in the tree
//Space: O(h) where h is the height of the tree
//
//Solution Description:
//Using an array we store an inorder traversal of the tree. We then iterate through that array whenever `next` is called,
//storing our current position in the array using `index`.
final class BSTIteratorArray {
    private var order = [Int]() //Space: O(n)
    private var index = 0
    
    //Time: O(n)
    init(_ root: BinaryTreeNode?) {
        inorder(root, &order)
    }
    
    //Space: O(h)
    private func inorder(_ node: BinaryTreeNode?, _ order: inout [Int]) {
        guard let node = node else {
            return
        }
        
        inorder(node.left, &order)
        order.append(node.val)
        inorder(node.right, &order)
    }
    
    //Time: O(1)
    func next() -> Int {
        let next = order[index]
        index += 1
        
        return next
    }
    
    //Time: O(1)
    func hasNext() -> Bool {
        index < order.count
    }
}
