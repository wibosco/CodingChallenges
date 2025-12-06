// Created 22/11/2021.

import Foundation

//https://leetcode.com/problems/binary-tree-postorder-traversal/

struct BinaryTreePostorderTraversal {
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(h) where h is the height of the tree
    //binary tree
    //DFS
    //recursive
    //
    //Solution Description:
    //Recursively add nods to `visited` after all left and right child nodes have been added.
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
            return []
        }

        var visited = [Int]()

        postorderTraversal(node: root, visited: &visited)

        return visited
    }

    private func postorderTraversal(node: TreeNode?, visited: inout [Int]) {
        guard let node = node else {
            return
        }

        postorderTraversal(node: node.left, visited: &visited)
        postorderTraversal(node: node.right, visited: &visited)
        visited.append(node.val)
    }
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(h) where h is the height of the tree
    //binary tree
    //DFS
    //iterative
    //
    //Solution Description:
    //Recursively add nods to `visited` after all left and right child nodes have been added.
    func postorderTraversalIterative(_ root: TreeNode?) -> [Int] {
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

        return visited.reversed()
    }
    
}
