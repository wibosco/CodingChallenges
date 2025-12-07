// Created 29/01/2022.

import Foundation

//https://leetcode.com/problems/convert-sorted-array-to-binary-search-tree/
struct ConvertSortedArrayToBinarySearchTree {
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(log n) where n is the number of nodes in the tree
    //binary tree
    //binary search tree
    //DFS
    //recursive
    //divide and conquer
    //array
    //
    //Solution Description:
    //A sorted array produced from a BST has been produced using an inorder traversal. As this tree should have the same(ish)
    //height on both the left and right branches we can assume that the root of the tree is in the middle of the `nums` elements.
    //Using this information we can repeatedly divide our `nums`, creating new roots at each step and recursively joining their
    //left and right nodes until there are no more nodes to be created.
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        guard !nums.isEmpty else {
            return nil
        }
        
        let mid = nums.count / 2
        
        let node = TreeNode(nums[mid])
        
        node.left = sortedArrayToBST(Array(nums[0..<mid])) //effectively mid - 1
        node.right = sortedArrayToBST(Array(nums[(mid + 1)..<nums.count]))
        
        return node
    }
    
    //Time: O(n) where n is the number of elements in `nums`
    //Space: O(log n)
    //binary tree
    //binary search tree
    //DFS
    //recursive
    //divide and conquer
    //array
    //
    //Solution Description:
    //A sorted array produced from a BST has been produced using an inorder traversal. As this tree should have the same(ish)
    //height on both the left and right branches we can assume that the root of the tree is in the middle of the `nums` elements.
    //Using this information we can repeatedly divide our `nums`, creating new roots at each step and recursively joining their
    //left and right nodes until there are no more nodes to be created.
    func sortedArrayToBST2(_ nums: [Int]) -> TreeNode? {
        return dfs(nums, 0, (nums.count - 1))
    }

    private func dfs(_ nums: [Int], _ low: Int, _ high: Int) -> TreeNode? {
        guard low >= 0, high < nums.count, low <= high else {
            return nil
        }

        // need to add `low` to move `mid` into the range `low...high` just like in binary search
        let mid = low + ((high - low) / 2)

        let root = TreeNode(nums[mid])

        root.left = dfs(nums, low, (mid - 1))
        root.right = dfs(nums, (mid + 1), high)

        return root
    }
}
