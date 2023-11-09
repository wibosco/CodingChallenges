//
//  GraphValidTree.swift
//  LeetCode
//
//  Created by William Boles on 29/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/graph-valid-tree/
struct GraphValidTree {
    
    //Time: O(n + e) where n is the number of nodes
    //               where e is the number of edges
    //Space: O(n + e)
    //graph theory
    //DFS
    //recursive
    //adjacency list
    //undirected
    //cycle detection
    //inout
    //
    //Solution Description:
    //A valid tree has one root (all nodes need to be connected) and no cycles. First a check is made to ensure that edges are
    //not too few or too many. Then we converted the edges into an adjacency list - this will allow us to know all the out going
    //edges for any given node. As this is an undirected graph, we add `A -> B` and `B -> A` into the adjacency list. We need to
    //do this as we are not given the (potential) root node of our tree so we may need to travel up and as well as down. Next
    //using DFS we traverse the adjacency list. To detect loops in graph we store each node we encounter in the `visited` set -
    //if we encounter a node that we have already visited then we know we have a loop and this graph can not be a valid tree.
    //The exception to this rule is if we encounter a "simple/trivial" loop e.g. `A -> B` and `B -> A` - this is a loop in our
    //graph but as explained a needed path as we don't know which node is the root. To avoid treating this simple loop and a
    //loop we need to treat `A -> B` and `B -> A` as the same path, to do this we store each path we encounter in the `paths`
    //dictionary, with the source node as the key and the destination as an element in a set (value). We then if `node` already
    //exists in `paths` and if `neighbor` is already in the value set. If `neighbor` is in the value set then we can skip this
    //path; if `neighbor` isn't then this in an untraversed path and we check if `neighbor` already exists in `paths` (as a key)
    //If `neighbor` exists as a key in `paths` then we know that we can already visited this node and that this graph has a
    //"complex" loop so can't be a tree. If we run through all edges from a given node and haven't detected a loop we then just
    //need to check if we actually visited each node in the graph. We haven't visited each node then it means that there are
    //isolated nodes in the graph so this graph isn't a tree
    //
    //
    //N.B. In the BFS solution we use a `visited` set and a `paths` set (with sets inside) we could have taken this approach
    //here (or the BFS could have taken this approach) however by using the `paths` dictionary we are able to consolidate both
    //`visited` and `paths` sets into the one data structure. If the "parent" node already exists in the visited `paths`
    //dictionary we check if it has `neighbor` i.e. in the past have we travelled `node -> neighbor` and are now trying to
    //travel `neighbor -> node`. If `neighbor` exists in the set of `node` then we skip, if not we check if `neighbor` exists
    //as a key in `paths`. If `neighbor` is a key, we have a loop.
    static func validTree(_ n: Int, _ edges: [[Int]]) -> Bool {
        //For the graph to be a valid tree, it must have exactly `n - 1` edges.
        //Any less, and it can't possibly be fully connected. Any more, and
        //it has to contain cycles.
        guard edges.count == (n - 1) else {
            return false
        }
        
        var adjList = Array(repeating: [Int](), count: n)
        
        for edge in edges {
            let src = edge[0]
            let dst = edge[1]
            
            //undirected graph so need to add both paths
            adjList[src].append(dst)
            adjList[dst].append(src)
        }
        
        var paths = [Int: Set<Int>]() //A set within a this dictionary will allow us to treat A -> B the same as B -> A
        paths[0] = Set<Int>() //any node could be our starting point
        
        var cycleDetected = false
        
        dfs(0, adjList, &paths, &cycleDetected)
        
        if cycleDetected {
            return false
        }
        
        return paths.count == n
    }
    
    private static func dfs(_ node: Int, _ adjList: [[Int]], _ paths: inout [Int: Set<Int>], _ cycleDetected: inout Bool) {
        guard !cycleDetected else {
            return
        }
        
        for neighbor in adjList[node] {
            if let outGoings = paths[node] { //note that we check if `path` contains `node` not `neighbor`
                if outGoings.contains(neighbor) {
                    continue //"simple" loops detected i.e. `A -> B` and `B -> A` - skip
                }
            }
            
            guard paths[neighbor] == nil else { //already visited `neighbor`
                cycleDetected = true //"complex" loop detected i.e. `A -> B` and `A -> C -> B` - can't be a tree
                return
            }
            
            paths[neighbor, default: Set<Int>()].insert(node)
            dfs(neighbor, adjList, &paths, &cycleDetected)
        }
    }
    
