//
//  DeleteNodesAndReturnForest.swift
//  LeetCode
//
//  Created by William Boles on 16/11/2023.
//

import Foundation

//https://leetcode.com/problems/delete-nodes-and-return-forest/
struct DeleteNodesAndReturnForest {
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(n)
    //binary tree
    //DFS
    //recursive
    //top-down
    //bottom-up
    //inout
    //
    //Solution Description:
    //Using DFS we preform a top-down approach for determining if a node should be deleted and a bottom-up approach for actually 
    //deleting the nodes by assigning either the original node back to it's parent or nil. In order to hold onto the roots, we
    //add each root node to `roots`.
    static func delNodes(_ root: TreeNode?, _ to_delete: [Int]) -> [TreeNode?] {
        let toBeDeleted = Set(to_delete)
        var roots = [TreeNode]()
        
        _ = dfs(root, toBeDeleted, true, &roots)
        
        return roots
    }
    
    private static func dfs(_ node: TreeNode?, _ toBeDeleted: Set<Int>, _ isRoot: Bool, _ roots: inout [TreeNode]) -> TreeNode? {
        guard let node = node else {
            return nil
        }
        
        let shouldDelete = toBeDeleted.contains(node.val)
        
        if !shouldDelete && isRoot {
            roots.append(node)
        }
        
        node.left = dfs(node.left, toBeDeleted, shouldDelete, &roots) //shouldDelete will determine if node.left is a root
        node.right = dfs(node.right, toBeDeleted, shouldDelete, &roots) //shouldDelete will determine if node.left is a root
        
        return shouldDelete ? nil : node
    }
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(n)
    //binary tree
    //BFS
    //iterative
    //
    //Solution Description:
    //Using BFS we traverse the nodes in the tree and break the connection between parent and "to-be-deleted" nodes. In order to 
    //hold onto the roots, we add each root node to `roots`.
    static func delNodesBFS(_ root: TreeNode?, _ to_delete: [Int]) -> [TreeNode?] {
        guard let root = root else {
            return []
        }
        
        let toBeDeleted = Set(to_delete)
        
        var roots = [Int: TreeNode]() //TreeNode does not conform to hashable so using dict rather than set
        roots[root.val] = root
        
        var queue = [(TreeNode?, TreeNode, Int)]() //parent, child, left(0)/right(1)/root(-1)
        queue.append((nil, root, -1))
        
        while !queue.isEmpty {
            var nextIteration = [(TreeNode?, TreeNode, Int)]()
            
            for (parent, node, side) in queue {
                if toBeDeleted.contains(node.val) {
                    if side == 0 { //left
                        parent?.left = nil
                    } else if side == 1 { //right
                        parent?.right = nil
                    }
                    
                    //handle case where a root is being deleted
                    roots.removeValue(forKey: node.val)
                    
                    //child nodes now become roots
                    if let left = node.left {
                        roots[left.val] = left
                    }
                    
                    if let right = node.right {
                        roots[right.val] = right
                    }
                }
                
                //still add child nodes regardless of deleted state
                if let left = node.left {
                    nextIteration.append((node, left, 0))
                }
                
                if let right = node.right {
                    nextIteration.append((node, right, 1))
                }
            }
            
            queue = nextIteration
        }
        
        return Array(roots.values)
    }
}
