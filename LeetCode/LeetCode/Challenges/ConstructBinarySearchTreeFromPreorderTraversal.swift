// Created 13/05/2025.

import Foundation

//https://leetcode.com/problems/construct-binary-search-tree-from-preorder-traversal/
struct ConstructBinarySearchTreeFromPreorderTraversal {
    
    //Time: O(n) where n is the number of elements in `preorder`
    //Space: O(n)
    //binary tree
    //binary search tree
    //DFS
    //recursive
    //inout
    //
    //Solution Description:
    //Using the order of the elements in `preorder` we iterate through the array and find where in the tree each element
    //should go using DFS. A node in a BST needs to satisfy not just its immediate ancestor with regards to be less or
    //greater than but all ancestors. To know where a node should be placed, we need to track the upper and lower limits
    //of the subtree in which it is placed. If a nodes value is within those limits it can be place there. With each
    //recursive call the limits change to fit that particular subtree. As we need to insure that all elements in `preorder`
    //are placed, the being checked is shared between all recursive calls - this is what allows movement back up the tree
    //to ensure that each element is correctly place. Once all elements have been placed we return the root.
    //
    //Similar to: https://leetcode.com/problems/validate-binary-search-tree/
    func bstFromPreorder(_ preorder: [Int]) -> TreeNode? {
        var index = 0 //index needs to move forward with every recursive call so need to be shared
        return dfs(preorder, &index, Int.min, Int.max)
    }
    
    private func dfs(_ values: [Int], _ index: inout Int, _ lower: Int, _ upper: Int) -> TreeNode? {
        guard index < values.count else {
            return nil
        }
        
        let val = values[index]
        guard val > lower, val < upper else {
            return nil
        }
        
        index += 1
        
        let root = TreeNode(val)
        root.left = dfs(values, &index, lower, val)
        //index value between left and right calls might have changed
        root.right = dfs(values, &index, val, upper)
        
        return root
    }
    
    //Time: O(n log n) where n is the number of elements in `preorder`
    //Space: O(n)
    //binary tree
    //binary search tree
    //DFS
    //recursive
    //array
    //
    //Solution Description:
    //To build the BST from preorder array, we simply build it as if the data was in preorder ordering. We iterate through
    //the elements of `preorder` and using DFS find where in the tree they should be placed. Once all elements have been
    //placed we return the root.
    func bstFromPreorder2(_ preorder: [Int]) -> TreeNode? {
        let root = TreeNode(preorder[0])
        
        for value in preorder[1...] {
            insert(root, value)
        }
        
        return root
    }
    
    private func insert(_ root: TreeNode, _ value: Int) {
        if value > root.val {
            if let right = root.right {
                insert(right, value)
            } else {
                root.right = TreeNode(value)
            }
        } else {
            if let left = root.left {
                insert(left, value)
            } else {
                root.left = TreeNode(value)
            }
        }
    }
}
