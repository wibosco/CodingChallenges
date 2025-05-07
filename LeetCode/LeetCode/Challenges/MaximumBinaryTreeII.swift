// Created 07/05/2025.

import Foundation

//https://leetcode.com/problems/maximum-binary-tree-ii/
struct MaximumBinaryTreeII {
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(n)
    //binary tree
    //recursive
    //array
    //
    //Solution Description:
    //A value added to the end of a maximum tree array will always be a right element so we recursively search the right side of
    //the tree for a node with the right-child that is either smaller than `val` or doesn't exist. If we find a node value that is
    //smaller than `val` we replace the right-child with a new TreeNode instance and move the old right-child to be the new
    //right-child's left node (remember the new val is always to the right of everything else). If there is no chiild we simply
    //add a new TreeNode instance. We then unwind the stack, assiging any new right-child nodes as we do so before returning the
    //root (with may or may not be the TreeNode instance of `val`).
    func insertIntoMaxTree(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        guard let root else {
            return TreeNode(val)
        }
        
        guard root.val > val else {
            let newRoot = TreeNode(val)
            newRoot.left = root
                
            return newRoot
        }
        
        root.right = insertIntoMaxTree(root.right, val)
        
        return root
    }

    //Time: O(n ^ 2) where n is the number of nodes in the tree
    //Space: O(n)
    //binary tree
    //recursive
    //inorder
    //array
    //
    //Solution Description:
    //First we perform an inorder traversal of the tree to transform the tree back into an array. Then we add `val` to that array
    //and reconstruct the tree by recursively splitting `nums` around its largest value we gradually build the binary tree. At each
    //recursive call we find the largest value in `nums` and set it to be the value of a new TreeNode. We then split `nums` in two
    //with the indexes that came before the largest value index forming the left branch and the indexes after the largest value
    //index formng the right branch. We repeat this process on a gradually reducing number of elements in `nums` until all elements
    //have been used at which point the recursive stack unwinds and we can return the root.
    func insertIntoMaxTree2(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        let values = deconstruct(root) + [val]
        
        return construct(values, 0, values.count)
    }
    
    private func deconstruct(_ root: TreeNode?) -> [Int] {
        guard let root else {
            return []
        }
        
        let left = deconstruct(root.left)
        let right = deconstruct(root.right)
        
        return left + [root.val] + right
    }
    
    private func construct(_ values: [Int], _ start: Int, _ end: Int) -> TreeNode? {
        guard let maxIndex = max(values, start, end) else {
            return nil
        }
        
        let root = TreeNode(values[maxIndex])
        root.left = construct(values, start, maxIndex)
        root.right = construct(values, (maxIndex + 1), end)
        
        return root
    }
    
    private func max(_ values: [Int], _ start: Int, _ end: Int) -> Int? {
        guard end > start else {
            return nil
        }
        
        var maxIndex = start
        for x in start..<end {
            if values[x] > values[maxIndex] {
                maxIndex = x
            }
        }
        
        return maxIndex
    }
}
