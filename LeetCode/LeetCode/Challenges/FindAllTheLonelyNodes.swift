// Created 20/11/2023.

import Foundation

//https://leetcode.com/problems/find-all-the-lonely-nodes/
struct FindAllTheLonelyNodes {
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(n)
    //binary tree
    //DFS
    //recursive
    //top-down
    //inout
    //
    //Solution Description:
    //Using DFS we visit each node in the tree and check if that node only has one child, if so we add that child node to
    //`lonelyNodes` else we skip over it.
    func getLonelyNodes(_ root: TreeNode?) -> [Int] {
        var lonelyNodes = [Int]()
        
        dfs(root, false, &lonelyNodes)
        
        return lonelyNodes
    }
    
    private func dfs(_ node: TreeNode?, _ lonelyNode: Bool, _ lonelyNodes: inout [Int]) {
        guard let node else {
            return
        }
        
        if lonelyNode {
            lonelyNodes.append(node.val)
        }
        
        dfs(node.left, (node.right == nil), &lonelyNodes)
        dfs(node.right, (node.left == nil), &lonelyNodes)
    }
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(h) where h is the height of the tree
    //binary tree
    //DFS
    //recursive
    //top-down
    //inout
    //
    //Solution Description:
    //Using DFS we visit each node in the tree and check if that node only has one child, if so we add that child node to
    //`lonelyNodes` else we skip over it.
    func getLonelyNodes2(_ root: TreeNode?) -> [Int] {
        var lonelyNodes = [Int]()
        
        dfs(root, &lonelyNodes)
        
        return lonelyNodes
    }
    
    private func dfs(_ node: TreeNode?, _ lonelyNodes: inout [Int]) {
        guard let node = node else {
            return
        }
        
        if node.left != nil && node.right == nil {
            lonelyNodes.append(node.left!.val)
        } else if node.left == nil && node.right != nil {
            lonelyNodes.append(node.right!.val)
        }
        
        dfs(node.left, &lonelyNodes)
        dfs(node.right, &lonelyNodes)
    }
}
