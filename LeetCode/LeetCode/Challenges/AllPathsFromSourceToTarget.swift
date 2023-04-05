//
//  AllPathsFromSourceToTarget.swift
//  LeetCode
//
//  Created by William Boles on 01/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/all-paths-from-source-to-target/
//graph theory
struct AllPathsFromSourceToTarget {

    //Time: O(
    //Space: O(
    //BFS
    //
    //Solution Description:
    //Using BFS traverse through the graph. As we want to find all paths to the target (rather than just the shortest), the queue
    //used contains not just the node to visit but also the path that lead to that point. If the dequeued node is the target, add
    //the path that got us here to the `paths` array and contine until the queue is empty i.e. all nodes have been visited.
    static func allPathsSourceTarget(_ graph: [[Int]]) -> [[Int]] {
        let target = graph.count - 1
        var paths = [[Int]]()

        var queue = [(0, [0])] //(node, path)
        while !queue.isEmpty {
            let item = queue.removeFirst()
            let node  = item.0
            let path = item.1
            
            guard node != target else {
                paths.append(path)
                continue
            }
            
            for neighbor in graph[node] {
                queue.append((neighbor, path + [neighbor]))
            }
        }
        
        return paths
    }
    
    //Time: O(2^N * N)
    //Space: O(2^N * N)
    //DFS
    //backtracking
    //
    //Solution Description:
    //Perform a recusive DFS search through the graph, keeping track of the current path. If we find the target then that `path`
    //is added to the `paths` array. As we move back up the recusive call stack we remove the current node from the `path` array.
    static func allPathsSourceTargetDFS(_ graph: [[Int]]) -> [[Int]] {
        let target = graph.count - 1
        var paths = [[Int]]()
        var path = [0]
        
        dfs(graph, curr: 0, target: target, path: &path, paths: &paths)
        
        return paths
    }
    
    private static func dfs(_ graph: [[Int]], curr: Int, target: Int, path: inout [Int], paths: inout [[Int]]) {
        defer {
            _ = path.popLast() //backtracking by removing the last element from the path
        }
        
        //Goal
        guard curr != target else {
            paths.append(path)
            
            return
        }
        
        //Choice
        for next in graph[curr] {
            path.append(next)
            dfs(graph, curr: next, target: target, path: &path, paths: &paths)
        }
    }
}
