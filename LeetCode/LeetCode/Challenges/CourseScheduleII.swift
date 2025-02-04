//
//  CourseScheduleII.swift
//  LeetCode
//
//  Created by William Boles on 23/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/course-schedule-ii/
//graph theory
struct CourseScheduleII {
    
    //Time: O(n + e) n is the number of vertices in the graph, e is the number of edges in the graph
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
    //inout
    //
    //Solution Description:
    //Topological sort allow us to order a graphs vertices so that all vertices e.g. `v1`, `v2` and `v3` that have an indegree
    //to `u` are ordered before `u` i.e. [v1, v2, v3, u]. It is useful to think of this as jobs that have dependencies so in
    //the above example `v1`, `v2` and `v3` are dependencies of `u` i.e. for `u` to complete `v1`, `v2` and `v3` need to
    //complete first. Topological sort is only possible on graphs that do not contain cycles i.e. DAGs. As any graph can contain
    //multiple subgraphs we need to visit each vertice in the graph and (potentially) perform a deep-first search from that
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
    func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        guard numCourses > 1 else {
            return [0]
        }
        
        var adjList = Array(repeating: [Int](), count: numCourses)
        
        for prerequisite in prerequisites {
            let src = prerequisite[1]
            let dst = prerequisite[0]
            
            adjList[src].append(dst)
        }
        
        var visited = Set<Int>() //allows us to avoid searching the same graph but from a different starting vertice
        var ordering = [Int]()
        var cycleDetected = false
        
        for source in 0..<adjList.count {
            var currentVisited = Set<Int>() //allows us to detect a cycle inside this DFS iteration
            
            dfs(adjList, source, &visited, &currentVisited, &ordering, &cycleDetected)
            
            guard !cycleDetected else {
                return []
            }
        }
        
        return ordering.reversed()
    }
    
    private func dfs(_ adjList: [[Int]], _ source: Int, _ visited: inout Set<Int>, _ currentVisited: inout Set<Int>, _ ordering: inout [Int], _ cycleDetected: inout Bool) {
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
        
        ordering.append(source)
    }
    
    //Time: O(n * m) where n is number of courses and m is number of prerequisites
    //Space: O(n * m)
    //BFS
    //multi-source
    //indegree
    //outdegree
    //topological order
    //adjacency list
    //
    //Solution Description:
    //Using an adjacency list build up the out-going edges for each course to then use during BFS traversal. Also build up a count
    //of the in-degree for each course - in order for a course to be taken, all prerequisite course must have been taken first,
    //the `inDegrees` array will ensure this. As we can have multiple starting courses (courses with no prerequisites i.e
    //in-degree == 0) we add these first to the queue. Using BFS we then traverse the graph adding new courses to the queue when
    //they no longer have any outstanding prerequisites. Each course in the queue is added to the `order` array. Once the queue
    //is empty we check if the `order` arrays count is equal to `numCourses` and if so return that order and if not return any
    //empty array as some courses couldn't be taken - dependency cycle.
    //
    //In graph theory a `*degree` is either the number of incoming (`inDegree`) and outgoing (`outDegree`) edges.
    func findOrderBFS(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        guard numCourses > 1 else {
            return [0]
        }
        
        var adjList = Array(repeating: [Int](), count: numCourses)
        var inDegrees = Array(repeating: 0, count: numCourses)//hold how many prerequisites a course has
        
        for p in prerequisites {
            adjList[p[1]].append(p[0])
            inDegrees[p[0]] += 1 //course at p[0] has one more prerequisites than it did before
        }
        
        var queue = [Int]()
        
        for (i, inDegree) in inDegrees.enumerated() {
            if inDegree == 0 { //courses that don't have prerequisites
                queue.append(i)
            }
        }
        
        var order = [Int]()
        
        while !queue.isEmpty {
            var newQueueItems = [Int]()
            
            for node in queue {
                order.append(node)
                
                for n in adjList[node] {
                    inDegrees[n] -= 1
                    guard inDegrees[n] == 0 else { //use inDegrees as a kind-of visited set
                        continue
                    }
                    
                    newQueueItems.append(n)
                }
            }
            
            queue = newQueueItems
        }
        
        if order.count == numCourses { //check if graph contains a dependency cycle between courses i.e. A -> B -> A
            return order
        } else {
            return [Int]()
        }
    }
}
