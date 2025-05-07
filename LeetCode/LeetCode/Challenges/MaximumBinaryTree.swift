// Created 07/05/2025.

import Foundation

//https://leetcode.com/problems/maximum-binary-tree/
struct MaximumBinaryTree {
    
    //Time: O(n ^ 2) where n is the number of elements in `nums`
    //Space: O(n)
    //binary tree
    //recursive
    //array
    //
    //Solution Description:
    //Recursively splitting `nums` around its largest value we gradually build the binary tree. At each recursive call we
    //find the largest value in `nums` and set it to be the value of a new TreeNode. We then split `nums` in two with the
    //indexes that came before the largest value index forming the left branch and the indexes after the largest value
    //index formng the right branch. We repeat this process on a gradually reducing number of elements in `nums` until all
    //elements have been used at which point the recursive stack unwinds and we can return the root.
    func constructMaximumBinaryTree(_ nums: [Int]) -> TreeNode? {
        return constructMaximumBinaryTree(nums, 0, nums.count)
    }

    private func constructMaximumBinaryTree(_ nums: [Int], _ start: Int, _ end: Int) -> TreeNode? {
        guard let maxIndex = max(nums, start, end) else {
            return nil
        }

        let root = TreeNode(nums[maxIndex])
        root.left = constructMaximumBinaryTree(nums, start, maxIndex)
        root.right = constructMaximumBinaryTree(nums, (maxIndex + 1), end)

        return root
    }

    private func max(_ nums: [Int], _ start: Int, _ end: Int) -> Int? {
        guard end > start else {
            return nil
        }

        var maxIndex = start
        for x in start..<end {
            if nums[x] > nums[maxIndex] {
                maxIndex = x
            }
        }
        
        return maxIndex
    }
}
