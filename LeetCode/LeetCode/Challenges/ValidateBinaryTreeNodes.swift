// Created 23/02/2024.

import Foundation

//https://leetcode.com/problems/unique-binary-search-trees-ii/
struct ValidateBinaryTreeNodes {
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(n)
    //binary tree
    //array
    //DFS
    //visited
    //inout
    //
    //Solution Description:
    //Binary Tree have certain rules:
    //
    // 1. One root node
    // 2. No cycles
    // 3. Non-root nodes have one parent
    // 4. All nodes are connected
    //
    //Using these rules we can determine if we have a binary tree. First we verify rule 1 - to find the root we iterate
    //through all nodes and track which children they have - the root is the node that doesn't appear as a child of another
    //node. If more than one root is returned then we know that this isn't a valid binary tree and can return false. Next
    //using DFS we verify rule 2 and 3, by traversing from the root all connected nodes. we track the nodes that we have
    //visited using a `visited` set - this allows us to detect cycles and multiple parents as we should only visit each
    //node a maximum of once. If we encounter a node twice we return false. Finally we verify rule 4 by ensuring that our
    //DFS visited all nodes by comparing the `visited` count against `n`.
    func validateBinaryTreeNodes(_ n: Int, _ leftChild: [Int], _ rightChild: [Int]) -> Bool {
        let roots = findRoot(n, leftChild, rightChild)
        
        guard roots.count == 1 else {
            return false
        }
        
        var visited = Set<Int>()
        
        return dfs(roots.first!, leftChild, rightChild, &visited) && visited.count == n
    }
    
    private func findRoot(_ n: Int, _ leftChild: [Int], _ rightChild: [Int]) -> [Int] {
        var roots = Set<Int>(Array(0..<n))
        
        for i in 0..<n {
            roots.remove(leftChild[i])
            roots.remove(rightChild[i])
        }
        
        return Array(roots)
    }
    
    private func dfs(_ node: Int, _ leftChild: [Int], _ rightChild: [Int], _ visited: inout Set<Int>) -> Bool {
        guard node > -1 else {
            return true
        }
        
        guard !visited.contains(node) else {
            return false
        }
        
        visited.insert(node)
        
        return dfs(leftChild[node], leftChild, rightChild, &visited) && dfs(rightChild[node], leftChild, rightChild, &visited)
    }
}
