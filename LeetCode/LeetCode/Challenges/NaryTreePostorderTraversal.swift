// Created 12/05/2025.

import Foundation

//https://leetcode.com/problems/n-ary-tree-postorder-traversal/
struct NaryTreePostorderTraversal {
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(n)
    //DFS
    //iterative
    //postorder
    //
    //Solution Description:
    //Using DFS we iterate through through all the nodes in the tree. As an iterative stack doesn't unwind like a recursive stack
    //does so we can't use a single stack to produce to produce a postorder array, instead we produce a preorder array and then
    //once all nodes have been visited we reverse that array to get the postorder array which is then returned.
    func postorder(_ root: NaryTreeNode?) -> [Int] {
        guard let root else {
            return [Int]()
        }
        
        var order = [Int]()
        var stack = [NaryTreeNode]()
        stack.append(root)
        
        while let node = stack.popLast() {
            order.append(node.val)
            
            for child in node.children {
                stack.append(child)
            }
        }
                
        return order.reversed()
    }
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(n)
    //n-ary tree
    //DFS
    //recursive
    //inout
    //postorder
    //bottom-up
    //
    //Solution Description:
    //Using DFS we iterate through through all the nodes in the tree. As the recursive stack unwinds we add each node to `order`.
    //Once all nodes have been visited we return `order`.
    func postorder2(_ root: NaryTreeNode?) -> [Int] {
        var order = [Int]()
            
        dfs(root, &order)
        
        return order
    }
    
    private func dfs(_ root: NaryTreeNode?, _ order: inout [Int]) {
        guard let root else {
            return
        }
        
        for child in root.children {
            dfs(child, &order)
        }
        
        order.append(root.val)
    }
}
