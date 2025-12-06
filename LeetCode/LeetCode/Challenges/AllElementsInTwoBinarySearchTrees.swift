// Created 14/11/2023.

import Foundation

//https://leetcode.com/problems/all-elements-in-two-binary-search-trees/
struct AllElementsInTwoBinarySearchTrees {
    
    //Time: O(n + m) where n is the number of nodes in the `root1` tree
    //               where m is the number of nodes in the `root2` tree
    //Space: O(n + m)
    //binary tree
    //DFS
    //recursive
    //sorting
    //inout
    //in-order
    //two pointers
    //
    //Solution Description:
    //First we perform an in-order traversal of each tree which results in two sorted arrays. We then merge the sorted arrays in
    //ascending order by comparing and then selecting the smaller of two elements in the two array. We use two pointers to iterate
    //through each array independently so ensuring that the smallest element of each array is being compared. Once we have
    //exhausted one array we stop merging and instead take the remaining elements from the non-exhausted array and merge them onto
    //the end of `mergedValues`. 
    func getAllElements(_ root1: TreeNode?, _ root2: TreeNode?) -> [Int] {
        var values1 = [Int]()
        var values2 = [Int]()
        
        inorder(root1, &values1)
        inorder(root2, &values2)
        
        var mergedValues = [Int]()
        
        var p1 = 0
        var p2 = 0
        
        while p1 < values1.count && p2 < values2.count {
            let v1 = values1[p1]
            let v2 = values2[p2]
            
            if v1 < v2 {
                mergedValues.append(v1)
                p1 += 1
            } else {
                mergedValues.append(v2)
                p2 += 1
            }
        }
        
        if p1 < values1.count {
            mergedValues.append(contentsOf: values1[p1...])
        } else {
            mergedValues.append(contentsOf: values2[p2...])
        }
        
        return mergedValues
    }
    
    private func inorder(_ node: TreeNode?, _ values: inout [Int]) {
        guard let node = node else {
            return
        }
        
        inorder(node.left, &values)
        values.append(node.val)
        inorder(node.right, &values)
    }
}
