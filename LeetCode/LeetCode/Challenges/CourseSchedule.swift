//
//  CourseSchedule.swift
//  LeetCode
//
//  Created by William Boles on 12/04/2023.
//

import Foundation

//https://leetcode.com/problems/course-schedule/
//graph theory
struct CourseSchedule {

    //Time: O(n + e) n is the number of vertices in the graph, e is the number of edges in the graph
    //Space: O(n)
    //graph theory
    //DAG
    //DFS
    //recursive
    //visited
    //directed graph
    //multi-source
    //adjacency list
    //
    //Solution Description:
    //Treating `numCourses` as the vertices in a graph and each `prerequisites` element as an edge between two vertices we
    //first build a adjacency list to allow for easy access to each vertice. A course prerequisite is by it's very nature a
    //a direct edge so a valid prerequisites needs to be acyclic which means that in order for the `prerequisites` to be valid
    //we need to determine if `adjList` contains a DAG. Using DFS topological sort (without the sorting) we can iterate over
    //all verrices in the graph (there is no guarantee that all vertices are connected) and look for any cycles. In order to
    //detect a cycle we need to track the vertices visited in this iteration of the DFS, if we encounter the same vertice
    //twice in our DFS iteration then our graph has a cycle (in a DAG we should be able to search all the descendants of a
    //vertice before we can encounter it again). `currentVisited` allows us to know not just if there is a cycle between
    //parent-child vertices but also between parent and any descendant vertice. Once we have traversed all vertices from a
    //source we remove it from `currentVisited` as any further encounter with that vertice shouldn't be treated as the sign
    //of a cycle. When all possible source vertices has been traversed we can return `cycleDetected`.
    static func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        var adjList = Array(repeating: [Int](), count: numCourses)
        
        for prerequisite in prerequisites {
            let src = prerequisite[1]
            let dst = prerequisite[0]
            
            adjList[src].append(dst)
        }
        
        var visited = Set<Int>()
        var cycleDetected = false
        
        for source in 0..<numCourses {
            var currentVisited = Set<Int>()
            
            dfs(adjList, source, &visited, &currentVisited, &cycleDetected)
            
            guard !cycleDetected else {
                return false
            }
        }
        
        return true
    }
    
    private static func dfs(_ adjList: [[Int]], _ source: Int, _ visited: inout Set<Int>, _ currentVisited: inout Set<Int>, _ cycleDetected: inout Bool) {
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
            
            dfs(adjList, neighbor, &visited, &currentVisited, &cycleDetected)
        }
        
        //all descendants of `source` have been searched so if we encounter `source` again it is from a sibling vertice
        //and shouldn't be treated as a cycle
        currentVisited.remove(source)
    }
}
