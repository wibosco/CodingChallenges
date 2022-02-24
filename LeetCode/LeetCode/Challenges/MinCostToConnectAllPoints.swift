//
//  MinCostToConnectAllPoints.swift
//  CodingChallenges
//
//  Created by William Boles on 07/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/min-cost-to-connect-all-points/
//graph theory
struct MinCostToConnectAllPoints {
    
    //Time: O(n^2)
    //Space: O(n) for the min heap
    //MST - minimum spanning tree
    //greedy
    //Prim's Algorithm - https://en.wikipedia.org/wiki/Prim%27s_algorithm
    //min heap
    //
    //Solution Description:
    //First, calculate all possible edges between all points in the graph. The first vertice is then added to the
    //visited set as a special case - it could have been any vertice in the graph. As this approach uses Prim's
    //algorithm the adjacent vertices of the visited vertice are added to a min heap. A min heap is used to ensure that
    //we always select the min edge ("cheapest") between unconnected vertices. As we are building a tree we know that we
    //will need to add n - 1 edges where n is the number of vertices in the graph - this is what we use for the condition
    //on the while loop. As we inspect the min edge we need to ensure that using it will not create a cycle in the graph
    //by inspecting the `visited` set. If the min edge isn't introducing a cycle we add it's weight to the `total`, add it
    //to the `visited` set and add it's edges to the min heap causes it the potentially reconfig itself.
    static func minCostConnectPoints(_ points: [[Int]]) -> Int {
        //sort
        var adjList = Array(repeating: [GraphWeightedEdge](), count: points.count)
        for i in 0..<points.count {
            for j in 0..<points.count where i != j {
                let p1 = points[i]
                let p2 = points[j]
                
                //manhattan distance |xi - xj| + |yi - yj|
                let weight = (abs((p1[0] - p2[0])) + abs((p1[1] - p2[1])))
                let edge = GraphWeightedEdge(source: i, destination: j, weight: weight)
                adjList[i].append(edge)//just append or sort
            }
        }
        
        //greedy
        var visited = Set<Int>()
        visited.insert(0)
        
        var minHeap = Heap(elements: adjList[0]) { $0.weight < $1.weight }
        
        var total = 0
        var edgesToConnect = (points.count - 1) //a tree has n - 1 edges where n is the number of vertices
        
        while edgesToConnect > 0 {
            while !minHeap.isEmpty && visited.contains(minHeap.peek()!.destination) { //avoid adding any cycles
                minHeap.dequeue()
            }
            
            guard let edge = minHeap.dequeue() else {
                break
            }
            
            total += edge.weight
            
            visited.insert(edge.destination)
            minHeap.enqueue(adjList[edge.destination]) //add new possibble edges to the heap to choose from
            edgesToConnect -= 1
        }
        
        return total
    }
    
    //Time: O(n^2) where `n` is the number of points
    //Space: O(n)
    //MST - minimum spanning tree
    //disjoint set
    //greedy
    //Kruskal’s Algorithm - https://en.wikipedia.org/wiki/Kruskal%27s_algorithm
    //
    //Solution Description:
    //First, calculate all possible edges between all points in the graph. These edges in then sorted in ascending order
    //ensuring the "cheapest" edges will be processed first. As this approach uses Kruskal’s's algorithm we loop through
    //the sorted edges that we build and use the union-find process (disjoint sets) to connect the vertices. As we are
    //building a tree we need to ensure that no cycles are being created when we add nodes so for any edge that would
    //create a cycle we skip over. Finally because a tree has n - 1 edges where n is the number of vertices when we reach
    //this value we have our MST.
    static func minCostConnectPointsKruskal(_ points: [[Int]]) -> Int {
        //sort
        var edges = [GraphWeightedEdge]()
        
        for i in 0..<points.count { //O(n^2)
            for j in i..<points.count where i != j {
                let p1 = points[i]
                let p2 = points[j]
                
                //manhattan distance |xi - xj| + |yi - yj|
                let weight = (abs((p1[0] - p2[0])) + abs((p1[1] - p2[1])))
                let edge = GraphWeightedEdge(source: i, destination: j, weight: weight)
                
                edges.append(edge)
            }
        }
        
        edges.sort{ $0.weight < $1.weight } //O(n log n)
        
        //greedy
        var total = 0
        let unionFind = UnionFind(count: points.count)
        var edgesToConnect = (points.count - 1) //a tree has n - 1 edges where n is the number of vertices
        
        for edge in edges {
            if unionFind.union(edge.source, edge.destination) {
                total += edge.weight
                edgesToConnect -= 1
                
                if edgesToConnect == 0 {
                    break
                }
            }
        }
        
        return total
    }
}

//Union-by-rank/disjoint set
//see: https://www.youtube.com/watch?v=wU6udHRIkcc
//
//Can only be applied on undirected graphs
//
//Solution Description:
//1. Each vertice is given an initial value of -1 to indicate
//   that they are their own root
//2. Perform a union between two vertices by finding the root
//   of each vertice (this will be a negative number). This root
//   may not be directly associated with the vertice but instead
//   require multiple steps hence the while loop in `find`
//3. Compare the size of the nodes assoicated with each vertices
//   root and select the root with the most nodes i.e. lowest
//   negative value. Update the smaller root to point at the other
//   root and update the other roots count to include the count that
//   the former root had
private class UnionFind {
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
            //x and y are already in the same set, so performing
            //this union will result in introducing a cycle into
            //this graph.
            return false
        }
        
        //join the smaller graph with larger. If both are the same
        //size then favour `x`
        if ranks[xRoot] <= ranks[yRoot] { //careful with the comparison here as the larger root has a smaller value (due to being negative)
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