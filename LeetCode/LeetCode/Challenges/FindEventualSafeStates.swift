//
//  FindEventualSafeStates.swift
//  LeetCode
//
//  Created by William Boles on 12/07/2023.
//

import Foundation

//https://leetcode.com/problems/find-eventual-safe-states/
//graph theory
struct FindEventualSafeStates {
    
    //Time: O(n + e) where n is the number of vertices, e is the number of edges
    //Space: O(n)
    //graph theory
    //DAG
    //DFS
    //recursive
    //visited
    //sorting
    //directed graph
    //multi-source
    //adjacency list
    //topological sort
    //
    //Solution Description:
    //A key component of topological sort is that as it's sorting it can it can detect cycles in graph. Here we have stripped away
    //the sorting part of topological sort and just kept the cycle detection part. Detecting a cycle in a graph is a little more
    //involved that just tracking the vertices that we have visited, as it is possible to revisit a vertices a number of times in
    //a graph without that revisiting being cycle - different starting vertices connect to that already visited vertice. Rather a
    //a graph has a cycle if we revisit a vertice before we have searched through all of it's descendents (immediate and distant).
    //To do this we need a global visited dictionary (`visited`) to avoid searching from a vertice (subgraph) if it's already been
    //searched and a local visited set (`currentVisited`). It is `currentVisited` that will detect the cycle. As we search from a
    //vertice we add it to our local visited set and only remove it when we are finished searching from that vertice (remember this
    //includes all descendents of that vertice). If searching from that vertices we re-encounter it (or any of it's descendents)
    //then we know that a cycle exists.
    func eventualSafeNodes(_ graph: [[Int]]) -> [Int] {
        var safeNodes = [Int]()
        var visited = [Int: Bool]()

        for i in 0..<graph.count {
            var currentVisited = Set<Int>()
            var detectedCycle = false

            dfs(graph, i, &visited, &currentVisited, &detectedCycle)

            if !detectedCycle {
                safeNodes.append(i)
            }
        }

        return safeNodes
    }
    
    private func dfs(_ adjList: [[Int]], _ source: Int, _ visited: inout [Int: Bool], _ currentVisited: inout Set<Int>, _ detectedCycle: inout Bool) {
        guard !detectedCycle else {
            return
        }
        
        guard visited[source] == nil else {
            //have found another path onto a graph that has already been searched
            detectedCycle = visited[source]!
            return
        }
        
        currentVisited.insert(source)
        
        for neighbor in adjList[source] {
            guard !currentVisited.contains(neighbor) else {
                //returned to a previously seen node (in this iteration) so this graph has cycle i.e. isn't a DAG
                detectedCycle = true
                return
            }
            
            dfs(adjList, neighbor, &visited, &currentVisited, &detectedCycle)
        }
        
        visited[source] = detectedCycle
        
        currentVisited.remove(source)
    }
    
    // MARK: - RecursionWithReturning
    
    //Time: O(n + e) where n is the number of vertices, e is the number of edges
    //Space: O(n)
    //graph theory
    //DAG
    //DFS
    //recursive
    //visited
    //sorting
    //directed graph
    //multi-source
    //adjacency list
    //topological sort
    //
    //Solution Description:
    //A key component of topological sort is that as it's sorting it can it can detect cycles in graph. Here we have stripped away
    //the sorting part of topological sort and just kept the cycle detection part. Detecting a cycle in a graph is a little more
    //involved that just tracking the vertices that we have visited, as it is possible to revisit a vertices a number of times in
    //a graph without that revisiting being cycle - different starting vertices connect to that already visited vertice. Rather a
    //a graph has a cycle if we revisit a vertice before we have searched through all of it's descendents (immediate and distant).
    //To do this we need a global visited dictionary (`visited`) to avoid searching from a vertice (subgraph) if it's already been
    //searched and a local visited set (`currentVisited`). It is `currentVisited` that will detect the cycle. As we search from a
    //vertice we add it to our local visited set and only remove it when we are finished searching from that vertice (remember this
    //includes all descendents of that vertice). If searching from that vertices we re-encounter it (or any of it's descendents)
    //then we know that a cycle exists.
    func eventualSafeNodesReturnResult(_ graph: [[Int]]) -> [Int] {
        var safeNodes = [Int]()
        var visited = [Int: Bool]()
        
        for i in 0..<graph.count {
            var currentVisited = Set<Int>()

            guard !dfsReturnResult(graph, i, &visited, &currentVisited) else {
                continue
            }
            
            safeNodes.append(i)
        }
        
        return safeNodes
    }
    
    private func dfsReturnResult(_ adjList: [[Int]], _ source: Int, _ visited: inout [Int: Bool], _ currentVisited: inout Set<Int>) -> Bool {
        guard visited[source] == nil else {
            //have found another path onto a graph that has already been searched
            return visited[source]!
        }
        
        currentVisited.insert(source)
        
        for neighbor in adjList[source] {
            guard !currentVisited.contains(neighbor) else {
                //returned to a previously seen node (in this iteration) so this graph has cycle i.e. isn't a DAG
                visited[source] = true
                return true
            }
            
            guard !dfsReturnResult(adjList, neighbor, &visited, &currentVisited) else {
                visited[source] = true
                
                return true
            }
        }
        
        visited[source] = false
        
        currentVisited.remove(source)
        
        return false
    }
}
