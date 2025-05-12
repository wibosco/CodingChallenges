// Created 12/05/2025.

import Foundation

//https://leetcode.com/problems/n-ary-tree-preorder-traversal/
struct NaryTreePreorderTraversal {
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(n)
    //n-ary
    //stack
    //DFS
    //iterative
    //preorder
    //
    //Solution Description:
    //Using DFS we iterate through through all the nodes in the tree. When each becomes the root of it's own subtree we add
    //it to `order`. Once all nodes have been processed we return `order`.
    func preorder(_ root: NaryTreeNode?) -> [Int] {
        guard let root else {
            return [Int]()
        }
        
        var order = [Int]()
        var stack = [NaryTreeNode]()
        stack.append(root)
        
        while let node = stack.popLast(){
            order.append(node.val)
            
            for child in node.children.reversed() { //reverse so that the left-most node is at the top of the stack
                stack.append(child)
            }
        }
        
        return order
    }
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(n)
    //n-ary
    //stack
    //DFS
    //recursive
    //preorder
    //inout
    //
    //Solution Description:
    //Using DFS we iterate through through all the nodes in the tree. When each becomes the root of it's own subtree we add
    //it to `order`. Once all nodes have been processed we return `order`.
    func preorder2(_ root: NaryTreeNode?) -> [Int] {
        var order = [Int]()
        
        dfs(root, &order)
        
        return order
    }
    
    private func dfs(_ root: NaryTreeNode?, _ order: inout [Int]) {
        guard let root else {
            return
        }
        
        order.append(root.val)
        
        for child in root.children {
            dfs(child, &order)
        }
    }
}
