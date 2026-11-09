// Created 31/03/2022.

import Foundation

//https://leetcode.com/problems/binary-search-tree-iterator/
//design
//stack
//binary search tree
//recursion
//iterator
//amortised
//
//Time: average: O(1) and worse: O(n) where n is the number of nodes in the tree
//Space: O(h)
//
//Solution Description:
//Rather than flattening the whole tree up front, we only go as far as the next value we need. On init we push the
//root and every left child below it onto a stack, so the top of the stack is the leftmost node - the smallest value.
//When `next` is called we pop the top node, which is the value to return. If that node has a right subtree we push
//that subtree's left spine, so the top of the stack is again the next smallest value. If there's no right subtree,
//the node beneath on the stack is the parent whose left subtree we've just finished, which is the next value in order.
//
//A single `next` can push up to `h` nodes, but across all calls each node is pushed and popped exactly once, so n calls
//cost O(n) in total - amortised O(1) per call. The stack only ever holds nodes from one root-to-leaf path, so it
//never exceeds h nodes.
//
//Amortised describes the cost of an operation averaged over a worst-case sequence of calls. Individual calls can
//occasionally be expensive, but the total work divided by the number of calls is bounded by the stated complexity.
final class BinarySearchTreeIterator {
    private var stack = [TreeNode]() //Space: O(n)
    
    init(_ root: TreeNode?) {
        pushLeftBranchOntoStack(root)
    }
    
    //Time: O(h)
    private func pushLeftBranchOntoStack(_ node: TreeNode?) {
        var node = node
        while let n = node {
            stack.append(n)
            node = n.left
        }
    }
    
    //Time: amortised: O(1), worse O(h)
    func next() -> Int {
        let node = stack.removeLast()
        
        pushLeftBranchOntoStack(node.right)
        
        return node.val
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
    init(_ root: TreeNode?) {
        inorder(root, &order)
    }
    
    //Space: O(h)
    private func inorder(_ node: TreeNode?, _ order: inout [Int]) {
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
