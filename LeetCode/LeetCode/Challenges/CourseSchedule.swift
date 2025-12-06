// Created 12/04/2023.

import Foundation

//https://leetcode.com/problems/course-schedule/
struct CourseSchedule {

    //Time: O(n + e) n is the number of vertices in the graph
    //               where e is the number of edges in the graph
    //Space: O(n)
    //graph theory
    //DAG
    //DFS
    //recursive
    //visited
    //directed graph
    //multi-source
    //adjacency list
    //topological sort
    //backtracking
    //cycle detection
    //inout
    //
    //Solution Description:
    //Treating `numCourses` as the vertices in a graph and each `prerequisites` element as an edge between two vertices we
    //first build a adjacency list to allow for easy access to each vertice and use that adjacency list to detect the presence
    //of a cycle or not. A course prerequisite is by it's very nature a a direct edge so a valid prerequisites needs to be
    //acyclic which means that in order for the `prerequisites` to be valid we need to determine if `adjList` contains a DAG.
    //Using DFS topological sort (without the sorting) we can iterate over all vertices in the graph (there is no guarantee
    //that all vertices are connected) and look for any cycles. In order to detect a cycle we need to track which vertices are
    //currently on the call stack of this DFS, if we encounter the same vertice twice then the graph has a cycle (in a DAG we
    //should be able to search all the descendants of a vertice before we can encounter it again). Note, that the call stack
    //will not contain all vertices that this DFS has seen, only those that have descendents still be processed - a vertice
    //being visited multiple times doesn't necessarily mean there is a cycle, it is only a cycle if that vertice is being
    //re-visited by one of it's own descendents (hasn't got to be a direct descendent). As there is no quick way to search the
    //actual callstack for a given node we use `callStack` as a stand-in. Being a set, `callstack `allows us to query if a
    //vertice is repeated in O(1) time. Once we have traversed all vertices from a source we remove it from `callstack` as any
    //further encounter with that vertice shouldn't be treated as the sign of a cycle. When all possible source vertices has
    //been traversed we can return `cycleDetected`. To avoid re-searching the same graph from a different starting vertice we
    //use `visited` to hold those vertices already visited.
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        var adjList = Array(repeating: [Int](), count: numCourses)
        
        for prerequisite in prerequisites {
            let src = prerequisite[1]
            let dst = prerequisite[0]
            
            adjList[src].append(dst)
        }
        
        var visited = Set<Int>()
        var cycleDetected = false
        
        for source in 0..<numCourses {
            var callStack = Set<Int>()
            
            dfs(adjList, source, &visited, &callStack, &cycleDetected)
            
            guard !cycleDetected else {
                return false
            }
        }
        
        return true
    }
    
    private func dfs(_ adjList: [[Int]], _ source: Int, _ visited: inout Set<Int>, _ callStack: inout Set<Int>, _ cycleDetected: inout Bool) {
        guard !cycleDetected else {
            return
        }
        
        guard !visited.contains(source) else {
            //have found another path onto a graph that has already been searched
            return
        }
        
        visited.insert(source)
        callStack.insert(source)
        
        for neighbor in adjList[source] {
            //needs to be here to avoid crashing with `visited`
            guard !callStack.contains(neighbor) else {
                //returned to a previously seen node (in this iteration) so this graph has cycle i.e. isn't a DAG
                cycleDetected = true
                return
            }
            
            dfs(adjList, neighbor, &visited, &callStack, &cycleDetected)
        }
        
        //all descendants of `source` have been searched so if we encounter `source` again it is from a sibling vertice
        //and shouldn't be treated as a cycle
        callStack.remove(source)
    }
    
    //Time: O(n + e) n is the number of vertices in the graph
    //               where e is the number of edges in the graph
    //Space: O(n)
    //graph theory
    //DAG
    //DFS
    //recursive
    //visited
    //directed graph
    //multi-source
    //adjacency list
    //topological sort
    //backtracking
    //cycle detection
    //inout
    //bottom-up
    //
    //Solution Description:
    //Treating `numCourses` as the vertices in a graph and each `prerequisites` element as an edge between two vertices we
    //first build a adjacency list to allow for easy access to each vertice and use that adjacency list to detect the presence
    //of a cycle or not. A course prerequisite is by it's very nature a a direct edge so a valid prerequisites needs to be
    //acyclic which means that in order for the `prerequisites` to be valid we need to determine if `adjList` contains a DAG.
    //Using DFS topological sort (without the sorting) we can iterate over all vertices in the graph (there is no guarantee
    //that all vertices are connected) and look for any cycles. In order to detect a cycle we need to track which vertices are
    //currently on the call stack of this DFS, if we encounter the same vertice twice then the graph has a cycle (in a DAG we
    //should be able to search all the descendants of a vertice before we can encounter it again). Note, that the call stack
    //will not contain all vertices that this DFS has seen, only those that have descendents still be processed - a vertice
    //being visited multiple times doesn't necessarily mean there is a cycle, it is only a cycle if that vertice is being
    //re-visited by one of it's own descendents (hasn't got to be a direct descendent). As there is no quick way to search the
    //actual callstack for a given node we use `callStack` as a stand-in. Being a set, `callstack `allows us to query if a
    //vertice is repeated in O(1) time. Once we have traversed all vertices from a source we remove it from `callstack` as any
    //further encounter with that vertice shouldn't be treated as the sign of a cycle. If a cycle is detected we return false
    //else when all possible source vertices has been traversed we return true. To avoid re-searching the same graph from
    //a different starting vertice we use `visited` to hold those vertices already visited.
    func canFinish2(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        var adjList = Array(repeating: [Int](), count: numCourses)

        for p in prerequisites {
            adjList[p[0]].append(p[1])
        }

        var visited = Set<Int>()
        for i in 0..<adjList.count {
            var callStack = Set<Int>()
            callStack.insert(i)
            if !dfs(adjList, i, &callStack, &visited) {
                return false
            }
        }

        return true
    }

    private func dfs(_ adjList: [[Int]], _ i: Int, _ callStack: inout Set<Int>, _ visited: inout Set<Int>) -> Bool {
        guard !visited.contains(i) else {
            return true //must not contain a cycle otherwise we won't be here
        }
        visited.insert(i)
        
        for neighbor in adjList[i] {
            //needs to be here to avoid crashing with `globalVisited`
            guard !callStack.contains(neighbor) else {
                //returned to a previously seen node (in this iteration) so this graph has cycle i.e. isn't a DAG
                return false
            }
            callStack.insert(neighbor)

            if !dfs(adjList, neighbor, &callStack, &visited) {
                return false
            }
        }

        //need to backtrack here as all neighbors from `i` have been searched and no cycle was detected - this avoids a false
        //positive in future search if `i` is revisited from a different independent dependency chain.
        callStack.remove(i)

        return true
    }
}