    //Time: O(n + e) where n is the number of nodes
    //               where e is the number of edges
    //Space: O(n + e)
    //graph theory
    //BFS
    //visited
    //adjacency list
    //undirected graph
    //
    //Solution Description:
    //A valid tree has one root (all nodes need to be connected) and no cycles. First a check is made to ensure that edges are
    //not too few or too many. Then we converted the edges into an adjacency list - this will allow us to know all the out going
    //edges for any given node. As this is an undirected graph, we add `A -> B` and `B -> A` into the adjacency list. We need to
    //do this as we are not given the (potential) root node of our tree so we may need to travel up and as well as down. Next
    //using BFS we traverse the adjacency list. To detect loops in graph we store each node we encounter in the `visited` set -
    //if we encounter a node that we have already visited then we know we have a loop and this graph can not be a valid tree.
    //The exception to this rule is if we encounter a "simple/trivial" loop e.g. `A -> B` and `B -> A` - this is a loop in our
    //graph but as explained a needed path as we don't know which node is the root. To avoid treating this simple loop and a
    //loop we need to treat `A -> B` and `B -> A` as the same path, to do this we store each path we encounter in the `paths`
    //set, if we encounter a path that we have already traversed we skip that path. This ensures that we avoid simple loops but
    //are able to detect complex loops e.g. `A -> B` and `A -> C -> B` being present - here we end up back at `B` via `C`. If we
    //run through all edges from a given node and haven't detected a loop we then just need to check if we actually visited each
    //node in the graph. We haven't visited each node then it means that there are isolated nodes in the graph so this graph
    //isn't a tree.
    static func validTreeBFS(_ n: Int, _ edges: [[Int]]) -> Bool {
        //For the graph to be a valid tree, it must have exactly `n - 1` edges.
        //Any less, and it can't possibly be fully connected. Any more, and
        //it has to contain cycles.
        guard edges.count == (n - 1) else {
            return false
        }
        
        var adjList = Array(repeating: [Int](), count: n)
        
        for edge in edges {
            let src = edge[0]
            let dst = edge[1]
            
            //undirected graph so need to add both paths
            adjList[src].append(dst)
            adjList[dst].append(src)
        }
        
        var queue = [0]
        var visited = Set<Int>()
        visited.insert(0)
        
        var paths = Set<Set<Int>>() //A set within a set will allow us to treat A -> B the same as B -> A
        
        while !queue.isEmpty {
            var newQueueItems = [Int]()
            
            for node in queue {
                for neighbor in adjList[node] {
                    var path = Set<Int>()
                    path.insert(neighbor)
                    path.insert(node)
                    
                    guard !paths.contains(path) else { //skip "simple" loops i.e. A -> B and B -> A
                        continue
                    }
                    
                    paths.insert(path)
                    
                    guard !visited.contains(neighbor) else { //check for "complex" loops
                        return false
                    }
                    
                    visited.insert(neighbor)
                    newQueueItems.append(neighbor)
                }
            }
            
            queue = newQueueItems
        }
        
        return visited.count == n //check for isolated nodes
    }
    
    //Time: O(e) where e is the number of edges
    //Space: O(n) where n is the number of nodes
    //graph theory
    //union find
    //disjoint set
    //undirected graph
    //
    //Solution Description:
    //A valid tree has one root (all nodes need to be connected) and no cycles by using a disjoint set we can test for both
    //conditions. First a check is made to ensure that edges are not too few or too many and then a check is that connecting
    //the nodes together does not result in a cycle
    static func validTreeDisjointSet(_ n: Int, _ edges: [[Int]]) -> Bool {
        //For the graph to be a valid tree, it must have exactly `n - 1` edges.
        //Any less, and it can't possibly be fully connected. Any more, and
        //it has to contain cycles.
        guard edges.count == (n - 1) else {
            return false
        }
        
        let disjointSet = UnionFind(count: n)
        
        for edge in edges {
            if !disjointSet.union(edge[0], edge[1]) {
                return false //a cycle was found so this can't be a valid tree
            }
        }
        
        return true
    }
}

//Union-by-rank/disjoint set
//See: https://www.youtube.com/watch?v=wU6udHRIkcc
//
//Can only be applied on undirected graphs
//
//Solution Description:
//1. Each vertice is given an initial value of -1 to indicate that they are their own root
//2. Perform a union between two vertices by finding the root of each vertice (this will be a negative number). This root may
//   not be directly associated with the vertice but instead require multiple steps hence the while loop in `find`
//3. Compare the size of the nodes associated with each vertices root and select the root with the most nodes i.e. lowest
//   negative value. Update the smaller root to point at the other root and update the other roots count to include the count
//   that the former root had
private final class UnionFind {
    private(set) var ranks: [Int]
    
    // MARK: - Init
    
    init(count: Int) {
        ranks = Array(repeating: -1, count: count)
    }
    
    // MARK: - Operations
    
    func find(_ x: Int) -> Int { //O(1)
        guard ranks[x] >= 0 else { // 0 is valid as an array index
            return x
        }
        ranks[x] = find(ranks[x]) //update ranks[x] to point nearer to the root of this set so speeding up finding
        return ranks[x]
    }
    
    @discardableResult
    func union(_ x: Int, _ y: Int) -> Bool { //O(1)
        let xRoot = find(x)
        let yRoot = find(y)
        
        guard xRoot != yRoot else {
            //x and y are already in the same set, so performing this union will result in introducing a cycle into
            //this graph.
            return false
        }
        
        //join the smaller graph with larger. If both are the same size then favour `x`
        if ranks[xRoot] <= ranks[yRoot] { //careful with the comparison as the larger root has a smaller value (due to being negative)
            let tmp = ranks[yRoot]
            ranks[yRoot] = xRoot
            ranks[xRoot] += tmp //increasing the value as this index, increases the rank of that root
        } else {
            let tmp = ranks[xRoot]
            ranks[xRoot] = yRoot
            ranks[yRoot] += tmp //increasing the value as this index, increases the rank of that root
        }
        
        return true
    }
    
    func connected(_ x: Int, _ y: Int) -> Bool {
        return find(x) == find(y)
    }
}
