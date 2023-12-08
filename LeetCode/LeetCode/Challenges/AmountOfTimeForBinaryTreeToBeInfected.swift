//
//  AmountOfTimeForBinaryTreeToBeInfected.swift
//  LeetCode
//
//  Created by William Boles on 07/12/2023.
//

import Foundation

//https://leetcode.com/problems/amount-of-time-for-binary-tree-to-be-infected/
struct AmountOfTimeForBinaryTreeToBeInfected {
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(n)
    //binary tree
    //graph theory
    //DFS
    //recursive
    //BFS
    //iterative
    //dictionary
    //visited
    //set
    //adjacency list
    //
    //Solution Description:
    //As we need to travel both down and up the tree after we have found the `start` node and the `TreeNode` type doesn't contain
    //a parent property we need to first covert our tree into a directed graph where an edges exist between `parent->child` and
    //`child->parent` to allow for traversing back up the tree. We build this graph/adjacency-list using DFS. With this adjacency
    //list we can now treat our tree like a directed graph and perform a BFS from `start` until all nodes have been visited - we
    //treat each iteration of `queue` as a minute passing. To void getting caught in a cycle we use a visited array so we only
    //add each node to `queue` once. Once all nodes have been visited, we return `minutes`.
    //
    //Similar to: https://leetcode.com/problems/closest-leaf-in-a-binary-tree/
    static func amountOfTime(_ root: TreeNode?, _ start: Int) -> Int {
        guard let root = root else {
            return -1
        }
        
        var adjList = [Int: [Int]]()
        adjList[root.val] = [Int]()
        buildGraph(root, &adjList)
        
        var queue = [Int]()
        queue.append(start)
        
        var visited = Set<Int>()
        visited.insert(start)
        var minutes = -1 //-1 to avoid over counting
        
        while !queue.isEmpty {
            var nextIteration = [Int]()
            
            for node in queue {
                for neighbor in adjList[node]! {
                    guard !visited.contains(neighbor) else {
                        continue
                    }
                    visited.insert(neighbor)
                    
                    nextIteration.append(neighbor)
                }
            }
            
            queue = nextIteration
            minutes += 1
        }
        
        return minutes
    }
    
    private static func buildGraph(_ node: TreeNode, _ adjList: inout [Int: [Int]]) {
        if let left = node.left {
            adjList[node.val, default: [Int]()].append(left.val)
            adjList[left.val, default: [Int]()].append(node.val)
            
            buildGraph(left, &adjList)
        }
        
        if let right = node.right {
            adjList[node.val, default: [Int]()].append(right.val)
            adjList[right.val, default: [Int]()].append(node.val)
            
            buildGraph(right, &adjList)
        }
    }
}
