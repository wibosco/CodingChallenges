// Created 23/02/2024.

import Foundation

//https://leetcode.com/problems/closest-nodes-queries-in-a-binary-search-tree/
struct ClosestNodesQueriesInABinarySearchTree {
    
    //Time: O(
    //Space: O(
    //binary tree
    //binary search tree
    //binary search find leftmost
    //binary search find rightmost
    //in-order
    //DFS
    //recursive
    //inout
    //array
    //result
    //
    //Solution Description:
    //As this is binary search tree, we know that an in-order traversal will produce a sorted array. With a sorted array we can
    //then perform two binary searches to find both the upper and lower bounds of each query item.
    func closestNodes(_ root: TreeNode?, _ queries: [Int]) -> [[Int]] {
        guard let root = root else {
            return [[Int]]()
        }
        
        var values = [Int]()
        inorder(root, &values)
        
        var result = [[Int]]()

        for query in queries {
            let min = findMax(values, query)
            let max = findMin(values, query)
            
            result.append([min, max])
        }
        
        return result
    }
    
    private func inorder(_ root: TreeNode?, _ order: inout [Int]) {
        guard let root = root else {
            return
        }
        
        inorder(root.left, &order)
        order.append(root.val)
        inorder(root.right, &order)
    }
    
    private func findMax(_ values: [Int], _ target: Int) -> Int {
        var left = 0
        var right = values.count - 1
        
        var result = -1
        
        while left <= right {
            let mid = left + (right - left) / 2 //to avoid overflow
            
            if values[mid] <= target { //find the upper bounds that is less than or equal to target
                result = values[mid] //we know that values[mid] is a valid result so store it and check again
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        
        return result
    }
    
    private func findMin(_ values: [Int], _ target: Int) -> Int {
        var left = 0
        var right = values.count - 1
        
        var result = -1
        
        while left <= right {
            let mid = left + (right - left) / 2 //to avoid overflow
            
            if values[mid] >= target { //find the lower bounds that is greater than or equal to target
                result = values[mid] //we know that values[mid] is a valid result so store it anad check again
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        
        return result
    }
}
