//
//  TopologicalSort.swift
//  Algorithms
//
//  Created by William Boles on 25/05/2022.
//

import Foundation

struct TopologicalSort {
    
    //Time: O(n + e) where n is the number of vertices in the graph, e is the number of edges in the graph
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
    //
    //Solution Description:
    //Topological sort allow us to order a graphs vertices so that all vertices e.g. `v1`, `v2` and `v3` that have an indegree
    //to `u` are ordered before `u` i.e. [v1, v2, v3, u]. It is useful to think of this as jobs that have dependencies so in
    //the above example `v1`, `v2` and `v3` are dependencies of `u` i.e. for `u` to complete `v1`, `v2` and `v3` need to
    //complete first. Topological sort is only possible on graphs that do not contain cycles i.e. DAGs. As any graph can contain
    //multiple subgraphs we need to visit each vertice in the graph and (potentally) perform a deep-first search from that
    //vertice to all connected vertices. As DFS goes deep before wide, all of vertices connected to vertice e.g. `A` will be
    //searched before the recursive call to `A` returns (think of it like the balanced brackets problem e.g. [A, [B, [C, C], B],
    //A]), we can use this property to detect cycles in our graph - if we find a node has an edge to `A` before `A` has
    //returned then we know that we have a cycle, if however `A` has returned and we find another connection to `A` then all that
    //we have found is another way to get to `A` (and not a cycle). Due to need that we need to detect cycles and also avoid
    //re-searching the same subgraph from different starting vertices we need to track two types of `visited` vertices - vertices
    //who's graph has been searched (`visited`) and vertices who's descendants are still being processed (`currentVisited`), once
    //a vertices descendants have been fully searched we then remove it from `currentVisited`. As the descendants of each vertice
    //is processed we add that vertice to the `ordering` array. Once all vertices have been processed and no cycles found we then
    //reverse `ordering` to get the topological order.
    //
    //N.B. There might a number of ways to produce a valid topological sort of a graph as long as all dependencies are completed
    //first, all those different sorts are valid/correct
    //
    //N.B. The below example is using DFS as seen here:
    //https://en.wikipedia.org/wiki/Topological_sorting#Depth-first_search
    static func sort(_ adjList: [[Int]]) -> [Int]? {
        var visited = Set<Int>() //allows us to avoid searching the same graph but from a different starting vertice
        var ordering = [Int]()
        var cycleDetected = false
        
        for source in 0..<adjList.count {
            var currentVisited = Set<Int>() //allows us to detect a cycle inside this DFS iteration
            
            dfs(adjList, source, &visited, &currentVisited, &ordering, &cycleDetected)
            
            guard !cycleDetected else {
                return nil
            }
        }
        
        return ordering.reversed()
    }
    
    private static func dfs(_ adjList: [[Int]], _ source: Int, _ visited: inout Set<Int>, _ currentVisited: inout Set<Int>, _ ordering: inout [Int], _ cycleDetected: inout Bool) {
        guard !cycleDetected else {
            return
        }
        
        guard !visited.contains(source) else {
            //have found another path onto a graph that has already been searched
            return
        }
        
        visited.insert(source)
        currentVisited.insert(source)
        
        for neighbor in adjList[source] {
            guard !currentVisited.contains(neighbor) else {
                //returned to a previously seen node (in this iteration) so this graph has cycle i.e. isn't a DAG
                cycleDetected = true
                return
            }
            
            dfs(adjList, neighbor, &visited, &currentVisited, &ordering, &cycleDetected)
        }
        
        //all descendants of `source` have been searched so if we encounter `source` again it is from a sibling vertice
        //and shouldn't be treated as a cycle
        currentVisited.remove(source)
        
        //needs to come after we have added all this vertices descendents/neighbors
        ordering.append(source)
    }
}
