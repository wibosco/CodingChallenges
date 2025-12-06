// Created 22/11/2021.

import Foundation

//https://leetcode.com/problems/binary-tree-preorder-traversal/
struct BinaryTreePreorderTraversal {
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(h) where h is the height of the tree
    //binary tree
    //DFS
    //recursive
    //
    //Solution Description:
    //Recursively add nods to `visited` before all left and right child nodes.
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
            return []
        }

        var visited = [Int]()

        preorderTraversal(node: root, visited: &visited)

        return visited
    }

    private func preorderTraversal(node: TreeNode?, visited: inout [Int]) {
        guard let node = node else {
            return
        }

        visited.append(node.val)
        preorderTraversal(node: node.left, visited: &visited)
        preorderTraversal(node: node.right, visited: &visited)
    }
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(h) where h is the height of the tree
    //binary tree
    //DFS
    //iterative
    //
    //Solution Description:
    //Recursively add nods to `visited` before all left and right child nodes.
    func preorderTraversalIterative(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
            return []
        }
        
        var stack = [root]
        var visited = [Int]()
        
        while !stack.isEmpty {
            let popped = stack.removeLast()
            visited.append(popped.val)
            
            if let right = popped.right {
                stack.append(right)
            }

            if let left = popped.left {
                stack.append(left)
            }
        }
        
        return visited
    }
}
