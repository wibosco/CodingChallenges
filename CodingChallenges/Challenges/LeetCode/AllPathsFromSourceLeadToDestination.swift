//
//  AllPathsFromSourceLeadToDestination.swift
//  CodingChallenges
//
//  Created by William Boles on 04/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/all-paths-from-source-lead-to-destination/
//graph theory
struct AllPathsFromSourceLeadToDestination {
    
    //Time: O(v + e) where `v` is the numbers of vertices/nodes and `e` is the number of edges
    //Space: O(v + e) where `v` is the numbers of vertices/nodes and `e` is the number of edges
    //dfs
    //backtracking
    //adjacency list
    //
    //Solution Description:
    //Build an adjacency list containing all edges. Using DFS we then traverse the graph. As we
    //visit each node we build up a `visited` set which will us to detect a cycle (which makes this
    //graph invalid) if we see that `visited` already contain the node we want to add. As we need
    //to explore all paths we use backtracking allow this to happen. Finally as the destination needs
    //to be a leaf node (and can be the only leaf node) when we encounter a node that has no neighbors
    //we check if it is the `target` and act accordingly.
    //
    //N.B. As we only populate `adjList` with nodes that appear in the `edges` array (and even then only
    //source edges) our `adjList` will not be full. As such when traversing the graph any leaf nodes that
    //we encounter won't be in `adjList` so extra care must be taken here. When a leaf node is found we
    //need to to check if it is the target (as only the target can be a leaf node for this graph to be
    //"valid" - see problem description for details)
    static func leadsToDestination(_ n: Int, _ edges: [[Int]], _ source: Int, _ destination: Int) -> Bool {
        var adjList = [Int: [Int]]()
    
        for edge in edges {
            adjList[edge[0], default: [Int]()].append(edge[1])
        }
        
        var visited = Set<Int>()
        
        return dfs(adjList, source, destination, &visited)
    }
    
    private static func dfs(_ adjList: [Int: [Int]], _ curr: Int, _ target: Int, _ visited: inout Set<Int>) -> Bool {
        //if visited already contains `curr` then we have a cycle
        guard !visited.contains(curr) else { //constraint
            return false
        }
        
        let neighbors = adjList[curr, default: [Int]()]
        
        if neighbors.count > 0 {
            visited.insert(curr)
            
            for neighbor in neighbors { //choice
                if !dfs(adjList, neighbor, target, &visited) {
                    return false //one of the recusive calls has returned false so we do here
                }
            }
            
            visited.remove(curr) //backtrack
        }
        
        return neighbors.count == 0 ? curr == target : true
    }
    
    //Time: O(v + e) where `v` is the numbers of vertices/nodes and `e` is the number of edges
    //Space: O(v + e) where `v` is the numbers of vertices/nodes and `e` is the number of edges
    //dfs
    //backtracking
    //adjacency list
    //
    //Solution Description:
    //Build an adjacency list containing all nodes and edges. As the `destination` needs to be a
    //leaf node - check that condition. Then using DFS traverse the graph. As we visit each node
    //we build up a `visited` set which will us to detect a cycle (which makes this graph invalid)
    //if we see that `visited` already contain the node we want to add. As we need to explore all
    //paths we use backtracking allow this to happen. As we need to explore all paths we use
    //backtracking allow this to happen.
    //
    //N.B. as we build a full adjacency list (containing all nodes) we can quickly determine if the
    //destination node is part of a "valid" (see problem description) tree by check it's a leaf node
    //before undertaking a DFS traversal
    static func leadsToDestinationQuickCheck(_ n: Int, _ edges: [[Int]], _ source: Int, _ destination: Int) -> Bool {
        var adjList = Array(repeating: [Int](), count: n)

        for edge in edges {
            adjList[edge[0]].append(edge[1])
        }

        guard adjList[destination].isEmpty else { //destination needs to be a leaf node
            return false
        }

        var visited = Set<Int>()

        return dfsQuickCheck(adjList, source, destination, &visited)
    }

    private static func dfsQuickCheck(_ adjList: [[Int]], _ curr: Int, _ target: Int, _ visited: inout Set<Int>) -> Bool {
        guard curr != target else { //goal
            return true
        }

        //if visited already contains `curr` then we have a cycle
        guard !visited.contains(curr) else { //constraint
            return false
        }
        
        let neighbors = adjList[curr]
        guard neighbors.count > 0 else { //only the target can be a leaf node
            return false
        }

        visited.insert(curr)

        for neighbor in neighbors { //choice
            if !dfsQuickCheck(adjList, neighbor, target, &visited) {
                return false //one of the recusive calls has returned false so we do here
            }
        }

        visited.remove(curr) //backtrack

        return true
    }
}
