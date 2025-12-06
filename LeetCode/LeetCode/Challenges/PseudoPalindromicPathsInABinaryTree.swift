// Created 07/12/2023.

import Foundation

//https://leetcode.com/problems/pseudo-palindromic-paths-in-a-binary-tree/
struct PseudoPalindromicPathsInABinaryTree {
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(n)
    //binary tree
    //DFS
    //recursive
    //dictionary
    //inout
    //top-down
    //backtracking
    //
    //Solution Description:
    //A palindromic can have 0 or at most 1 odd frequency occurance of a value, any more and it's not possible to form a 
    //palindromic. Using this information we traverse the tree in a DFS manner and add each value we encounter into the `freq`
    //dictionary. Once we reach a leaf node we check the `freq` for odd counts - if we end up with an `offCount` of 0 or 1
    //then this path can be reconstructed into a palindromic and we increment `count`, otherwise we skip over. We repeat this
    //for each path in the tree. Once all paths have been checked we return `count`.
    func pseudoPalindromicPaths (_ root: TreeNode?) -> Int {
        var count = 0
        var freq = [Int: Int]()
        
        dfs(root, &freq, &count)
        
        return count
    }
    
    private func dfs(_ node: TreeNode?, _ freq: inout [Int: Int], _ count: inout Int) {
        guard let node = node else {
            return
        }

        freq[node.val, default: 0] += 1
        
        //leaf node
        if node.left == nil && node.right == nil {
            var oddCount = 0
            for value in freq.values {
                if value % 2 != 0 {
                    oddCount += 1
                }
            }
            
            if oddCount == 0 || oddCount == 1 {
                count += 1
            }
        }
        
        dfs(node.left, &freq, &count)
        dfs(node.right, &freq, &count)
        
        freq[node.val, default: 0] -= 1 //backtracking
    }
}
